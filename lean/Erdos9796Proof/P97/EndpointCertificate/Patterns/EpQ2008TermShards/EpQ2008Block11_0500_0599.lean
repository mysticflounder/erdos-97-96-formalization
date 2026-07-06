/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 11:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_11_0500_0599 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0500 : Poly :=
[
  term ((66068828127413730517692941915315371200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 500 for generator 11. -/
def ep_Q2_008_partial_11_0500 : Poly :=
[
  term ((132137656254827461035385883830630742400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((132137656254827461035385883830630742400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-66068828127413730517692941915315371200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-66068828127413730517692941915315371200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 11. -/
theorem ep_Q2_008_partial_11_0500_valid :
    mulPoly ep_Q2_008_coefficient_11_0500
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0501 : Poly :=
[
  term ((44411308128742082624821433791810477612503 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 501 for generator 11. -/
def ep_Q2_008_partial_11_0501 : Poly :=
[
  term ((44411308128742082624821433791810477612503 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((44411308128742082624821433791810477612503 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-44411308128742082624821433791810477612503 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-44411308128742082624821433791810477612503 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 11. -/
theorem ep_Q2_008_partial_11_0501_valid :
    mulPoly ep_Q2_008_coefficient_11_0501
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0502 : Poly :=
[
  term ((605731163546648034101 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 502 for generator 11. -/
def ep_Q2_008_partial_11_0502 : Poly :=
[
  term ((605731163546648034101 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((605731163546648034101 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-605731163546648034101 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-605731163546648034101 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 11. -/
theorem ep_Q2_008_partial_11_0502_valid :
    mulPoly ep_Q2_008_coefficient_11_0502
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0503 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 11. -/
def ep_Q2_008_partial_11_0503 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 11. -/
theorem ep_Q2_008_partial_11_0503_valid :
    mulPoly ep_Q2_008_coefficient_11_0503
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0504 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 504 for generator 11. -/
def ep_Q2_008_partial_11_0504 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 11. -/
theorem ep_Q2_008_partial_11_0504_valid :
    mulPoly ep_Q2_008_coefficient_11_0504
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0505 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 11. -/
def ep_Q2_008_partial_11_0505 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 11. -/
theorem ep_Q2_008_partial_11_0505_valid :
    mulPoly ep_Q2_008_coefficient_11_0505
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0506 : Poly :=
[
  term ((-7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 506 for generator 11. -/
def ep_Q2_008_partial_11_0506 : Poly :=
[
  term ((-14216774552440302744704127871180800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14216774552440302744704127871180800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 11. -/
theorem ep_Q2_008_partial_11_0506_valid :
    mulPoly ep_Q2_008_coefficient_11_0506
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0507 : Poly :=
[
  term ((-156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 507 for generator 11. -/
def ep_Q2_008_partial_11_0507 : Poly :=
[
  term ((-313253702922519852522514817525222400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-313253702922519852522514817525222400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 11. -/
theorem ep_Q2_008_partial_11_0507_valid :
    mulPoly ep_Q2_008_coefficient_11_0507
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0508 : Poly :=
[
  term ((-1823341724914538259686556399842208000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 508 for generator 11. -/
def ep_Q2_008_partial_11_0508 : Poly :=
[
  term ((-3646683449829076519373112799684416000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3646683449829076519373112799684416000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1823341724914538259686556399842208000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1823341724914538259686556399842208000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 11. -/
theorem ep_Q2_008_partial_11_0508_valid :
    mulPoly ep_Q2_008_coefficient_11_0508
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0509 : Poly :=
[
  term ((54490904357009588408323823445648000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 509 for generator 11. -/
def ep_Q2_008_partial_11_0509 : Poly :=
[
  term ((108981808714019176816647646891296000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((108981808714019176816647646891296000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-54490904357009588408323823445648000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-54490904357009588408323823445648000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 11. -/
theorem ep_Q2_008_partial_11_0509_valid :
    mulPoly ep_Q2_008_coefficient_11_0509
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0510 : Poly :=
[
  term ((13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 11. -/
def ep_Q2_008_partial_11_0510 : Poly :=
[
  term ((27545000695353086567864247750412800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((27545000695353086567864247750412800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 11. -/
theorem ep_Q2_008_partial_11_0510_valid :
    mulPoly ep_Q2_008_coefficient_11_0510
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0511 : Poly :=
[
  term ((-147983698750401333115329331022745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 511 for generator 11. -/
def ep_Q2_008_partial_11_0511 : Poly :=
[
  term ((-295967397500802666230658662045491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-295967397500802666230658662045491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((147983698750401333115329331022745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((147983698750401333115329331022745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 11. -/
theorem ep_Q2_008_partial_11_0511_valid :
    mulPoly ep_Q2_008_coefficient_11_0511
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0512 : Poly :=
[
  term ((2189524641050049637058317693433289600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 11. -/
def ep_Q2_008_partial_11_0512 : Poly :=
[
  term ((4379049282100099274116635386866579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4379049282100099274116635386866579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2189524641050049637058317693433289600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2189524641050049637058317693433289600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 11. -/
theorem ep_Q2_008_partial_11_0512_valid :
    mulPoly ep_Q2_008_coefficient_11_0512
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0513 : Poly :=
[
  term ((20456807701167651534638183996457600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 11. -/
def ep_Q2_008_partial_11_0513 : Poly :=
[
  term ((40913615402335303069276367992915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((40913615402335303069276367992915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-20456807701167651534638183996457600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-20456807701167651534638183996457600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 11. -/
theorem ep_Q2_008_partial_11_0513_valid :
    mulPoly ep_Q2_008_coefficient_11_0513
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0514 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 514 for generator 11. -/
def ep_Q2_008_partial_11_0514 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 4), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 2), (15, 3), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 11. -/
theorem ep_Q2_008_partial_11_0514_valid :
    mulPoly ep_Q2_008_coefficient_11_0514
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0515 : Poly :=
[
  term ((376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 515 for generator 11. -/
def ep_Q2_008_partial_11_0515 : Poly :=
[
  term ((752853231626973750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 11. -/
theorem ep_Q2_008_partial_11_0515_valid :
    mulPoly ep_Q2_008_coefficient_11_0515
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0516 : Poly :=
[
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 516 for generator 11. -/
def ep_Q2_008_partial_11_0516 : Poly :=
[
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 11. -/
theorem ep_Q2_008_partial_11_0516_valid :
    mulPoly ep_Q2_008_coefficient_11_0516
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0517 : Poly :=
[
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 517 for generator 11. -/
def ep_Q2_008_partial_11_0517 : Poly :=
[
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 11. -/
theorem ep_Q2_008_partial_11_0517_valid :
    mulPoly ep_Q2_008_coefficient_11_0517
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0518 : Poly :=
[
  term ((8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 518 for generator 11. -/
def ep_Q2_008_partial_11_0518 : Poly :=
[
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 11. -/
theorem ep_Q2_008_partial_11_0518_valid :
    mulPoly ep_Q2_008_coefficient_11_0518
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0519 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 519 for generator 11. -/
def ep_Q2_008_partial_11_0519 : Poly :=
[
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 11. -/
theorem ep_Q2_008_partial_11_0519_valid :
    mulPoly ep_Q2_008_coefficient_11_0519
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0520 : Poly :=
[
  term ((3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 520 for generator 11. -/
def ep_Q2_008_partial_11_0520 : Poly :=
[
  term ((3771082783353798885 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((3771082783353798885 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 11. -/
theorem ep_Q2_008_partial_11_0520_valid :
    mulPoly ep_Q2_008_coefficient_11_0520
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0521 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 11. -/
def ep_Q2_008_partial_11_0521 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 11. -/
theorem ep_Q2_008_partial_11_0521_valid :
    mulPoly ep_Q2_008_coefficient_11_0521
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0522 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 522 for generator 11. -/
def ep_Q2_008_partial_11_0522 : Poly :=
[
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(2, 1), (5, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 3), (14, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 11. -/
theorem ep_Q2_008_partial_11_0522_valid :
    mulPoly ep_Q2_008_coefficient_11_0522
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0523 : Poly :=
[
  term ((-16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 523 for generator 11. -/
def ep_Q2_008_partial_11_0523 : Poly :=
[
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 11. -/
theorem ep_Q2_008_partial_11_0523_valid :
    mulPoly ep_Q2_008_coefficient_11_0523
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0524 : Poly :=
[
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 11. -/
def ep_Q2_008_partial_11_0524 : Poly :=
[
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 11. -/
theorem ep_Q2_008_partial_11_0524_valid :
    mulPoly ep_Q2_008_coefficient_11_0524
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0525 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 525 for generator 11. -/
def ep_Q2_008_partial_11_0525 : Poly :=
[
  term ((172223556136072447584 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 11. -/
theorem ep_Q2_008_partial_11_0525_valid :
    mulPoly ep_Q2_008_coefficient_11_0525
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0526 : Poly :=
[
  term ((4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 526 for generator 11. -/
def ep_Q2_008_partial_11_0526 : Poly :=
[
  term ((4928658474989860215 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((4928658474989860215 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 11. -/
theorem ep_Q2_008_partial_11_0526_valid :
    mulPoly ep_Q2_008_coefficient_11_0526
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0527 : Poly :=
[
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 527 for generator 11. -/
def ep_Q2_008_partial_11_0527 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 11. -/
theorem ep_Q2_008_partial_11_0527_valid :
    mulPoly ep_Q2_008_coefficient_11_0527
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0528 : Poly :=
[
  term ((23441595644070900 : Rat) / 692956453614176359) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 528 for generator 11. -/
def ep_Q2_008_partial_11_0528 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 11. -/
theorem ep_Q2_008_partial_11_0528_valid :
    mulPoly ep_Q2_008_coefficient_11_0528
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0529 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 529 for generator 11. -/
def ep_Q2_008_partial_11_0529 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 11. -/
theorem ep_Q2_008_partial_11_0529_valid :
    mulPoly ep_Q2_008_coefficient_11_0529
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0530 : Poly :=
[
  term ((468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 530 for generator 11. -/
def ep_Q2_008_partial_11_0530 : Poly :=
[
  term ((936120975753739500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((936120975753739500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 11. -/
theorem ep_Q2_008_partial_11_0530_valid :
    mulPoly ep_Q2_008_coefficient_11_0530
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0531 : Poly :=
[
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 531 for generator 11. -/
def ep_Q2_008_partial_11_0531 : Poly :=
[
  term ((245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 11. -/
theorem ep_Q2_008_partial_11_0531_valid :
    mulPoly ep_Q2_008_coefficient_11_0531
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0532 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 532 for generator 11. -/
def ep_Q2_008_partial_11_0532 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 11. -/
theorem ep_Q2_008_partial_11_0532_valid :
    mulPoly ep_Q2_008_coefficient_11_0532
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0533 : Poly :=
[
  term ((9820236341348087733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 533 for generator 11. -/
def ep_Q2_008_partial_11_0533 : Poly :=
[
  term ((9820236341348087733 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((9820236341348087733 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9820236341348087733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-9820236341348087733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 11. -/
theorem ep_Q2_008_partial_11_0533_valid :
    mulPoly ep_Q2_008_coefficient_11_0533
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0534 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 534 for generator 11. -/
def ep_Q2_008_partial_11_0534 : Poly :=
[
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 11. -/
theorem ep_Q2_008_partial_11_0534_valid :
    mulPoly ep_Q2_008_coefficient_11_0534
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0535 : Poly :=
[
  term ((-21806263158324573237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 535 for generator 11. -/
def ep_Q2_008_partial_11_0535 : Poly :=
[
  term ((-43612526316649146474 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-43612526316649146474 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21806263158324573237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((21806263158324573237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 11. -/
theorem ep_Q2_008_partial_11_0535_valid :
    mulPoly ep_Q2_008_coefficient_11_0535
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0536 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 536 for generator 11. -/
def ep_Q2_008_partial_11_0536 : Poly :=
[
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 11. -/
theorem ep_Q2_008_partial_11_0536_valid :
    mulPoly ep_Q2_008_coefficient_11_0536
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0537 : Poly :=
[
  term ((384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 11. -/
def ep_Q2_008_partial_11_0537 : Poly :=
[
  term ((768345533009169231167854899741119220525900 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((768345533009169231167854899741119220525900 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 11. -/
theorem ep_Q2_008_partial_11_0537_valid :
    mulPoly ep_Q2_008_coefficient_11_0537
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0538 : Poly :=
[
  term ((67785310460260468369127796908706505249200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 538 for generator 11. -/
def ep_Q2_008_partial_11_0538 : Poly :=
[
  term ((135570620920520936738255593817413010498400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((135570620920520936738255593817413010498400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-67785310460260468369127796908706505249200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-67785310460260468369127796908706505249200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 11. -/
theorem ep_Q2_008_partial_11_0538_valid :
    mulPoly ep_Q2_008_coefficient_11_0538
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0539 : Poly :=
[
  term ((20291125800685706985 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 539 for generator 11. -/
def ep_Q2_008_partial_11_0539 : Poly :=
[
  term ((20291125800685706985 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((20291125800685706985 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20291125800685706985 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-20291125800685706985 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 11. -/
theorem ep_Q2_008_partial_11_0539_valid :
    mulPoly ep_Q2_008_coefficient_11_0539
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0540 : Poly :=
[
  term ((1309245873746932661958696175089912616130214 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 11. -/
def ep_Q2_008_partial_11_0540 : Poly :=
[
  term ((2618491747493865323917392350179825232260428 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2618491747493865323917392350179825232260428 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1309245873746932661958696175089912616130214 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1309245873746932661958696175089912616130214 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 11. -/
theorem ep_Q2_008_partial_11_0540_valid :
    mulPoly ep_Q2_008_coefficient_11_0540
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0541 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 541 for generator 11. -/
def ep_Q2_008_partial_11_0541 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (14, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 11. -/
theorem ep_Q2_008_partial_11_0541_valid :
    mulPoly ep_Q2_008_coefficient_11_0541
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0542 : Poly :=
[
  term ((-354634516138194933258211647179730209515800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 542 for generator 11. -/
def ep_Q2_008_partial_11_0542 : Poly :=
[
  term ((-709269032276389866516423294359460419031600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-709269032276389866516423294359460419031600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((354634516138194933258211647179730209515800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((354634516138194933258211647179730209515800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 11. -/
theorem ep_Q2_008_partial_11_0542_valid :
    mulPoly ep_Q2_008_coefficient_11_0542
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0543 : Poly :=
[
  term ((-856592119586047088442757934298072091125714 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 11. -/
def ep_Q2_008_partial_11_0543 : Poly :=
[
  term ((-1713184239172094176885515868596144182251428 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1713184239172094176885515868596144182251428 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((856592119586047088442757934298072091125714 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((856592119586047088442757934298072091125714 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 11. -/
theorem ep_Q2_008_partial_11_0543_valid :
    mulPoly ep_Q2_008_coefficient_11_0543
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0544 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 544 for generator 11. -/
def ep_Q2_008_partial_11_0544 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 11. -/
theorem ep_Q2_008_partial_11_0544_valid :
    mulPoly ep_Q2_008_coefficient_11_0544
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0545 : Poly :=
[
  term ((-113420509116854213844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 545 for generator 11. -/
def ep_Q2_008_partial_11_0545 : Poly :=
[
  term ((-226841018233708427688 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-226841018233708427688 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((113420509116854213844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((113420509116854213844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 11. -/
theorem ep_Q2_008_partial_11_0545_valid :
    mulPoly ep_Q2_008_coefficient_11_0545
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0546 : Poly :=
[
  term ((-4042934985541246140268940420619518860800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 11. -/
def ep_Q2_008_partial_11_0546 : Poly :=
[
  term ((-8085869971082492280537880841239037721600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-8085869971082492280537880841239037721600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((4042934985541246140268940420619518860800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((4042934985541246140268940420619518860800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 11. -/
theorem ep_Q2_008_partial_11_0546_valid :
    mulPoly ep_Q2_008_coefficient_11_0546
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0547 : Poly :=
[
  term ((612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 547 for generator 11. -/
def ep_Q2_008_partial_11_0547 : Poly :=
[
  term ((1225192540928090685799698365092789449600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1225192540928090685799698365092789449600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 11. -/
theorem ep_Q2_008_partial_11_0547_valid :
    mulPoly ep_Q2_008_coefficient_11_0547
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0548 : Poly :=
[
  term ((2508578160229573863 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 548 for generator 11. -/
def ep_Q2_008_partial_11_0548 : Poly :=
[
  term ((2508578160229573863 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2508578160229573863 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2508578160229573863 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-2508578160229573863 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 11. -/
theorem ep_Q2_008_partial_11_0548_valid :
    mulPoly ep_Q2_008_coefficient_11_0548
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0549 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 549 for generator 11. -/
def ep_Q2_008_partial_11_0549 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 11. -/
theorem ep_Q2_008_partial_11_0549_valid :
    mulPoly ep_Q2_008_coefficient_11_0549
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0550 : Poly :=
[
  term ((3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 550 for generator 11. -/
def ep_Q2_008_partial_11_0550 : Poly :=
[
  term ((7030820451939963474 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((7030820451939963474 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 11. -/
theorem ep_Q2_008_partial_11_0550_valid :
    mulPoly ep_Q2_008_coefficient_11_0550
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0551 : Poly :=
[
  term ((-832735783534796265773740664932308529068600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 551 for generator 11. -/
def ep_Q2_008_partial_11_0551 : Poly :=
[
  term ((-1665471567069592531547481329864617058137200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1665471567069592531547481329864617058137200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((832735783534796265773740664932308529068600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((832735783534796265773740664932308529068600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 11. -/
theorem ep_Q2_008_partial_11_0551_valid :
    mulPoly ep_Q2_008_coefficient_11_0551
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0552 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 552 for generator 11. -/
def ep_Q2_008_partial_11_0552 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 11. -/
theorem ep_Q2_008_partial_11_0552_valid :
    mulPoly ep_Q2_008_coefficient_11_0552
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0553 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 553 for generator 11. -/
def ep_Q2_008_partial_11_0553 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 11. -/
theorem ep_Q2_008_partial_11_0553_valid :
    mulPoly ep_Q2_008_coefficient_11_0553
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0554 : Poly :=
[
  term ((42285414209435613000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 554 for generator 11. -/
def ep_Q2_008_partial_11_0554 : Poly :=
[
  term ((84570828418871226000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((84570828418871226000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-42285414209435613000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-42285414209435613000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 11. -/
theorem ep_Q2_008_partial_11_0554_valid :
    mulPoly ep_Q2_008_coefficient_11_0554
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0555 : Poly :=
[
  term ((3500590048456444828769448412975437062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 555 for generator 11. -/
def ep_Q2_008_partial_11_0555 : Poly :=
[
  term ((7001180096912889657538896825950874124800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((7001180096912889657538896825950874124800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3500590048456444828769448412975437062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-3500590048456444828769448412975437062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 11. -/
theorem ep_Q2_008_partial_11_0555_valid :
    mulPoly ep_Q2_008_coefficient_11_0555
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0556 : Poly :=
[
  term ((62162829090178350845471504034508140585750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 556 for generator 11. -/
def ep_Q2_008_partial_11_0556 : Poly :=
[
  term ((124325658180356701690943008069016281171500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((124325658180356701690943008069016281171500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-62162829090178350845471504034508140585750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-62162829090178350845471504034508140585750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 11. -/
theorem ep_Q2_008_partial_11_0556_valid :
    mulPoly ep_Q2_008_coefficient_11_0556
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0557 : Poly :=
[
  term ((-56410347394066407663 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 557 for generator 11. -/
def ep_Q2_008_partial_11_0557 : Poly :=
[
  term ((-56410347394066407663 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-56410347394066407663 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((56410347394066407663 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((56410347394066407663 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 11. -/
theorem ep_Q2_008_partial_11_0557_valid :
    mulPoly ep_Q2_008_coefficient_11_0557
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0558 : Poly :=
[
  term ((-61851666586263329614777033307281783858800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 558 for generator 11. -/
def ep_Q2_008_partial_11_0558 : Poly :=
[
  term ((-123703333172526659229554066614563567717600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-123703333172526659229554066614563567717600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((61851666586263329614777033307281783858800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((61851666586263329614777033307281783858800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 11. -/
theorem ep_Q2_008_partial_11_0558_valid :
    mulPoly ep_Q2_008_coefficient_11_0558
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0559 : Poly :=
[
  term ((429348199268289071595 : Rat) / 11087303257826821744) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 559 for generator 11. -/
def ep_Q2_008_partial_11_0559 : Poly :=
[
  term ((429348199268289071595 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((429348199268289071595 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-429348199268289071595 : Rat) / 11087303257826821744) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-429348199268289071595 : Rat) / 11087303257826821744) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 11. -/
theorem ep_Q2_008_partial_11_0559_valid :
    mulPoly ep_Q2_008_coefficient_11_0559
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0560 : Poly :=
[
  term ((-29556640039921168608276854985855516877393815 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 11. -/
def ep_Q2_008_partial_11_0560 : Poly :=
[
  term ((-59113280079842337216553709971711033754787630 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-59113280079842337216553709971711033754787630 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((29556640039921168608276854985855516877393815 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((29556640039921168608276854985855516877393815 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 11. -/
theorem ep_Q2_008_partial_11_0560_valid :
    mulPoly ep_Q2_008_coefficient_11_0560
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0561 : Poly :=
[
  term ((-11845052805536601115587197517523254640718133 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 561 for generator 11. -/
def ep_Q2_008_partial_11_0561 : Poly :=
[
  term ((-11845052805536601115587197517523254640718133 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11845052805536601115587197517523254640718133 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((11845052805536601115587197517523254640718133 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11845052805536601115587197517523254640718133 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 11. -/
theorem ep_Q2_008_partial_11_0561_valid :
    mulPoly ep_Q2_008_coefficient_11_0561
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0562 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 562 for generator 11. -/
def ep_Q2_008_partial_11_0562 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 11. -/
theorem ep_Q2_008_partial_11_0562_valid :
    mulPoly ep_Q2_008_coefficient_11_0562
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0563 : Poly :=
[
  term ((23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 11. -/
def ep_Q2_008_partial_11_0563 : Poly :=
[
  term ((46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 11. -/
theorem ep_Q2_008_partial_11_0563_valid :
    mulPoly ep_Q2_008_coefficient_11_0563
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0564 : Poly :=
[
  term ((3791649157792874761358312743929201318513042 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 564 for generator 11. -/
def ep_Q2_008_partial_11_0564 : Poly :=
[
  term ((7583298315585749522716625487858402637026084 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7583298315585749522716625487858402637026084 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3791649157792874761358312743929201318513042 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3791649157792874761358312743929201318513042 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 11. -/
theorem ep_Q2_008_partial_11_0564_valid :
    mulPoly ep_Q2_008_coefficient_11_0564
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0565 : Poly :=
[
  term ((-468383746323296352707 : Rat) / 5543651628913410872) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 565 for generator 11. -/
def ep_Q2_008_partial_11_0565 : Poly :=
[
  term ((-468383746323296352707 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-468383746323296352707 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((468383746323296352707 : Rat) / 5543651628913410872) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((468383746323296352707 : Rat) / 5543651628913410872) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 11. -/
theorem ep_Q2_008_partial_11_0565_valid :
    mulPoly ep_Q2_008_coefficient_11_0565
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0566 : Poly :=
[
  term ((-44490282378035856933748314314266869097524876 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 566 for generator 11. -/
def ep_Q2_008_partial_11_0566 : Poly :=
[
  term ((-88980564756071713867496628628533738195049752 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-88980564756071713867496628628533738195049752 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((44490282378035856933748314314266869097524876 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((44490282378035856933748314314266869097524876 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 11. -/
theorem ep_Q2_008_partial_11_0566_valid :
    mulPoly ep_Q2_008_coefficient_11_0566
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0567 : Poly :=
[
  term ((209897459040838295493 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 567 for generator 11. -/
def ep_Q2_008_partial_11_0567 : Poly :=
[
  term ((209897459040838295493 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((209897459040838295493 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-209897459040838295493 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (14, 2), (16, 1)],
  term ((-209897459040838295493 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 11. -/
theorem ep_Q2_008_partial_11_0567_valid :
    mulPoly ep_Q2_008_coefficient_11_0567
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0568 : Poly :=
[
  term ((-13386330175821593641277173172637925348940981 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 568 for generator 11. -/
def ep_Q2_008_partial_11_0568 : Poly :=
[
  term ((-13386330175821593641277173172637925348940981 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13386330175821593641277173172637925348940981 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((13386330175821593641277173172637925348940981 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((13386330175821593641277173172637925348940981 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 11. -/
theorem ep_Q2_008_partial_11_0568_valid :
    mulPoly ep_Q2_008_coefficient_11_0568
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0569 : Poly :=
[
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 569 for generator 11. -/
def ep_Q2_008_partial_11_0569 : Poly :=
[
  term ((67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (14, 2), (15, 3), (16, 1)],
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 11. -/
theorem ep_Q2_008_partial_11_0569_valid :
    mulPoly ep_Q2_008_coefficient_11_0569
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0570 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 11. -/
def ep_Q2_008_partial_11_0570 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 11. -/
theorem ep_Q2_008_partial_11_0570_valid :
    mulPoly ep_Q2_008_coefficient_11_0570
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0571 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 571 for generator 11. -/
def ep_Q2_008_partial_11_0571 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 11. -/
theorem ep_Q2_008_partial_11_0571_valid :
    mulPoly ep_Q2_008_coefficient_11_0571
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0572 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 11. -/
def ep_Q2_008_partial_11_0572 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 11. -/
theorem ep_Q2_008_partial_11_0572_valid :
    mulPoly ep_Q2_008_coefficient_11_0572
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0573 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 573 for generator 11. -/
def ep_Q2_008_partial_11_0573 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 11. -/
theorem ep_Q2_008_partial_11_0573_valid :
    mulPoly ep_Q2_008_coefficient_11_0573
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0574 : Poly :=
[
  term ((1323088970350545106857279900375033600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 574 for generator 11. -/
def ep_Q2_008_partial_11_0574 : Poly :=
[
  term ((2646177940701090213714559800750067200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2646177940701090213714559800750067200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1323088970350545106857279900375033600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1323088970350545106857279900375033600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 11. -/
theorem ep_Q2_008_partial_11_0574_valid :
    mulPoly ep_Q2_008_coefficient_11_0574
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0575 : Poly :=
[
  term ((-54100481571005072518554486600700800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 11. -/
def ep_Q2_008_partial_11_0575 : Poly :=
[
  term ((-108200963142010145037108973201401600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108200963142010145037108973201401600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((54100481571005072518554486600700800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((54100481571005072518554486600700800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 11. -/
theorem ep_Q2_008_partial_11_0575_valid :
    mulPoly ep_Q2_008_coefficient_11_0575
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0576 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 11. -/
def ep_Q2_008_partial_11_0576 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 11. -/
theorem ep_Q2_008_partial_11_0576_valid :
    mulPoly ep_Q2_008_coefficient_11_0576
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0577 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 577 for generator 11. -/
def ep_Q2_008_partial_11_0577 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 11. -/
theorem ep_Q2_008_partial_11_0577_valid :
    mulPoly ep_Q2_008_coefficient_11_0577
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0578 : Poly :=
[
  term ((-1145601425547423202278864303983260800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 578 for generator 11. -/
def ep_Q2_008_partial_11_0578 : Poly :=
[
  term ((-2291202851094846404557728607966521600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2291202851094846404557728607966521600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1145601425547423202278864303983260800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1145601425547423202278864303983260800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 11. -/
theorem ep_Q2_008_partial_11_0578_valid :
    mulPoly ep_Q2_008_coefficient_11_0578
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0579 : Poly :=
[
  term ((42710906503425057251490384158448000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 11. -/
def ep_Q2_008_partial_11_0579 : Poly :=
[
  term ((85421813006850114502980768316896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((85421813006850114502980768316896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-42710906503425057251490384158448000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-42710906503425057251490384158448000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 11. -/
theorem ep_Q2_008_partial_11_0579_valid :
    mulPoly ep_Q2_008_coefficient_11_0579
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0580 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 580 for generator 11. -/
def ep_Q2_008_partial_11_0580 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 4), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 11. -/
theorem ep_Q2_008_partial_11_0580_valid :
    mulPoly ep_Q2_008_coefficient_11_0580
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0581 : Poly :=
[
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 581 for generator 11. -/
def ep_Q2_008_partial_11_0581 : Poly :=
[
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(2, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 11. -/
theorem ep_Q2_008_partial_11_0581_valid :
    mulPoly ep_Q2_008_coefficient_11_0581
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0582 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 582 for generator 11. -/
def ep_Q2_008_partial_11_0582 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 11. -/
theorem ep_Q2_008_partial_11_0582_valid :
    mulPoly ep_Q2_008_coefficient_11_0582
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0583 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 583 for generator 11. -/
def ep_Q2_008_partial_11_0583 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 11. -/
theorem ep_Q2_008_partial_11_0583_valid :
    mulPoly ep_Q2_008_coefficient_11_0583
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0584 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 584 for generator 11. -/
def ep_Q2_008_partial_11_0584 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (10, 1), (15, 3), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 11. -/
theorem ep_Q2_008_partial_11_0584_valid :
    mulPoly ep_Q2_008_coefficient_11_0584
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0585 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 585 for generator 11. -/
def ep_Q2_008_partial_11_0585 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 11. -/
theorem ep_Q2_008_partial_11_0585_valid :
    mulPoly ep_Q2_008_coefficient_11_0585
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0586 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 586 for generator 11. -/
def ep_Q2_008_partial_11_0586 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 11. -/
theorem ep_Q2_008_partial_11_0586_valid :
    mulPoly ep_Q2_008_coefficient_11_0586
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0587 : Poly :=
[
  term ((220661431299342823467 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 587 for generator 11. -/
def ep_Q2_008_partial_11_0587 : Poly :=
[
  term ((441322862598685646934 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((441322862598685646934 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-220661431299342823467 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-220661431299342823467 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 11. -/
theorem ep_Q2_008_partial_11_0587_valid :
    mulPoly ep_Q2_008_coefficient_11_0587
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0588 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 588 for generator 11. -/
def ep_Q2_008_partial_11_0588 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (12, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 11. -/
theorem ep_Q2_008_partial_11_0588_valid :
    mulPoly ep_Q2_008_coefficient_11_0588
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0589 : Poly :=
[
  term ((-95270049430979352471 : Rat) / 11087303257826821744) [(5, 2), (12, 1), (16, 1)]
]

/-- Partial product 589 for generator 11. -/
def ep_Q2_008_partial_11_0589 : Poly :=
[
  term ((-95270049430979352471 : Rat) / 5543651628913410872) [(2, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-95270049430979352471 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((95270049430979352471 : Rat) / 11087303257826821744) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((95270049430979352471 : Rat) / 11087303257826821744) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 11. -/
theorem ep_Q2_008_partial_11_0589_valid :
    mulPoly ep_Q2_008_coefficient_11_0589
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0590 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 2), (16, 1)]
]

/-- Partial product 590 for generator 11. -/
def ep_Q2_008_partial_11_0590 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 2), (14, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 2), (14, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 11. -/
theorem ep_Q2_008_partial_11_0590_valid :
    mulPoly ep_Q2_008_coefficient_11_0590
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0591 : Poly :=
[
  term ((5244562128591742770186447078760520689852056 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 591 for generator 11. -/
def ep_Q2_008_partial_11_0591 : Poly :=
[
  term ((10489124257183485540372894157521041379704112 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10489124257183485540372894157521041379704112 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5244562128591742770186447078760520689852056 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5244562128591742770186447078760520689852056 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 11. -/
theorem ep_Q2_008_partial_11_0591_valid :
    mulPoly ep_Q2_008_coefficient_11_0591
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0592 : Poly :=
[
  term ((-382121015176910743077 : Rat) / 1385912907228352718) [(5, 2), (13, 2), (16, 1)]
]

/-- Partial product 592 for generator 11. -/
def ep_Q2_008_partial_11_0592 : Poly :=
[
  term ((-382121015176910743077 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-382121015176910743077 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((382121015176910743077 : Rat) / 1385912907228352718) [(5, 2), (13, 2), (14, 2), (16, 1)],
  term ((382121015176910743077 : Rat) / 1385912907228352718) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 11. -/
theorem ep_Q2_008_partial_11_0592_valid :
    mulPoly ep_Q2_008_coefficient_11_0592
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0593 : Poly :=
[
  term ((-655149807350459982197093495705599685036307 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 593 for generator 11. -/
def ep_Q2_008_partial_11_0593 : Poly :=
[
  term ((-1310299614700919964394186991411199370072614 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1310299614700919964394186991411199370072614 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((655149807350459982197093495705599685036307 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((655149807350459982197093495705599685036307 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 11. -/
theorem ep_Q2_008_partial_11_0593_valid :
    mulPoly ep_Q2_008_coefficient_11_0593
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0594 : Poly :=
[
  term ((304366984666083203175 : Rat) / 22174606515653643488) [(5, 2), (16, 1)]
]

/-- Partial product 594 for generator 11. -/
def ep_Q2_008_partial_11_0594 : Poly :=
[
  term ((304366984666083203175 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((304366984666083203175 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-304366984666083203175 : Rat) / 22174606515653643488) [(5, 2), (14, 2), (16, 1)],
  term ((-304366984666083203175 : Rat) / 22174606515653643488) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 11. -/
theorem ep_Q2_008_partial_11_0594_valid :
    mulPoly ep_Q2_008_coefficient_11_0594
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0595 : Poly :=
[
  term ((16979061979207944000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 595 for generator 11. -/
def ep_Q2_008_partial_11_0595 : Poly :=
[
  term ((33958123958415888000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((33958123958415888000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 11. -/
theorem ep_Q2_008_partial_11_0595_valid :
    mulPoly ep_Q2_008_coefficient_11_0595
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0596 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 596 for generator 11. -/
def ep_Q2_008_partial_11_0596 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 11. -/
theorem ep_Q2_008_partial_11_0596_valid :
    mulPoly ep_Q2_008_coefficient_11_0596
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0597 : Poly :=
[
  term ((8198181496153666134367339278956758617600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 597 for generator 11. -/
def ep_Q2_008_partial_11_0597 : Poly :=
[
  term ((16396362992307332268734678557913517235200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16396362992307332268734678557913517235200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8198181496153666134367339278956758617600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8198181496153666134367339278956758617600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 11. -/
theorem ep_Q2_008_partial_11_0597_valid :
    mulPoly ep_Q2_008_coefficient_11_0597
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0598 : Poly :=
[
  term ((46550720181599095131 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 598 for generator 11. -/
def ep_Q2_008_partial_11_0598 : Poly :=
[
  term ((93101440363198190262 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((93101440363198190262 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-46550720181599095131 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-46550720181599095131 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 11. -/
theorem ep_Q2_008_partial_11_0598_valid :
    mulPoly ep_Q2_008_coefficient_11_0598
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0599 : Poly :=
[
  term ((3922206402507003772808103794815574976000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 11. -/
def ep_Q2_008_partial_11_0599 : Poly :=
[
  term ((7844412805014007545616207589631149952000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((7844412805014007545616207589631149952000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3922206402507003772808103794815574976000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-3922206402507003772808103794815574976000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 11. -/
theorem ep_Q2_008_partial_11_0599_valid :
    mulPoly ep_Q2_008_coefficient_11_0599
        ep_Q2_008_generator_11_0500_0599 =
      ep_Q2_008_partial_11_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_11_0500_0599 : List Poly :=
[
  ep_Q2_008_partial_11_0500,
  ep_Q2_008_partial_11_0501,
  ep_Q2_008_partial_11_0502,
  ep_Q2_008_partial_11_0503,
  ep_Q2_008_partial_11_0504,
  ep_Q2_008_partial_11_0505,
  ep_Q2_008_partial_11_0506,
  ep_Q2_008_partial_11_0507,
  ep_Q2_008_partial_11_0508,
  ep_Q2_008_partial_11_0509,
  ep_Q2_008_partial_11_0510,
  ep_Q2_008_partial_11_0511,
  ep_Q2_008_partial_11_0512,
  ep_Q2_008_partial_11_0513,
  ep_Q2_008_partial_11_0514,
  ep_Q2_008_partial_11_0515,
  ep_Q2_008_partial_11_0516,
  ep_Q2_008_partial_11_0517,
  ep_Q2_008_partial_11_0518,
  ep_Q2_008_partial_11_0519,
  ep_Q2_008_partial_11_0520,
  ep_Q2_008_partial_11_0521,
  ep_Q2_008_partial_11_0522,
  ep_Q2_008_partial_11_0523,
  ep_Q2_008_partial_11_0524,
  ep_Q2_008_partial_11_0525,
  ep_Q2_008_partial_11_0526,
  ep_Q2_008_partial_11_0527,
  ep_Q2_008_partial_11_0528,
  ep_Q2_008_partial_11_0529,
  ep_Q2_008_partial_11_0530,
  ep_Q2_008_partial_11_0531,
  ep_Q2_008_partial_11_0532,
  ep_Q2_008_partial_11_0533,
  ep_Q2_008_partial_11_0534,
  ep_Q2_008_partial_11_0535,
  ep_Q2_008_partial_11_0536,
  ep_Q2_008_partial_11_0537,
  ep_Q2_008_partial_11_0538,
  ep_Q2_008_partial_11_0539,
  ep_Q2_008_partial_11_0540,
  ep_Q2_008_partial_11_0541,
  ep_Q2_008_partial_11_0542,
  ep_Q2_008_partial_11_0543,
  ep_Q2_008_partial_11_0544,
  ep_Q2_008_partial_11_0545,
  ep_Q2_008_partial_11_0546,
  ep_Q2_008_partial_11_0547,
  ep_Q2_008_partial_11_0548,
  ep_Q2_008_partial_11_0549,
  ep_Q2_008_partial_11_0550,
  ep_Q2_008_partial_11_0551,
  ep_Q2_008_partial_11_0552,
  ep_Q2_008_partial_11_0553,
  ep_Q2_008_partial_11_0554,
  ep_Q2_008_partial_11_0555,
  ep_Q2_008_partial_11_0556,
  ep_Q2_008_partial_11_0557,
  ep_Q2_008_partial_11_0558,
  ep_Q2_008_partial_11_0559,
  ep_Q2_008_partial_11_0560,
  ep_Q2_008_partial_11_0561,
  ep_Q2_008_partial_11_0562,
  ep_Q2_008_partial_11_0563,
  ep_Q2_008_partial_11_0564,
  ep_Q2_008_partial_11_0565,
  ep_Q2_008_partial_11_0566,
  ep_Q2_008_partial_11_0567,
  ep_Q2_008_partial_11_0568,
  ep_Q2_008_partial_11_0569,
  ep_Q2_008_partial_11_0570,
  ep_Q2_008_partial_11_0571,
  ep_Q2_008_partial_11_0572,
  ep_Q2_008_partial_11_0573,
  ep_Q2_008_partial_11_0574,
  ep_Q2_008_partial_11_0575,
  ep_Q2_008_partial_11_0576,
  ep_Q2_008_partial_11_0577,
  ep_Q2_008_partial_11_0578,
  ep_Q2_008_partial_11_0579,
  ep_Q2_008_partial_11_0580,
  ep_Q2_008_partial_11_0581,
  ep_Q2_008_partial_11_0582,
  ep_Q2_008_partial_11_0583,
  ep_Q2_008_partial_11_0584,
  ep_Q2_008_partial_11_0585,
  ep_Q2_008_partial_11_0586,
  ep_Q2_008_partial_11_0587,
  ep_Q2_008_partial_11_0588,
  ep_Q2_008_partial_11_0589,
  ep_Q2_008_partial_11_0590,
  ep_Q2_008_partial_11_0591,
  ep_Q2_008_partial_11_0592,
  ep_Q2_008_partial_11_0593,
  ep_Q2_008_partial_11_0594,
  ep_Q2_008_partial_11_0595,
  ep_Q2_008_partial_11_0596,
  ep_Q2_008_partial_11_0597,
  ep_Q2_008_partial_11_0598,
  ep_Q2_008_partial_11_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_11_0500_0599 : Poly :=
[
  term ((132137656254827461035385883830630742400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((44411308128742082624821433791810477612503 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((605731163546648034101 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14216774552440302744704127871180800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-313253702922519852522514817525222400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3646683449829076519373112799684416000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((108981808714019176816647646891296000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27545000695353086567864247750412800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-295967397500802666230658662045491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4379049282100099274116635386866579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((40913615402335303069276367992915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3771082783353798885 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(2, 1), (5, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4928658474989860215 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((936120975753739500 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((9820236341348087733 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-43612526316649146474 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((768345533009169231167854899741119220525900 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((135570620920520936738255593817413010498400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((20291125800685706985 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2618491747493865323917392350179825232260428 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-709269032276389866516423294359460419031600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1713184239172094176885515868596144182251428 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-226841018233708427688 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-8085869971082492280537880841239037721600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1225192540928090685799698365092789449600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2508578160229573863 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7030820451939963474 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1665471567069592531547481329864617058137200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((84570828418871226000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7001180096912889657538896825950874124800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((124325658180356701690943008069016281171500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56410347394066407663 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-123703333172526659229554066614563567717600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((429348199268289071595 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59113280079842337216553709971711033754787630 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11845052805536601115587197517523254640718133 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((7583298315585749522716625487858402637026084 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-468383746323296352707 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-88980564756071713867496628628533738195049752 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((209897459040838295493 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-13386330175821593641277173172637925348940981 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2646177940701090213714559800750067200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-108200963142010145037108973201401600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2291202851094846404557728607966521600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((85421813006850114502980768316896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(2, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((441322862598685646934 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-95270049430979352471 : Rat) / 5543651628913410872) [(2, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 2), (14, 1), (16, 1)],
  term ((10489124257183485540372894157521041379704112 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-382121015176910743077 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1310299614700919964394186991411199370072614 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((304366984666083203175 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((33958123958415888000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((16396362992307332268734678557913517235200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((93101440363198190262 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7844412805014007545616207589631149952000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((132137656254827461035385883830630742400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((605731163546648034101 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((44411308128742082624821433791810477612503 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-14216774552440302744704127871180800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-313253702922519852522514817525222400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3646683449829076519373112799684416000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((108981808714019176816647646891296000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((27545000695353086567864247750412800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-295967397500802666230658662045491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((4379049282100099274116635386866579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((40913615402335303069276367992915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 4), (16, 1)],
  term ((752853231626973750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-322003512479542686705364295353207737600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9869659753932509733 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((16792285477825610267067920188829228398200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((3771082783353798885 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((156347975682157151764188561375430041600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-33910573012380019741064666099712975270000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((182405971629183343724886654938001715200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4928658474989860215 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((936120975753739500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((245386465009375099097694244034521530048600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((9820236341348087733 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43612526316649146474 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((768345533009169231167854899741119220525900 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((20291125800685706985 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((135570620920520936738255593817413010498400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2618491747493865323917392350179825232260428 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-709269032276389866516423294359460419031600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1713184239172094176885515868596144182251428 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-226841018233708427688 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-8085869971082492280537880841239037721600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((2508578160229573863 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1225192540928090685799698365092789449600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((7030820451939963474 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1665471567069592531547481329864617058137200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((84570828418871226000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((7001180096912889657538896825950874124800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-56410347394066407663 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((124325658180356701690943008069016281171500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((429348199268289071595 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-123703333172526659229554066614563567717600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-59113280079842337216553709971711033754787630 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11845052805536601115587197517523254640718133 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((46027907371030082688379412520591520335600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-468383746323296352707 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((7583298315585749522716625487858402637026084 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-88980564756071713867496628628533738195049752 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((209897459040838295493 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13386330175821593641277173172637925348940981 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2646177940701090213714559800750067200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-108200963142010145037108973201401600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2291202851094846404557728607966521600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((85421813006850114502980768316896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 4), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (10, 1), (15, 3), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((441322862598685646934 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-95270049430979352471 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (12, 1), (15, 3), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((10489124257183485540372894157521041379704112 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-382121015176910743077 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((304366984666083203175 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-1310299614700919964394186991411199370072614 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((33958123958415888000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((16396362992307332268734678557913517235200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((93101440363198190262 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7844412805014007545616207589631149952000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-66068828127413730517692941915315371200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-66068828127413730517692941915315371200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-44411308128742082624821433791810477612503 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-605731163546648034101 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-605731163546648034101 : Rat) / 22174606515653643488) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-44411308128742082624821433791810477612503 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 3), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((1823341724914538259686556399842208000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1823341724914538259686556399842208000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-54490904357009588408323823445648000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-54490904357009588408323823445648000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 3), (16, 1)],
  term ((147983698750401333115329331022745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((147983698750401333115329331022745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((-2189524641050049637058317693433289600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2189524641050049637058317693433289600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-20456807701167651534638183996457600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (14, 2), (15, 3), (16, 1)],
  term ((-20456807701167651534638183996457600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 5), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (15, 4), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 3), (14, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-9820236341348087733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-9820236341348087733 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((21806263158324573237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((21806263158324573237 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-384172766504584615583927449870559610262950 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-67785310460260468369127796908706505249200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-20291125800685706985 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-20291125800685706985 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-67785310460260468369127796908706505249200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1309245873746932661958696175089912616130214 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1309245873746932661958696175089912616130214 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (14, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((354634516138194933258211647179730209515800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((354634516138194933258211647179730209515800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((856592119586047088442757934298072091125714 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((856592119586047088442757934298072091125714 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((113420509116854213844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((113420509116854213844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 4), (16, 1)],
  term ((4042934985541246140268940420619518860800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((4042934985541246140268940420619518860800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2508578160229573863 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-2508578160229573863 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-612596270464045342899849182546394724800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-3515410225969981737 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((832735783534796265773740664932308529068600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((832735783534796265773740664932308529068600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-42285414209435613000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-42285414209435613000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-3500590048456444828769448412975437062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-3500590048456444828769448412975437062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-62162829090178350845471504034508140585750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((56410347394066407663 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((56410347394066407663 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-62162829090178350845471504034508140585750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (15, 4), (16, 1)],
  term ((61851666586263329614777033307281783858800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-429348199268289071595 : Rat) / 11087303257826821744) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-429348199268289071595 : Rat) / 11087303257826821744) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((61851666586263329614777033307281783858800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((29556640039921168608276854985855516877393815 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((29556640039921168608276854985855516877393815 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((11845052805536601115587197517523254640718133 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11845052805536601115587197517523254640718133 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-23013953685515041344189706260295760167800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3791649157792874761358312743929201318513042 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((468383746323296352707 : Rat) / 5543651628913410872) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((468383746323296352707 : Rat) / 5543651628913410872) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3791649157792874761358312743929201318513042 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((44490282378035856933748314314266869097524876 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((44490282378035856933748314314266869097524876 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-209897459040838295493 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (14, 2), (16, 1)],
  term ((-209897459040838295493 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((13386330175821593641277173172637925348940981 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (14, 2), (15, 3), (16, 1)],
  term ((13386330175821593641277173172637925348940981 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (15, 3), (16, 1)],
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (15, 5), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1323088970350545106857279900375033600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1323088970350545106857279900375033600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((54100481571005072518554486600700800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((54100481571005072518554486600700800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((1145601425547423202278864303983260800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1145601425547423202278864303983260800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-42710906503425057251490384158448000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-42710906503425057251490384158448000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 5), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 1), (15, 4), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-220661431299342823467 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-220661431299342823467 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((95270049430979352471 : Rat) / 11087303257826821744) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((95270049430979352471 : Rat) / 11087303257826821744) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (12, 1), (15, 4), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 2), (14, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-5244562128591742770186447078760520689852056 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5244562128591742770186447078760520689852056 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((382121015176910743077 : Rat) / 1385912907228352718) [(5, 2), (13, 2), (14, 2), (16, 1)],
  term ((382121015176910743077 : Rat) / 1385912907228352718) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((655149807350459982197093495705599685036307 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((-304366984666083203175 : Rat) / 22174606515653643488) [(5, 2), (14, 2), (16, 1)],
  term ((-304366984666083203175 : Rat) / 22174606515653643488) [(5, 2), (15, 2), (16, 1)],
  term ((655149807350459982197093495705599685036307 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (15, 4), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-8198181496153666134367339278956758617600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8198181496153666134367339278956758617600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-46550720181599095131 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-46550720181599095131 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3922206402507003772808103794815574976000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-3922206402507003772808103794815574976000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 500 through 599. -/
theorem ep_Q2_008_block_11_0500_0599_valid :
    checkProductSumEq ep_Q2_008_partials_11_0500_0599
      ep_Q2_008_block_11_0500_0599 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
