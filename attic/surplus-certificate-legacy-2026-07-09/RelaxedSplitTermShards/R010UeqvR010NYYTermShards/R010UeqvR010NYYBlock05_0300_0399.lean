/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 5:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_05_0300_0399 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0300 : Poly :=
[
  term ((3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0300 : Poly :=
[
  term ((-3519801309403106299 : Rat) / 143176215498537984) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3519801309403106299 : Rat) / 143176215498537984) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0300_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0300
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0301 : Poly :=
[
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 301 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0301 : Poly :=
[
  term ((549299257489439991 : Rat) / 23862702583089664) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 23862702583089664) [(2, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (14, 2), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0301_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0301
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0302 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 302 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0302 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0302_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0302
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0303 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0303 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0303_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0303
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0304 : Poly :=
[
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0304 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0304_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0304
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0305 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 305 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0305 : Poly :=
[
  term ((-23088038262747441 : Rat) / 372854727860776) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(2, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0305_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0305
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0306 : Poly :=
[
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 306 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0306 : Poly :=
[
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0306_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0306
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0307 : Poly :=
[
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0307 : Poly :=
[
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0307_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0307
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0308 : Poly :=
[
  term ((-271593667854965 : Rat) / 852239377967488) [(2, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 308 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0308 : Poly :=
[
  term ((271593667854965 : Rat) / 426119688983744) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-271593667854965 : Rat) / 852239377967488) [(2, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-271593667854965 : Rat) / 852239377967488) [(2, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((271593667854965 : Rat) / 852239377967488) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-271593667854965 : Rat) / 426119688983744) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((271593667854965 : Rat) / 852239377967488) [(2, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0308_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0308
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0309 : Poly :=
[
  term ((53417767260921 : Rat) / 60874241283392) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 309 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0309 : Poly :=
[
  term ((-53417767260921 : Rat) / 30437120641696) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((53417767260921 : Rat) / 60874241283392) [(2, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((53417767260921 : Rat) / 60874241283392) [(2, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((53417767260921 : Rat) / 30437120641696) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 60874241283392) [(2, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 60874241283392) [(2, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0309_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0309
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0310 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 310 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0310 : Poly :=
[
  term ((9184513182051 : Rat) / 6658120140371) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (6, 2), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (7, 2), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 6658120140371) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0310_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0310
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0311 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (16, 1)]
]

/-- Partial product 311 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0311 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (6, 1), (10, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (6, 2), (10, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (7, 2), (10, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (14, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0311_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0311
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0312 : Poly :=
[
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 312 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0312 : Poly :=
[
  term ((-893650397921630687125 : Rat) / 12635301017745977088) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((893650397921630687125 : Rat) / 12635301017745977088) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0312_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0312
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0313 : Poly :=
[
  term ((-38283967980291095395057 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0313 : Poly :=
[
  term ((38283967980291095395057 : Rat) / 151623612212951725056) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38283967980291095395057 : Rat) / 303247224425903450112) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38283967980291095395057 : Rat) / 303247224425903450112) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((38283967980291095395057 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-38283967980291095395057 : Rat) / 151623612212951725056) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((38283967980291095395057 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0313_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0313
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0314 : Poly :=
[
  term ((-5754823889732851460531 : Rat) / 101082408141967816704) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0314 : Poly :=
[
  term ((5754823889732851460531 : Rat) / 50541204070983908352) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5754823889732851460531 : Rat) / 101082408141967816704) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5754823889732851460531 : Rat) / 101082408141967816704) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5754823889732851460531 : Rat) / 50541204070983908352) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5754823889732851460531 : Rat) / 101082408141967816704) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5754823889732851460531 : Rat) / 101082408141967816704) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0314_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0314
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0315 : Poly :=
[
  term ((72777139141045149 : Rat) / 11931351291544832) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 315 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0315 : Poly :=
[
  term ((-72777139141045149 : Rat) / 5965675645772416) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(2, 1), (6, 2), (11, 1), (15, 3), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(2, 1), (7, 2), (11, 1), (15, 3), (16, 1)],
  term ((72777139141045149 : Rat) / 5965675645772416) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(2, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(2, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0315_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0315
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0316 : Poly :=
[
  term ((689929828795159058011 : Rat) / 25270602035491954176) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 316 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0316 : Poly :=
[
  term ((-689929828795159058011 : Rat) / 12635301017745977088) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((689929828795159058011 : Rat) / 25270602035491954176) [(2, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((689929828795159058011 : Rat) / 25270602035491954176) [(2, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-689929828795159058011 : Rat) / 25270602035491954176) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((689929828795159058011 : Rat) / 12635301017745977088) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((-689929828795159058011 : Rat) / 25270602035491954176) [(2, 1), (11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0316_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0316
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0317 : Poly :=
[
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 317 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0317 : Poly :=
[
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(2, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (6, 2), (11, 2), (15, 2), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (7, 2), (11, 2), (15, 2), (16, 1)],
  term ((210735806759522018859 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0317_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0317
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0318 : Poly :=
[
  term ((-276379012255691753013 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 318 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0318 : Poly :=
[
  term ((276379012255691753013 : Rat) / 2105883502957662848) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-276379012255691753013 : Rat) / 4211767005915325696) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((-276379012255691753013 : Rat) / 4211767005915325696) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((-276379012255691753013 : Rat) / 2105883502957662848) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((276379012255691753013 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((276379012255691753013 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0318_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0318
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0319 : Poly :=
[
  term ((2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0319 : Poly :=
[
  term ((-2153211946398618055 : Rat) / 107382161623903488) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2153211946398618055 : Rat) / 107382161623903488) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0319_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0319
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0320 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 320 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0320 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0320_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0320
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0321 : Poly :=
[
  term ((-8116459326898255 : Rat) / 1658411762531328) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 321 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0321 : Poly :=
[
  term ((8116459326898255 : Rat) / 829205881265664) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-8116459326898255 : Rat) / 1658411762531328) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-8116459326898255 : Rat) / 1658411762531328) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((8116459326898255 : Rat) / 1658411762531328) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8116459326898255 : Rat) / 829205881265664) [(2, 1), (14, 2), (16, 1)],
  term ((8116459326898255 : Rat) / 1658411762531328) [(2, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0321_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0321
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0322 : Poly :=
[
  term ((-374085357008938277 : Rat) / 30680617606829568) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 322 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0322 : Poly :=
[
  term ((374085357008938277 : Rat) / 15340308803414784) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-374085357008938277 : Rat) / 30680617606829568) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-374085357008938277 : Rat) / 30680617606829568) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-374085357008938277 : Rat) / 15340308803414784) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((374085357008938277 : Rat) / 30680617606829568) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((374085357008938277 : Rat) / 30680617606829568) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0322_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0322
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0323 : Poly :=
[
  term ((-2429400557948659 : Rat) / 3408957511869952) [(2, 1), (16, 1)]
]

/-- Partial product 323 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0323 : Poly :=
[
  term ((2429400557948659 : Rat) / 1704478755934976) [(2, 1), (6, 1), (16, 1)],
  term ((-2429400557948659 : Rat) / 3408957511869952) [(2, 1), (6, 2), (16, 1)],
  term ((-2429400557948659 : Rat) / 3408957511869952) [(2, 1), (7, 2), (16, 1)],
  term ((-2429400557948659 : Rat) / 1704478755934976) [(2, 1), (14, 1), (16, 1)],
  term ((2429400557948659 : Rat) / 3408957511869952) [(2, 1), (14, 2), (16, 1)],
  term ((2429400557948659 : Rat) / 3408957511869952) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0323_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0323
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0324 : Poly :=
[
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 324 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0324 : Poly :=
[
  term ((-64813826878183053207 : Rat) / 16847068023661302784) [(2, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 16847068023661302784) [(2, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0324_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0324
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0325 : Poly :=
[
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 325 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0325 : Poly :=
[
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 601681000845046528) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0325_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0325
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0326 : Poly :=
[
  term ((-216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 326 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0326 : Poly :=
[
  term ((216393175289202031809 : Rat) / 8423534011830651392) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-216393175289202031809 : Rat) / 8423534011830651392) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0326_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0326
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0327 : Poly :=
[
  term ((-9950570892537 : Rat) / 2075559066112) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0327 : Poly :=
[
  term ((9950570892537 : Rat) / 1037779533056) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9950570892537 : Rat) / 2075559066112) [(2, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9950570892537 : Rat) / 2075559066112) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9950570892537 : Rat) / 1037779533056) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 2075559066112) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 2075559066112) [(2, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0327_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0327
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0328 : Poly :=
[
  term ((-3173671524099147 : Rat) / 426119688983744) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0328 : Poly :=
[
  term ((3173671524099147 : Rat) / 213059844491872) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3173671524099147 : Rat) / 426119688983744) [(2, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3173671524099147 : Rat) / 426119688983744) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3173671524099147 : Rat) / 213059844491872) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3173671524099147 : Rat) / 426119688983744) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3173671524099147 : Rat) / 426119688983744) [(2, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0328_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0328
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0329 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (11, 2), (16, 1)]
]

/-- Partial product 329 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0329 : Poly :=
[
  term ((18310457117411443123 : Rat) / 300840500422523264) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (6, 2), (11, 2), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (7, 2), (11, 2), (16, 1)],
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (11, 2), (14, 2), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0329_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0329
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0330 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(2, 2), (16, 1)]
]

/-- Partial product 330 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0330 : Poly :=
[
  term ((-9184513182051 : Rat) / 7609280160424) [(2, 2), (6, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(2, 2), (6, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(2, 2), (7, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(2, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(2, 2), (14, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0330_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0330
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0331 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0331 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 4), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 3), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0331_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0331
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0332 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 332 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0332 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (8, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0332_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0332
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0333 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0333 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 4), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0333_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0333
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0334 : Poly :=
[
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 334 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0334 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0334_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0334
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0335 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0335 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0335_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0335
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0336 : Poly :=
[
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 336 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0336 : Poly :=
[
  term ((32775332453897373 : Rat) / 37605062552815408) [(3, 1), (5, 1), (6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 37605062552815408) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0336_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0336
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0337 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0337 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0337_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0337
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0338 : Poly :=
[
  term ((458045480522084837175 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 338 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0338 : Poly :=
[
  term ((-458045480522084837175 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((458045480522084837175 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (8, 1), (10, 1), (16, 1)],
  term ((458045480522084837175 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((458045480522084837175 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-458045480522084837175 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-458045480522084837175 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0338_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0338
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0339 : Poly :=
[
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0339 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0339_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0339
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0340 : Poly :=
[
  term ((133796726794045683993 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 340 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0340 : Poly :=
[
  term ((-133796726794045683993 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((133796726794045683993 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (8, 1), (14, 1), (16, 1)],
  term ((133796726794045683993 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-133796726794045683993 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((133796726794045683993 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-133796726794045683993 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0340_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0340
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0341 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 341 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0341 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0341_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0341
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0342 : Poly :=
[
  term ((17513629856815151895 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 342 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0342 : Poly :=
[
  term ((-17513629856815151895 : Rat) / 526470875739415712) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((17513629856815151895 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (6, 2), (8, 1), (16, 1)],
  term ((17513629856815151895 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((17513629856815151895 : Rat) / 526470875739415712) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-17513629856815151895 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-17513629856815151895 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0342_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0342
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0343 : Poly :=
[
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0343 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0343_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0343
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0344 : Poly :=
[
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 344 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0344 : Poly :=
[
  term ((-25147896414168381129 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((25147896414168381129 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0344_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0344
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0345 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 345 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0345 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0345_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0345
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0346 : Poly :=
[
  term ((-451243803451803641397 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 346 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0346 : Poly :=
[
  term ((451243803451803641397 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-451243803451803641397 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-451243803451803641397 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-451243803451803641397 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((451243803451803641397 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((451243803451803641397 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0346_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0346
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0347 : Poly :=
[
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 347 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0347 : Poly :=
[
  term ((-3641703605988597 : Rat) / 37605062552815408) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0347_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0347
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0348 : Poly :=
[
  term ((-125474897744337109635 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 348 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0348 : Poly :=
[
  term ((125474897744337109635 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-125474897744337109635 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-125474897744337109635 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-125474897744337109635 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((125474897744337109635 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((125474897744337109635 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0348_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0348
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0349 : Poly :=
[
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0349 : Poly :=
[
  term ((29538782016795201141 : Rat) / 1773375581438031872) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-29538782016795201141 : Rat) / 1773375581438031872) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0349_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0349
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0350 : Poly :=
[
  term ((-722932169637686395929 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0350 : Poly :=
[
  term ((722932169637686395929 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-722932169637686395929 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-722932169637686395929 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-722932169637686395929 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((722932169637686395929 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((722932169637686395929 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0350_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0350
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0351 : Poly :=
[
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 351 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0351 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (6, 2), (9, 2), (14, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (7, 2), (9, 2), (14, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(3, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0351_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0351
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0352 : Poly :=
[
  term ((-12989956762561325499 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 352 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0352 : Poly :=
[
  term ((12989956762561325499 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((-12989956762561325499 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 2), (9, 2), (16, 1)],
  term ((-12989956762561325499 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (7, 2), (9, 2), (16, 1)],
  term ((-12989956762561325499 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((12989956762561325499 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((12989956762561325499 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0352_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0352
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0353 : Poly :=
[
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0353 : Poly :=
[
  term ((-32775332453897373 : Rat) / 37605062552815408) [(3, 1), (5, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0353_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0353
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0354 : Poly :=
[
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0354 : Poly :=
[
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0354_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0354
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0355 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 355 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0355 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0355_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0355
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0356 : Poly :=
[
  term ((-442138519171126645479 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 356 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0356 : Poly :=
[
  term ((442138519171126645479 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-442138519171126645479 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-442138519171126645479 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((442138519171126645479 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-442138519171126645479 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((442138519171126645479 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0356_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0356
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0357 : Poly :=
[
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 357 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0357 : Poly :=
[
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0357_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0357
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0358 : Poly :=
[
  term ((-190965847098581946477 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 358 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0358 : Poly :=
[
  term ((190965847098581946477 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-190965847098581946477 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((-190965847098581946477 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((-190965847098581946477 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((190965847098581946477 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((190965847098581946477 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0358_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0358
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0359 : Poly :=
[
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 359 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0359 : Poly :=
[
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0359_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0359
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0360 : Poly :=
[
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 360 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0360 : Poly :=
[
  term ((-12747169384055734437 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12747169384055734437 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((12747169384055734437 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12747169384055734437 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0360_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0360
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0361 : Poly :=
[
  term ((-539689854142582139469 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0361 : Poly :=
[
  term ((539689854142582139469 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-539689854142582139469 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-539689854142582139469 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-539689854142582139469 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((539689854142582139469 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((539689854142582139469 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0361_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0361
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0362 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 362 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0362 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0362_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0362
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0363 : Poly :=
[
  term ((3641703605988597 : Rat) / 8130824335743872) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0363 : Poly :=
[
  term ((-3641703605988597 : Rat) / 4065412167871936) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 8130824335743872) [(3, 1), (5, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 8130824335743872) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 8130824335743872) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3641703605988597 : Rat) / 4065412167871936) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 8130824335743872) [(3, 1), (5, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0363_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0363
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0364 : Poly :=
[
  term ((446013291807898512687 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0364 : Poly :=
[
  term ((-446013291807898512687 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((446013291807898512687 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((446013291807898512687 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((446013291807898512687 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-446013291807898512687 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-446013291807898512687 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0364_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0364
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0365 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 365 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0365 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0365_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0365
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0366 : Poly :=
[
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 366 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0366 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (14, 1), (15, 4), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0366_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0366
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0367 : Poly :=
[
  term ((47828727522076178089 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 367 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0367 : Poly :=
[
  term ((-47828727522076178089 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((47828727522076178089 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((47828727522076178089 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((-47828727522076178089 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((47828727522076178089 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-47828727522076178089 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0367_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0367
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0368 : Poly :=
[
  term ((900685379017794432423 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 368 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0368 : Poly :=
[
  term ((-900685379017794432423 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((900685379017794432423 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((900685379017794432423 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((900685379017794432423 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-900685379017794432423 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-900685379017794432423 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0368_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0368
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0369 : Poly :=
[
  term ((1497259227208655713 : Rat) / 910652325603313664) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 369 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0369 : Poly :=
[
  term ((-1497259227208655713 : Rat) / 455326162801656832) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((1497259227208655713 : Rat) / 910652325603313664) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((1497259227208655713 : Rat) / 910652325603313664) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((1497259227208655713 : Rat) / 455326162801656832) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-1497259227208655713 : Rat) / 910652325603313664) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-1497259227208655713 : Rat) / 910652325603313664) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0369_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0369
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0370 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 370 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0370 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (7, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 4), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 3), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0370_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0370
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0371 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 371 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0371 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0371_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0371
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0372 : Poly :=
[
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0372 : Poly :=
[
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0372_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0372
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0373 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 373 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0373 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (7, 2), (8, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (15, 5), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 2), (8, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 3), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0373_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0373
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0374 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 374 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0374 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 3), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0374_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0374
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0375 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 375 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0375 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0375_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0375
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0376 : Poly :=
[
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0376 : Poly :=
[
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0376_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0376
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0377 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 377 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0377 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 1), (9, 1), (15, 5), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 3), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0377_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0377
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0378 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0378 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0378_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0378
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0379 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 379 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0379 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0379_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0379
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0380 : Poly :=
[
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 380 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0380 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (6, 2), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (7, 2), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 37605062552815408) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0380_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0380
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0381 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 381 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0381 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0381_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0381
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0382 : Poly :=
[
  term ((-2851299862857390769873 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 382 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0382 : Poly :=
[
  term ((2851299862857390769873 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2851299862857390769873 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2851299862857390769873 : Rat) / 16847068023661302784) [(3, 1), (7, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2851299862857390769873 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2851299862857390769873 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((2851299862857390769873 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0382_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0382
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0383 : Poly :=
[
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0383 : Poly :=
[
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (6, 2), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (7, 2), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 426119688983744) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0383_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0383
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0384 : Poly :=
[
  term ((-897872394218250015 : Rat) / 23862702583089664) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0384 : Poly :=
[
  term ((897872394218250015 : Rat) / 11931351291544832) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-897872394218250015 : Rat) / 23862702583089664) [(3, 1), (6, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-897872394218250015 : Rat) / 23862702583089664) [(3, 1), (7, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-897872394218250015 : Rat) / 11931351291544832) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((897872394218250015 : Rat) / 23862702583089664) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((897872394218250015 : Rat) / 23862702583089664) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0384_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0384
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0385 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 385 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0385 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0385_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0385
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0386 : Poly :=
[
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0386 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0386_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0386
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0387 : Poly :=
[
  term ((-51862028318607748561 : Rat) / 443343895359507968) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 387 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0387 : Poly :=
[
  term ((51862028318607748561 : Rat) / 221671947679753984) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51862028318607748561 : Rat) / 443343895359507968) [(3, 1), (6, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51862028318607748561 : Rat) / 443343895359507968) [(3, 1), (7, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((51862028318607748561 : Rat) / 443343895359507968) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51862028318607748561 : Rat) / 221671947679753984) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((51862028318607748561 : Rat) / 443343895359507968) [(3, 1), (8, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0387_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0387
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0388 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 388 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0388 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0388_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0388
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0389 : Poly :=
[
  term ((-828539538010038153599 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 389 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0389 : Poly :=
[
  term ((828539538010038153599 : Rat) / 2105883502957662848) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-828539538010038153599 : Rat) / 4211767005915325696) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-828539538010038153599 : Rat) / 4211767005915325696) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-828539538010038153599 : Rat) / 2105883502957662848) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((828539538010038153599 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((828539538010038153599 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0389_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0389
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0390 : Poly :=
[
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 390 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0390 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (6, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (7, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0390_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0390
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0391 : Poly :=
[
  term ((-488433265652090075 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0391 : Poly :=
[
  term ((488433265652090075 : Rat) / 11931351291544832) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-488433265652090075 : Rat) / 23862702583089664) [(3, 1), (6, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-488433265652090075 : Rat) / 23862702583089664) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((488433265652090075 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-488433265652090075 : Rat) / 11931351291544832) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((488433265652090075 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0391_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0391
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0392 : Poly :=
[
  term ((-2404122235627231103 : Rat) / 47725405166179328) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0392 : Poly :=
[
  term ((2404122235627231103 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2404122235627231103 : Rat) / 47725405166179328) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2404122235627231103 : Rat) / 47725405166179328) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2404122235627231103 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2404122235627231103 : Rat) / 47725405166179328) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2404122235627231103 : Rat) / 47725405166179328) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0392_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0392
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0393 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 393 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0393 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (14, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0393_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0393
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0394 : Poly :=
[
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 394 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0394 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0394_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0394
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0395 : Poly :=
[
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 395 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0395 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (6, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (7, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0395_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0395
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0396 : Poly :=
[
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 396 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0396 : Poly :=
[
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0396_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0396
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0397 : Poly :=
[
  term ((536084824294706049045 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 397 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0397 : Poly :=
[
  term ((-536084824294706049045 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((536084824294706049045 : Rat) / 33694136047322605568) [(3, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((536084824294706049045 : Rat) / 33694136047322605568) [(3, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((536084824294706049045 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-536084824294706049045 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-536084824294706049045 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0397_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0397
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0398 : Poly :=
[
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0398 : Poly :=
[
  term ((85633849091192066295 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-85633849091192066295 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0398_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0398
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0399 : Poly :=
[
  term ((16571919211188843016133 : Rat) / 202164816283935633408) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0399 : Poly :=
[
  term ((-16571919211188843016133 : Rat) / 101082408141967816704) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((16571919211188843016133 : Rat) / 202164816283935633408) [(3, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((16571919211188843016133 : Rat) / 202164816283935633408) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((16571919211188843016133 : Rat) / 101082408141967816704) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16571919211188843016133 : Rat) / 202164816283935633408) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16571919211188843016133 : Rat) / 202164816283935633408) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0399_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0399
        rs_R010_ueqv_R010NYY_generator_05_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_05_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_05_0300_0399 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_05_0300,
  rs_R010_ueqv_R010NYY_partial_05_0301,
  rs_R010_ueqv_R010NYY_partial_05_0302,
  rs_R010_ueqv_R010NYY_partial_05_0303,
  rs_R010_ueqv_R010NYY_partial_05_0304,
  rs_R010_ueqv_R010NYY_partial_05_0305,
  rs_R010_ueqv_R010NYY_partial_05_0306,
  rs_R010_ueqv_R010NYY_partial_05_0307,
  rs_R010_ueqv_R010NYY_partial_05_0308,
  rs_R010_ueqv_R010NYY_partial_05_0309,
  rs_R010_ueqv_R010NYY_partial_05_0310,
  rs_R010_ueqv_R010NYY_partial_05_0311,
  rs_R010_ueqv_R010NYY_partial_05_0312,
  rs_R010_ueqv_R010NYY_partial_05_0313,
  rs_R010_ueqv_R010NYY_partial_05_0314,
  rs_R010_ueqv_R010NYY_partial_05_0315,
  rs_R010_ueqv_R010NYY_partial_05_0316,
  rs_R010_ueqv_R010NYY_partial_05_0317,
  rs_R010_ueqv_R010NYY_partial_05_0318,
  rs_R010_ueqv_R010NYY_partial_05_0319,
  rs_R010_ueqv_R010NYY_partial_05_0320,
  rs_R010_ueqv_R010NYY_partial_05_0321,
  rs_R010_ueqv_R010NYY_partial_05_0322,
  rs_R010_ueqv_R010NYY_partial_05_0323,
  rs_R010_ueqv_R010NYY_partial_05_0324,
  rs_R010_ueqv_R010NYY_partial_05_0325,
  rs_R010_ueqv_R010NYY_partial_05_0326,
  rs_R010_ueqv_R010NYY_partial_05_0327,
  rs_R010_ueqv_R010NYY_partial_05_0328,
  rs_R010_ueqv_R010NYY_partial_05_0329,
  rs_R010_ueqv_R010NYY_partial_05_0330,
  rs_R010_ueqv_R010NYY_partial_05_0331,
  rs_R010_ueqv_R010NYY_partial_05_0332,
  rs_R010_ueqv_R010NYY_partial_05_0333,
  rs_R010_ueqv_R010NYY_partial_05_0334,
  rs_R010_ueqv_R010NYY_partial_05_0335,
  rs_R010_ueqv_R010NYY_partial_05_0336,
  rs_R010_ueqv_R010NYY_partial_05_0337,
  rs_R010_ueqv_R010NYY_partial_05_0338,
  rs_R010_ueqv_R010NYY_partial_05_0339,
  rs_R010_ueqv_R010NYY_partial_05_0340,
  rs_R010_ueqv_R010NYY_partial_05_0341,
  rs_R010_ueqv_R010NYY_partial_05_0342,
  rs_R010_ueqv_R010NYY_partial_05_0343,
  rs_R010_ueqv_R010NYY_partial_05_0344,
  rs_R010_ueqv_R010NYY_partial_05_0345,
  rs_R010_ueqv_R010NYY_partial_05_0346,
  rs_R010_ueqv_R010NYY_partial_05_0347,
  rs_R010_ueqv_R010NYY_partial_05_0348,
  rs_R010_ueqv_R010NYY_partial_05_0349,
  rs_R010_ueqv_R010NYY_partial_05_0350,
  rs_R010_ueqv_R010NYY_partial_05_0351,
  rs_R010_ueqv_R010NYY_partial_05_0352,
  rs_R010_ueqv_R010NYY_partial_05_0353,
  rs_R010_ueqv_R010NYY_partial_05_0354,
  rs_R010_ueqv_R010NYY_partial_05_0355,
  rs_R010_ueqv_R010NYY_partial_05_0356,
  rs_R010_ueqv_R010NYY_partial_05_0357,
  rs_R010_ueqv_R010NYY_partial_05_0358,
  rs_R010_ueqv_R010NYY_partial_05_0359,
  rs_R010_ueqv_R010NYY_partial_05_0360,
  rs_R010_ueqv_R010NYY_partial_05_0361,
  rs_R010_ueqv_R010NYY_partial_05_0362,
  rs_R010_ueqv_R010NYY_partial_05_0363,
  rs_R010_ueqv_R010NYY_partial_05_0364,
  rs_R010_ueqv_R010NYY_partial_05_0365,
  rs_R010_ueqv_R010NYY_partial_05_0366,
  rs_R010_ueqv_R010NYY_partial_05_0367,
  rs_R010_ueqv_R010NYY_partial_05_0368,
  rs_R010_ueqv_R010NYY_partial_05_0369,
  rs_R010_ueqv_R010NYY_partial_05_0370,
  rs_R010_ueqv_R010NYY_partial_05_0371,
  rs_R010_ueqv_R010NYY_partial_05_0372,
  rs_R010_ueqv_R010NYY_partial_05_0373,
  rs_R010_ueqv_R010NYY_partial_05_0374,
  rs_R010_ueqv_R010NYY_partial_05_0375,
  rs_R010_ueqv_R010NYY_partial_05_0376,
  rs_R010_ueqv_R010NYY_partial_05_0377,
  rs_R010_ueqv_R010NYY_partial_05_0378,
  rs_R010_ueqv_R010NYY_partial_05_0379,
  rs_R010_ueqv_R010NYY_partial_05_0380,
  rs_R010_ueqv_R010NYY_partial_05_0381,
  rs_R010_ueqv_R010NYY_partial_05_0382,
  rs_R010_ueqv_R010NYY_partial_05_0383,
  rs_R010_ueqv_R010NYY_partial_05_0384,
  rs_R010_ueqv_R010NYY_partial_05_0385,
  rs_R010_ueqv_R010NYY_partial_05_0386,
  rs_R010_ueqv_R010NYY_partial_05_0387,
  rs_R010_ueqv_R010NYY_partial_05_0388,
  rs_R010_ueqv_R010NYY_partial_05_0389,
  rs_R010_ueqv_R010NYY_partial_05_0390,
  rs_R010_ueqv_R010NYY_partial_05_0391,
  rs_R010_ueqv_R010NYY_partial_05_0392,
  rs_R010_ueqv_R010NYY_partial_05_0393,
  rs_R010_ueqv_R010NYY_partial_05_0394,
  rs_R010_ueqv_R010NYY_partial_05_0395,
  rs_R010_ueqv_R010NYY_partial_05_0396,
  rs_R010_ueqv_R010NYY_partial_05_0397,
  rs_R010_ueqv_R010NYY_partial_05_0398,
  rs_R010_ueqv_R010NYY_partial_05_0399
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_05_0300_0399 : Poly :=
[
  term ((-3519801309403106299 : Rat) / 143176215498537984) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 23862702583089664) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((271593667854965 : Rat) / 426119688983744) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-53417767260921 : Rat) / 30437120641696) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 6658120140371) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (6, 1), (10, 2), (16, 1)],
  term ((-893650397921630687125 : Rat) / 12635301017745977088) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((38283967980291095395057 : Rat) / 151623612212951725056) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5754823889732851460531 : Rat) / 50541204070983908352) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72777139141045149 : Rat) / 5965675645772416) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-689929828795159058011 : Rat) / 12635301017745977088) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(2, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((276379012255691753013 : Rat) / 2105883502957662848) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-2153211946398618055 : Rat) / 107382161623903488) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((8116459326898255 : Rat) / 829205881265664) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((374085357008938277 : Rat) / 15340308803414784) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((2429400557948659 : Rat) / 1704478755934976) [(2, 1), (6, 1), (16, 1)],
  term ((3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-271593667854965 : Rat) / 852239377967488) [(2, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((53417767260921 : Rat) / 60874241283392) [(2, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (6, 2), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (6, 2), (10, 2), (16, 1)],
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-38283967980291095395057 : Rat) / 303247224425903450112) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5754823889732851460531 : Rat) / 101082408141967816704) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(2, 1), (6, 2), (11, 1), (15, 3), (16, 1)],
  term ((689929828795159058011 : Rat) / 25270602035491954176) [(2, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-276379012255691753013 : Rat) / 4211767005915325696) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8116459326898255 : Rat) / 1658411762531328) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-374085357008938277 : Rat) / 30680617606829568) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2429400557948659 : Rat) / 3408957511869952) [(2, 1), (6, 2), (16, 1)],
  term ((3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-271593667854965 : Rat) / 852239377967488) [(2, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((53417767260921 : Rat) / 60874241283392) [(2, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (7, 2), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (7, 2), (10, 2), (16, 1)],
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-38283967980291095395057 : Rat) / 303247224425903450112) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5754823889732851460531 : Rat) / 101082408141967816704) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(2, 1), (7, 2), (11, 1), (15, 3), (16, 1)],
  term ((689929828795159058011 : Rat) / 25270602035491954176) [(2, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-276379012255691753013 : Rat) / 4211767005915325696) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8116459326898255 : Rat) / 1658411762531328) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-374085357008938277 : Rat) / 30680617606829568) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-2429400557948659 : Rat) / 3408957511869952) [(2, 1), (7, 2), (16, 1)],
  term ((3519801309403106299 : Rat) / 143176215498537984) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 23862702583089664) [(2, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-3519801309403106299 : Rat) / 286352430997075968) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (15, 5), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(2, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (15, 4), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1767291151160753 : Rat) / 852239377967488) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 6658120140371) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-53417767260921 : Rat) / 60874241283392) [(2, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((22310753970667 : Rat) / 426119688983744) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((271593667854965 : Rat) / 852239377967488) [(2, 1), (10, 1), (14, 3), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 60874241283392) [(2, 1), (10, 1), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (14, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((893650397921630687125 : Rat) / 12635301017745977088) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5754823889732851460531 : Rat) / 50541204070983908352) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((41983375517108702409025 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-59303464291383636408521 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(2, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((38283967980291095395057 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((5754823889732851460531 : Rat) / 101082408141967816704) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(2, 1), (11, 1), (15, 5), (16, 1)],
  term ((30236053250630160797 : Rat) / 1330031686078523904) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-276379012255691753013 : Rat) / 2105883502957662848) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((759533432781117158525 : Rat) / 6317650508872988544) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((-689929828795159058011 : Rat) / 25270602035491954176) [(2, 1), (11, 2), (14, 3), (16, 1)],
  term ((276379012255691753013 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(2, 1), (11, 2), (15, 4), (16, 1)],
  term ((2153211946398618055 : Rat) / 107382161623903488) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2153211946398618055 : Rat) / 214764323247806976) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1196032432940517673 : Rat) / 61361235213659136) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-2429400557948659 : Rat) / 1704478755934976) [(2, 1), (14, 1), (16, 1)],
  term ((-4780640538237372251 : Rat) / 107382161623903488) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8701387189803047 : Rat) / 958769300213424) [(2, 1), (14, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (14, 3), (15, 2), (16, 1)],
  term ((8116459326898255 : Rat) / 1658411762531328) [(2, 1), (14, 3), (16, 1)],
  term ((2429400557948659 : Rat) / 3408957511869952) [(2, 1), (15, 2), (16, 1)],
  term ((374085357008938277 : Rat) / 30680617606829568) [(2, 1), (15, 4), (16, 1)],
  term ((-64813826878183053207 : Rat) / 16847068023661302784) [(2, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 16847068023661302784) [(2, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((3957604484499008181 : Rat) / 601681000845046528) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((216393175289202031809 : Rat) / 8423534011830651392) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((9950570892537 : Rat) / 1037779533056) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3173671524099147 : Rat) / 213059844491872) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(2, 2), (6, 1), (16, 1)],
  term ((-216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-9950570892537 : Rat) / 2075559066112) [(2, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3173671524099147 : Rat) / 426119688983744) [(2, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (6, 2), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(2, 2), (6, 2), (16, 1)],
  term ((-216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-9950570892537 : Rat) / 2075559066112) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3173671524099147 : Rat) / 426119688983744) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (7, 2), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(2, 2), (7, 2), (16, 1)],
  term ((-216393175289202031809 : Rat) / 8423534011830651392) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9950570892537 : Rat) / 1037779533056) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 2075559066112) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 2075559066112) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-3173671524099147 : Rat) / 213059844491872) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3173671524099147 : Rat) / 426119688983744) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3173671524099147 : Rat) / 426119688983744) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (11, 2), (14, 2), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(2, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(2, 2), (14, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(2, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (7, 2), (8, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(3, 1), (5, 1), (6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-458045480522084837175 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101914687142007788463 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 2), (16, 1)],
  term ((524120550749141941143 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 4), (16, 1)],
  term ((-17513629856815151895 : Rat) / 526470875739415712) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((451243803451803641397 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((125474897744337109635 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((29538782016795201141 : Rat) / 1773375581438031872) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((722932169637686395929 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((12989956762561325499 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 37605062552815408) [(3, 1), (5, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((442138519171126645479 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((190965847098581946477 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12747169384055734437 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((539689854142582139469 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3641703605988597 : Rat) / 4065412167871936) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-446013291807898512687 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-47828727522076178089 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-900685379017794432423 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1497259227208655713 : Rat) / 455326162801656832) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((458045480522084837175 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (8, 1), (10, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((133796726794045683993 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (8, 1), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((726027434115005581575 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (8, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-451243803451803641397 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-125474897744337109635 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-722932169637686395929 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (6, 2), (9, 2), (14, 1), (16, 1)],
  term ((-12989956762561325499 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (6, 2), (9, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (6, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-442138519171126645479 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-190965847098581946477 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-539689854142582139469 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 3), (16, 1)],
  term ((3641703605988597 : Rat) / 8130824335743872) [(3, 1), (5, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((446013291807898512687 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((47828727522076178089 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((900685379017794432423 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((1497259227208655713 : Rat) / 910652325603313664) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 3), (8, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 3), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 4), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((458045480522084837175 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((133796726794045683993 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((17513629856815151895 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-451243803451803641397 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-125474897744337109635 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-722932169637686395929 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (7, 2), (9, 2), (14, 1), (16, 1)],
  term ((-12989956762561325499 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (7, 2), (9, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-442138519171126645479 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-190965847098581946477 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-539689854142582139469 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 3), (16, 1)],
  term ((3641703605988597 : Rat) / 8130824335743872) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((446013291807898512687 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((47828727522076178089 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((900685379017794432423 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((1497259227208655713 : Rat) / 910652325603313664) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 3), (9, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 3), (9, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-142026440633555283 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((458045480522084837175 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-487412178400776883383 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 3), (16, 1)],
  term ((-458045480522084837175 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 4), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-172952323965635078937 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((17513629856815151895 : Rat) / 526470875739415712) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6312312060475531167 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-133796726794045683993 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (14, 3), (16, 1)],
  term ((-17513629856815151895 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (15, 4), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-5570097828373683657 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-451243803451803641397 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((652426974765150690429 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((451243803451803641397 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-125474897744337109635 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((132000830606268675459 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((125474897744337109635 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-722932169637686395929 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1522015263638748890787 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((29538782016795201141 : Rat) / 3546751162876063744) [(3, 1), (5, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((722932169637686395929 : Rat) / 134776544189290422272) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-12989956762561325499 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((218653954009565344875 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(3, 1), (5, 1), (9, 2), (14, 3), (16, 1)],
  term ((12989956762561325499 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((98325997361692119 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((427455170231780622375 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-190965847098581946477 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((54625554089828955 : Rat) / 21488607173037376) [(3, 1), (5, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-125586336036272349501 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (14, 3), (15, 2), (16, 1)],
  term ((442138519171126645479 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (10, 1), (14, 3), (16, 1)],
  term ((190965847098581946477 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 1), (5, 1), (10, 1), (15, 4), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3957604484499008181 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-539689854142582139469 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((26408427787533660507 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((590678531678805077217 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-12747169384055734437 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((539689854142582139469 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (11, 1), (15, 5), (16, 1)],
  term ((446013291807898512687 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833950125771388713 : Rat) / 300840500422523264) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-415830852321465020751 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-3641703605988597 : Rat) / 8130824335743872) [(3, 1), (5, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-446013291807898512687 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (13, 1), (15, 5), (16, 1)],
  term ((805027923973642076245 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (14, 1), (15, 4), (16, 1)],
  term ((1497259227208655713 : Rat) / 455326162801656832) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-978996573360973222311 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((19416616954512064425 : Rat) / 4813448006760372224) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (14, 3), (15, 2), (16, 1)],
  term ((-47828727522076178089 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (14, 3), (16, 1)],
  term ((-1497259227208655713 : Rat) / 910652325603313664) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-900685379017794432423 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (7, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (7, 2), (8, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((2851299862857390769873 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((897872394218250015 : Rat) / 11931351291544832) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((659782517317517254593 : Rat) / 1203362001690093056) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3950628178663458708289 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 4), (16, 1)],
  term ((828539538010038153599 : Rat) / 2105883502957662848) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((50345407482883025 : Rat) / 426119688983744) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 3), (16, 1)],
  term ((2404122235627231103 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-771697346106173121 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (15, 5), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-536084824294706049045 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((85633849091192066295 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16571919211188843016133 : Rat) / 101082408141967816704) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (6, 2), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2851299862857390769873 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (6, 2), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-897872394218250015 : Rat) / 23862702583089664) [(3, 1), (6, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51862028318607748561 : Rat) / 443343895359507968) [(3, 1), (6, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 9401265638203852) [(3, 1), (6, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4304799621135602644031 : Rat) / 8423534011830651392) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (6, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-488433265652090075 : Rat) / 23862702583089664) [(3, 1), (6, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6089074811101769603 : Rat) / 47725405166179328) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 106529922245936) [(3, 1), (6, 2), (8, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (6, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((536084824294706049045 : Rat) / 33694136047322605568) [(3, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16571919211188843016133 : Rat) / 202164816283935633408) [(3, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 3), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 3), (8, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 3), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 3), (8, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 1), (9, 1), (15, 5), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (7, 2), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2851299862857390769873 : Rat) / 16847068023661302784) [(3, 1), (7, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (7, 2), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-897872394218250015 : Rat) / 23862702583089664) [(3, 1), (7, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51862028318607748561 : Rat) / 443343895359507968) [(3, 1), (7, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-828539538010038153599 : Rat) / 4211767005915325696) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (7, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-488433265652090075 : Rat) / 23862702583089664) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2404122235627231103 : Rat) / 47725405166179328) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (8, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (7, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((536084824294706049045 : Rat) / 33694136047322605568) [(3, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16571919211188843016133 : Rat) / 202164816283935633408) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 3), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 3), (9, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 1), (15, 4), (16, 1)],
  term ((4725948447578995767 : Rat) / 75210125105630816) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2851299862857390769873 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((3339890225437865409169 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 3), (16, 1)],
  term ((2851299862857390769873 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 4), (16, 1)],
  term ((-897872394218250015 : Rat) / 11931351291544832) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4339353506499999 : Rat) / 852239377967488) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((841794595057326951 : Rat) / 23862702583089664) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 3), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((897872394218250015 : Rat) / 23862702583089664) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (15, 5), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1636832354827513408387 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-828539538010038153599 : Rat) / 2105883502957662848) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-39209750010877267265 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((51862028318607748561 : Rat) / 443343895359507968) [(3, 1), (8, 1), (11, 1), (14, 3), (16, 1)],
  term ((828539538010038153599 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2404122235627231103 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((338892467889628571 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((450389173018870803 : Rat) / 47725405166179328) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (14, 2), (15, 3), (16, 1)],
  term ((488433265652090075 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((2404122235627231103 : Rat) / 47725405166179328) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (15, 5), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (10, 1), (15, 4), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((536084824294706049045 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-644660460423700413333 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-536084824294706049045 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((16571919211188843016133 : Rat) / 101082408141967816704) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-17599525400283147811673 : Rat) / 202164816283935633408) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((85633849091192066295 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-16571919211188843016133 : Rat) / 202164816283935633408) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 300 through 399. -/
theorem rs_R010_ueqv_R010NYY_block_05_0300_0399_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_05_0300_0399
      rs_R010_ueqv_R010NYY_block_05_0300_0399 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
