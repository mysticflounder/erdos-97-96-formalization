/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 12:300-308

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0300 : Poly :=
[
  term ((81 : Rat) / 10) [(13, 2)]
]

/-- Partial product 300 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0300 : Poly :=
[
  term ((81 : Rat) / 5) [(2, 1), (13, 2), (14, 1)],
  term ((81 : Rat) / 5) [(3, 1), (13, 2), (15, 1)],
  term ((-81 : Rat) / 10) [(13, 2), (14, 2)],
  term ((-81 : Rat) / 10) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0300_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0300
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0301 : Poly :=
[
  term ((3615067997 : Rat) / 1373358) [(13, 2), (15, 2)]
]

/-- Partial product 301 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0301 : Poly :=
[
  term ((3615067997 : Rat) / 686679) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((3615067997 : Rat) / 686679) [(3, 1), (13, 2), (15, 3)],
  term ((-3615067997 : Rat) / 1373358) [(13, 2), (14, 2), (15, 2)],
  term ((-3615067997 : Rat) / 1373358) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0301_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0301
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0302 : Poly :=
[
  term ((-49745968 : Rat) / 98097) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 302 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0302 : Poly :=
[
  term ((-99491936 : Rat) / 98097) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-99491936 : Rat) / 98097) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((49745968 : Rat) / 98097) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((49745968 : Rat) / 98097) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0302_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0302
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0303 : Poly :=
[
  term ((-5315344096 : Rat) / 6637897) [(13, 3), (15, 1)]
]

/-- Partial product 303 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0303 : Poly :=
[
  term ((-10630688192 : Rat) / 6637897) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((-10630688192 : Rat) / 6637897) [(3, 1), (13, 3), (15, 2)],
  term ((5315344096 : Rat) / 6637897) [(13, 3), (14, 2), (15, 1)],
  term ((5315344096 : Rat) / 6637897) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0303_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0303
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0304 : Poly :=
[
  term ((5083200 : Rat) / 32699) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0304 : Poly :=
[
  term ((10166400 : Rat) / 32699) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((10166400 : Rat) / 32699) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((-5083200 : Rat) / 32699) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-5083200 : Rat) / 32699) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0304_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0304
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0305 : Poly :=
[
  term ((262461541787 : Rat) / 6372381120) [(15, 2)]
]

/-- Partial product 305 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0305 : Poly :=
[
  term ((262461541787 : Rat) / 3186190560) [(2, 1), (14, 1), (15, 2)],
  term ((262461541787 : Rat) / 3186190560) [(3, 1), (15, 3)],
  term ((-262461541787 : Rat) / 6372381120) [(14, 2), (15, 2)],
  term ((-262461541787 : Rat) / 6372381120) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0305_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0305
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0306 : Poly :=
[
  term ((-5827741 : Rat) / 784776) [(15, 2), (16, 1)]
]

/-- Partial product 306 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0306 : Poly :=
[
  term ((-5827741 : Rat) / 392388) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5827741 : Rat) / 392388) [(3, 1), (15, 3), (16, 1)],
  term ((5827741 : Rat) / 784776) [(14, 2), (15, 2), (16, 1)],
  term ((5827741 : Rat) / 784776) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0306_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0306
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0307 : Poly :=
[
  term ((39522502697 : Rat) / 531031760) [(15, 4)]
]

/-- Partial product 307 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0307 : Poly :=
[
  term ((39522502697 : Rat) / 265515880) [(2, 1), (14, 1), (15, 4)],
  term ((39522502697 : Rat) / 265515880) [(3, 1), (15, 5)],
  term ((-39522502697 : Rat) / 531031760) [(14, 2), (15, 4)],
  term ((-39522502697 : Rat) / 531031760) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0307_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0307
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0308 : Poly :=
[
  term ((-2831621 : Rat) / 196194) [(15, 4), (16, 1)]
]

/-- Partial product 308 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0308 : Poly :=
[
  term ((-2831621 : Rat) / 98097) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-2831621 : Rat) / 98097) [(3, 1), (15, 5), (16, 1)],
  term ((2831621 : Rat) / 196194) [(14, 2), (15, 4), (16, 1)],
  term ((2831621 : Rat) / 196194) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0308_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0308
        rs_R009_ueqv_R009NYYYY_generator_12_0300_0308 =
      rs_R009_ueqv_R009NYYYY_partial_12_0308 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_12_0300_0308 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_12_0300,
  rs_R009_ueqv_R009NYYYY_partial_12_0301,
  rs_R009_ueqv_R009NYYYY_partial_12_0302,
  rs_R009_ueqv_R009NYYYY_partial_12_0303,
  rs_R009_ueqv_R009NYYYY_partial_12_0304,
  rs_R009_ueqv_R009NYYYY_partial_12_0305,
  rs_R009_ueqv_R009NYYYY_partial_12_0306,
  rs_R009_ueqv_R009NYYYY_partial_12_0307,
  rs_R009_ueqv_R009NYYYY_partial_12_0308
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_12_0300_0308 : Poly :=
[
  term ((81 : Rat) / 5) [(2, 1), (13, 2), (14, 1)],
  term ((3615067997 : Rat) / 686679) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((-99491936 : Rat) / 98097) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10630688192 : Rat) / 6637897) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((10166400 : Rat) / 32699) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((262461541787 : Rat) / 3186190560) [(2, 1), (14, 1), (15, 2)],
  term ((-5827741 : Rat) / 392388) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((39522502697 : Rat) / 265515880) [(2, 1), (14, 1), (15, 4)],
  term ((-2831621 : Rat) / 98097) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((81 : Rat) / 5) [(3, 1), (13, 2), (15, 1)],
  term ((3615067997 : Rat) / 686679) [(3, 1), (13, 2), (15, 3)],
  term ((-99491936 : Rat) / 98097) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-10630688192 : Rat) / 6637897) [(3, 1), (13, 3), (15, 2)],
  term ((10166400 : Rat) / 32699) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((262461541787 : Rat) / 3186190560) [(3, 1), (15, 3)],
  term ((-5827741 : Rat) / 392388) [(3, 1), (15, 3), (16, 1)],
  term ((39522502697 : Rat) / 265515880) [(3, 1), (15, 5)],
  term ((-2831621 : Rat) / 98097) [(3, 1), (15, 5), (16, 1)],
  term ((-81 : Rat) / 10) [(13, 2), (14, 2)],
  term ((-3615067997 : Rat) / 1373358) [(13, 2), (14, 2), (15, 2)],
  term ((49745968 : Rat) / 98097) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-81 : Rat) / 10) [(13, 2), (15, 2)],
  term ((-3615067997 : Rat) / 1373358) [(13, 2), (15, 4)],
  term ((49745968 : Rat) / 98097) [(13, 2), (15, 4), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(13, 3), (14, 2), (15, 1)],
  term ((-5083200 : Rat) / 32699) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(13, 3), (15, 3)],
  term ((-5083200 : Rat) / 32699) [(13, 3), (15, 3), (16, 1)],
  term ((-262461541787 : Rat) / 6372381120) [(14, 2), (15, 2)],
  term ((5827741 : Rat) / 784776) [(14, 2), (15, 2), (16, 1)],
  term ((-39522502697 : Rat) / 531031760) [(14, 2), (15, 4)],
  term ((2831621 : Rat) / 196194) [(14, 2), (15, 4), (16, 1)],
  term ((-262461541787 : Rat) / 6372381120) [(15, 4)],
  term ((5827741 : Rat) / 784776) [(15, 4), (16, 1)],
  term ((-39522502697 : Rat) / 531031760) [(15, 6)],
  term ((2831621 : Rat) / 196194) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 300 through 308. -/
theorem rs_R009_ueqv_R009NYYYY_block_12_0300_0308_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_12_0300_0308
      rs_R009_ueqv_R009NYYYY_block_12_0300_0308 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
