/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 28:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_28_0000_0099 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0000 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0000 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 7558345736637153438456) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 7558345736637153438456) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0000
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0001 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0001 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 2519448578879051146152) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 2519448578879051146152) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0001
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0002 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0002 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0002
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0003 : Poly :=
[
  term ((-2 : Rat) / 3) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 3 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0003 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0003
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0004 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 4 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0004 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0004
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0005 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0005 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0005
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0006 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 5038897157758102292304) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0006 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 2519448578879051146152) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 5038897157758102292304) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 2519448578879051146152) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 5038897157758102292304) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 2519448578879051146152) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 5038897157758102292304) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0006
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0007 : Poly :=
[
  term ((-2 : Rat) / 3) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0007 : Poly :=
[
  term ((-4 : Rat) / 3) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0007
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0008 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0008 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0008
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0009 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 1679632385919367430768) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0009 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 839816192959683715384) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1679632385919367430768) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 839816192959683715384) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1679632385919367430768) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 839816192959683715384) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1679632385919367430768) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0009
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0010 : Poly :=
[
  term ((-1275378802674797468560 : Rat) / 134970459582806311401) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0010 : Poly :=
[
  term ((-2550757605349594937120 : Rat) / 134970459582806311401) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1275378802674797468560 : Rat) / 134970459582806311401) [(2, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((2550757605349594937120 : Rat) / 134970459582806311401) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1275378802674797468560 : Rat) / 134970459582806311401) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-2550757605349594937120 : Rat) / 134970459582806311401) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1275378802674797468560 : Rat) / 134970459582806311401) [(2, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0010
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0011 : Poly :=
[
  term ((255075760534959493712 : Rat) / 44990153194268770467) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0011 : Poly :=
[
  term ((510151521069918987424 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-255075760534959493712 : Rat) / 44990153194268770467) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-510151521069918987424 : Rat) / 44990153194268770467) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((255075760534959493712 : Rat) / 44990153194268770467) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((510151521069918987424 : Rat) / 44990153194268770467) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255075760534959493712 : Rat) / 44990153194268770467) [(2, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0011
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0012 : Poly :=
[
  term ((-530235226376994072010315 : Rat) / 1889586434159288359614) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0012 : Poly :=
[
  term ((-530235226376994072010315 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((530235226376994072010315 : Rat) / 1889586434159288359614) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((530235226376994072010315 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-530235226376994072010315 : Rat) / 1889586434159288359614) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-530235226376994072010315 : Rat) / 944793217079644179807) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((530235226376994072010315 : Rat) / 1889586434159288359614) [(2, 3), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0012
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0013 : Poly :=
[
  term ((106047045275398814402063 : Rat) / 629862144719762786538) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0013 : Poly :=
[
  term ((106047045275398814402063 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-106047045275398814402063 : Rat) / 629862144719762786538) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-106047045275398814402063 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((106047045275398814402063 : Rat) / 629862144719762786538) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((106047045275398814402063 : Rat) / 314931072359881393269) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106047045275398814402063 : Rat) / 629862144719762786538) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0013
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0014 : Poly :=
[
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0014 : Poly :=
[
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(2, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0014
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0015 : Poly :=
[
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0015 : Poly :=
[
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0015
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0016 : Poly :=
[
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0016 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0016
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0017 : Poly :=
[
  term ((44930676255666834836410 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0017 : Poly :=
[
  term ((89861352511333669672820 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44930676255666834836410 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-89861352511333669672820 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((44930676255666834836410 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((89861352511333669672820 : Rat) / 314931072359881393269) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44930676255666834836410 : Rat) / 314931072359881393269) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0017
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0018 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0018 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(2, 1), (3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(2, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0018
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0019 : Poly :=
[
  term ((310454755541631184995655 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0019 : Poly :=
[
  term ((310454755541631184995655 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-310454755541631184995655 : Rat) / 1889586434159288359614) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-310454755541631184995655 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((310454755541631184995655 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((310454755541631184995655 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-310454755541631184995655 : Rat) / 1889586434159288359614) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0019
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0020 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0020 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0020
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0021 : Poly :=
[
  term ((-8986135251133366967282 : Rat) / 104977024119960464423) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0021 : Poly :=
[
  term ((-17972270502266733934564 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8986135251133366967282 : Rat) / 104977024119960464423) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((17972270502266733934564 : Rat) / 104977024119960464423) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8986135251133366967282 : Rat) / 104977024119960464423) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17972270502266733934564 : Rat) / 104977024119960464423) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8986135251133366967282 : Rat) / 104977024119960464423) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0021
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0022 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0022 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(2, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0022
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0023 : Poly :=
[
  term ((-62090951108326236999131 : Rat) / 629862144719762786538) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0023 : Poly :=
[
  term ((-62090951108326236999131 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((62090951108326236999131 : Rat) / 629862144719762786538) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((62090951108326236999131 : Rat) / 314931072359881393269) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62090951108326236999131 : Rat) / 629862144719762786538) [(2, 1), (15, 2), (16, 1)],
  term ((-62090951108326236999131 : Rat) / 314931072359881393269) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((62090951108326236999131 : Rat) / 629862144719762786538) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0023
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0024 : Poly :=
[
  term ((3128732592780961547840 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0024 : Poly :=
[
  term ((6257465185561923095680 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3128732592780961547840 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-6257465185561923095680 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((3128732592780961547840 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((6257465185561923095680 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3128732592780961547840 : Rat) / 104977024119960464423) [(3, 3), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0024
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0025 : Poly :=
[
  term ((-1877239555668576928704 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0025 : Poly :=
[
  term ((-3754479111337153857408 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1877239555668576928704 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((3754479111337153857408 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1877239555668576928704 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3754479111337153857408 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((1877239555668576928704 : Rat) / 104977024119960464423) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0025
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0026 : Poly :=
[
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0026 : Poly :=
[
  term ((40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 104977024119960464423) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(3, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0026
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0027 : Poly :=
[
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0027 : Poly :=
[
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0027
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0028 : Poly :=
[
  term ((17931978120890365681335 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 28 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0028 : Poly :=
[
  term ((35863956241780731362670 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17931978120890365681335 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-35863956241780731362670 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((17931978120890365681335 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((35863956241780731362670 : Rat) / 104977024119960464423) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17931978120890365681335 : Rat) / 104977024119960464423) [(3, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0028
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0029 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0029 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0029
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0030 : Poly :=
[
  term ((30126401832728520492895 : Rat) / 209954048239920928846) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 30 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0030 : Poly :=
[
  term ((30126401832728520492895 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-30126401832728520492895 : Rat) / 209954048239920928846) [(2, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((30126401832728520492895 : Rat) / 209954048239920928846) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-30126401832728520492895 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((30126401832728520492895 : Rat) / 104977024119960464423) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30126401832728520492895 : Rat) / 209954048239920928846) [(3, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0030
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0031 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 31 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0031 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0031
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0032 : Poly :=
[
  term ((-891367733023007537733565 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0032 : Poly :=
[
  term ((-891367733023007537733565 : Rat) / 1889586434159288359614) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((891367733023007537733565 : Rat) / 3779172868318576719228) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((891367733023007537733565 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-891367733023007537733565 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (16, 1)],
  term ((-891367733023007537733565 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((891367733023007537733565 : Rat) / 3779172868318576719228) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0032
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0033 : Poly :=
[
  term ((-10759186872534219408801 : Rat) / 104977024119960464423) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0033 : Poly :=
[
  term ((-21518373745068438817602 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10759186872534219408801 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((21518373745068438817602 : Rat) / 104977024119960464423) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10759186872534219408801 : Rat) / 104977024119960464423) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21518373745068438817602 : Rat) / 104977024119960464423) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((10759186872534219408801 : Rat) / 104977024119960464423) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0033
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0034 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0034 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0034
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0035 : Poly :=
[
  term ((-18075841099637112295737 : Rat) / 209954048239920928846) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0035 : Poly :=
[
  term ((-18075841099637112295737 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((18075841099637112295737 : Rat) / 209954048239920928846) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18075841099637112295737 : Rat) / 209954048239920928846) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((18075841099637112295737 : Rat) / 104977024119960464423) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18075841099637112295737 : Rat) / 104977024119960464423) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((18075841099637112295737 : Rat) / 209954048239920928846) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0035
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0036 : Poly :=
[
  term ((178273546604601507546713 : Rat) / 1259724289439525573076) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0036 : Poly :=
[
  term ((178273546604601507546713 : Rat) / 629862144719762786538) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178273546604601507546713 : Rat) / 1259724289439525573076) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-178273546604601507546713 : Rat) / 629862144719762786538) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((178273546604601507546713 : Rat) / 1259724289439525573076) [(3, 1), (15, 1), (16, 1)],
  term ((178273546604601507546713 : Rat) / 629862144719762786538) [(3, 2), (15, 2), (16, 1)],
  term ((-178273546604601507546713 : Rat) / 1259724289439525573076) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0036
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0037 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 37 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0037 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (15, 3), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 4), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0037
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0038 : Poly :=
[
  term ((4151520840643405522065 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0038 : Poly :=
[
  term ((8303041681286811044130 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4151520840643405522065 : Rat) / 104977024119960464423) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((8303041681286811044130 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4151520840643405522065 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-8303041681286811044130 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((4151520840643405522065 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0038
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0039 : Poly :=
[
  term ((-2490912504386043313239 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0039 : Poly :=
[
  term ((-4981825008772086626478 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2490912504386043313239 : Rat) / 104977024119960464423) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-4981825008772086626478 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((2490912504386043313239 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((4981825008772086626478 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2490912504386043313239 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0039
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0040 : Poly :=
[
  term ((-4666785098551664448140 : Rat) / 134970459582806311401) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0040 : Poly :=
[
  term ((-9333570197103328896280 : Rat) / 134970459582806311401) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((4666785098551664448140 : Rat) / 134970459582806311401) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-9333570197103328896280 : Rat) / 134970459582806311401) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4666785098551664448140 : Rat) / 134970459582806311401) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((9333570197103328896280 : Rat) / 134970459582806311401) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4666785098551664448140 : Rat) / 134970459582806311401) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0040
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0041 : Poly :=
[
  term ((933357019710332889628 : Rat) / 44990153194268770467) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0041 : Poly :=
[
  term ((1866714039420665779256 : Rat) / 44990153194268770467) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-933357019710332889628 : Rat) / 44990153194268770467) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((1866714039420665779256 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-933357019710332889628 : Rat) / 44990153194268770467) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1866714039420665779256 : Rat) / 44990153194268770467) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((933357019710332889628 : Rat) / 44990153194268770467) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0041
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0042 : Poly :=
[
  term ((100784493098877911007535 : Rat) / 944793217079644179807) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 42 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0042 : Poly :=
[
  term ((201568986197755822015070 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((201568986197755822015070 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-201568986197755822015070 : Rat) / 944793217079644179807) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((100784493098877911007535 : Rat) / 944793217079644179807) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0042
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0043 : Poly :=
[
  term ((-20156898619775582201507 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0043 : Poly :=
[
  term ((-40313797239551164403014 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20156898619775582201507 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-40313797239551164403014 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((20156898619775582201507 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((40313797239551164403014 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20156898619775582201507 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0043
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0044 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0044 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0044
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0045 : Poly :=
[
  term ((-61546464674841376364615 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0045 : Poly :=
[
  term ((-61546464674841376364615 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((61546464674841376364615 : Rat) / 629862144719762786538) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-61546464674841376364615 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((61546464674841376364615 : Rat) / 629862144719762786538) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((61546464674841376364615 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61546464674841376364615 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0045
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0046 : Poly :=
[
  term ((-66979652874621181956313 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0046 : Poly :=
[
  term ((-66979652874621181956313 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((66979652874621181956313 : Rat) / 629862144719762786538) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-66979652874621181956313 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((66979652874621181956313 : Rat) / 629862144719762786538) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((66979652874621181956313 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66979652874621181956313 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0046
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0047 : Poly :=
[
  term ((-224761692173891727215255 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 47 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0047 : Poly :=
[
  term ((-449523384347783454430510 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((224761692173891727215255 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((-449523384347783454430510 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((224761692173891727215255 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 2), (16, 1)],
  term ((449523384347783454430510 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-224761692173891727215255 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0047
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0048 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 48 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0048 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0048
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0049 : Poly :=
[
  term ((12309292934968275272923 : Rat) / 209954048239920928846) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0049 : Poly :=
[
  term ((12309292934968275272923 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12309292934968275272923 : Rat) / 209954048239920928846) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((12309292934968275272923 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12309292934968275272923 : Rat) / 209954048239920928846) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12309292934968275272923 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12309292934968275272923 : Rat) / 209954048239920928846) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0049
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0050 : Poly :=
[
  term ((31376865948835574568483 : Rat) / 209954048239920928846) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 50 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0050 : Poly :=
[
  term ((31376865948835574568483 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-31376865948835574568483 : Rat) / 209954048239920928846) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((31376865948835574568483 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-31376865948835574568483 : Rat) / 209954048239920928846) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-31376865948835574568483 : Rat) / 104977024119960464423) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((31376865948835574568483 : Rat) / 209954048239920928846) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0050
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0051 : Poly :=
[
  term ((2128043637743793089855 : Rat) / 9354388287917269107) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 51 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0051 : Poly :=
[
  term ((4256087275487586179710 : Rat) / 9354388287917269107) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2128043637743793089855 : Rat) / 9354388287917269107) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((4256087275487586179710 : Rat) / 9354388287917269107) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2128043637743793089855 : Rat) / 9354388287917269107) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4256087275487586179710 : Rat) / 9354388287917269107) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2128043637743793089855 : Rat) / 9354388287917269107) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0051
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0052 : Poly :=
[
  term ((-425608727548758617971 : Rat) / 3118129429305756369) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0052 : Poly :=
[
  term ((-851217455097517235942 : Rat) / 3118129429305756369) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((425608727548758617971 : Rat) / 3118129429305756369) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-851217455097517235942 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((425608727548758617971 : Rat) / 3118129429305756369) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((851217455097517235942 : Rat) / 3118129429305756369) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425608727548758617971 : Rat) / 3118129429305756369) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0052
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0053 : Poly :=
[
  term ((33472766443737263222305 : Rat) / 209954048239920928846) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 53 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0053 : Poly :=
[
  term ((33472766443737263222305 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-33472766443737263222305 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((33472766443737263222305 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33472766443737263222305 : Rat) / 209954048239920928846) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-33472766443737263222305 : Rat) / 104977024119960464423) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((33472766443737263222305 : Rat) / 209954048239920928846) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0053
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0054 : Poly :=
[
  term ((225335060813510054991155 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 54 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0054 : Poly :=
[
  term ((225335060813510054991155 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-225335060813510054991155 : Rat) / 1889586434159288359614) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((225335060813510054991155 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-225335060813510054991155 : Rat) / 1889586434159288359614) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((225335060813510054991155 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-225335060813510054991155 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0054
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0055 : Poly :=
[
  term ((-269482402855555325507740 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0055 : Poly :=
[
  term ((-538964805711110651015480 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((269482402855555325507740 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-538964805711110651015480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((269482402855555325507740 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((538964805711110651015480 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-269482402855555325507740 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0055
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0056 : Poly :=
[
  term ((-20083659866242357933383 : Rat) / 209954048239920928846) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0056 : Poly :=
[
  term ((-20083659866242357933383 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20083659866242357933383 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20083659866242357933383 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((20083659866242357933383 : Rat) / 209954048239920928846) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((20083659866242357933383 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20083659866242357933383 : Rat) / 209954048239920928846) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0056
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0057 : Poly :=
[
  term ((-45067012162702010998231 : Rat) / 629862144719762786538) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0057 : Poly :=
[
  term ((-45067012162702010998231 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((45067012162702010998231 : Rat) / 629862144719762786538) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45067012162702010998231 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((45067012162702010998231 : Rat) / 629862144719762786538) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45067012162702010998231 : Rat) / 629862144719762786538) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((45067012162702010998231 : Rat) / 314931072359881393269) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0057
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0058 : Poly :=
[
  term ((53896480571111065101548 : Rat) / 314931072359881393269) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0058 : Poly :=
[
  term ((107792961142222130203096 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53896480571111065101548 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((107792961142222130203096 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-53896480571111065101548 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-107792961142222130203096 : Rat) / 314931072359881393269) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((53896480571111065101548 : Rat) / 314931072359881393269) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0058
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0059 : Poly :=
[
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 59 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0059 : Poly :=
[
  term ((11552511886354317511240 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((11552511886354317511240 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-11552511886354317511240 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0059
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0060 : Poly :=
[
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0060 : Poly :=
[
  term ((-6931507131812590506744 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6931507131812590506744 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((6931507131812590506744 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0060
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0061 : Poly :=
[
  term ((-10174790039254025616665 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 61 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0061 : Poly :=
[
  term ((-10174790039254025616665 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10174790039254025616665 : Rat) / 1889586434159288359614) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10174790039254025616665 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10174790039254025616665 : Rat) / 1889586434159288359614) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((10174790039254025616665 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10174790039254025616665 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0061
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0062 : Poly :=
[
  term ((-329774532132269920520035 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 62 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0062 : Poly :=
[
  term ((-329774532132269920520035 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((329774532132269920520035 : Rat) / 7558345736637153438456) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-329774532132269920520035 : Rat) / 3779172868318576719228) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((329774532132269920520035 : Rat) / 7558345736637153438456) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-329774532132269920520035 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((329774532132269920520035 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0062
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0063 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 63 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0063 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0063
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0064 : Poly :=
[
  term ((-283753251731668358315855 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 64 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0064 : Poly :=
[
  term ((-283753251731668358315855 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((283753251731668358315855 : Rat) / 7558345736637153438456) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-283753251731668358315855 : Rat) / 3779172868318576719228) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((283753251731668358315855 : Rat) / 7558345736637153438456) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((283753251731668358315855 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-283753251731668358315855 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0064
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0065 : Poly :=
[
  term ((2034958007850805123333 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0065 : Poly :=
[
  term ((2034958007850805123333 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2034958007850805123333 : Rat) / 629862144719762786538) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2034958007850805123333 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2034958007850805123333 : Rat) / 629862144719762786538) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2034958007850805123333 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2034958007850805123333 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0065
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0066 : Poly :=
[
  term ((65954906426453984104007 : Rat) / 2519448578879051146152) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0066 : Poly :=
[
  term ((65954906426453984104007 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65954906426453984104007 : Rat) / 2519448578879051146152) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((65954906426453984104007 : Rat) / 1259724289439525573076) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65954906426453984104007 : Rat) / 2519448578879051146152) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((65954906426453984104007 : Rat) / 2519448578879051146152) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65954906426453984104007 : Rat) / 1259724289439525573076) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0066
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0067 : Poly :=
[
  term ((60109915118172406524707 : Rat) / 2519448578879051146152) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0067 : Poly :=
[
  term ((60109915118172406524707 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60109915118172406524707 : Rat) / 2519448578879051146152) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((60109915118172406524707 : Rat) / 1259724289439525573076) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-60109915118172406524707 : Rat) / 2519448578879051146152) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-60109915118172406524707 : Rat) / 1259724289439525573076) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((60109915118172406524707 : Rat) / 2519448578879051146152) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0067
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0068 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 68 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0068 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0068
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0069 : Poly :=
[
  term ((-1 : Rat) / 3) [(7, 2), (16, 1)]
]

/-- Partial product 69 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0069 : Poly :=
[
  term ((-2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(2, 2), (7, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(3, 2), (7, 2), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0069
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0070 : Poly :=
[
  term ((-228338901502138650999590 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 70 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0070 : Poly :=
[
  term ((-456677803004277301999180 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((228338901502138650999590 : Rat) / 944793217079644179807) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-456677803004277301999180 : Rat) / 944793217079644179807) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((228338901502138650999590 : Rat) / 944793217079644179807) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((456677803004277301999180 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228338901502138650999590 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0070
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0071 : Poly :=
[
  term ((-1974639146540871569912 : Rat) / 14996717731422923489) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0071 : Poly :=
[
  term ((-3949278293081743139824 : Rat) / 14996717731422923489) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1974639146540871569912 : Rat) / 14996717731422923489) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3949278293081743139824 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((1974639146540871569912 : Rat) / 14996717731422923489) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3949278293081743139824 : Rat) / 14996717731422923489) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1974639146540871569912 : Rat) / 14996717731422923489) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0071
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0072 : Poly :=
[
  term ((9873195732704357849560 : Rat) / 44990153194268770467) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 72 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0072 : Poly :=
[
  term ((19746391465408715699120 : Rat) / 44990153194268770467) [(2, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-9873195732704357849560 : Rat) / 44990153194268770467) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((19746391465408715699120 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9873195732704357849560 : Rat) / 44990153194268770467) [(3, 2), (8, 1), (11, 2), (16, 1)],
  term ((-19746391465408715699120 : Rat) / 44990153194268770467) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((9873195732704357849560 : Rat) / 44990153194268770467) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0072
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0073 : Poly :=
[
  term ((45667780300427730199918 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0073 : Poly :=
[
  term ((91335560600855460399836 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45667780300427730199918 : Rat) / 314931072359881393269) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((91335560600855460399836 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-45667780300427730199918 : Rat) / 314931072359881393269) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91335560600855460399836 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45667780300427730199918 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0073
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0074 : Poly :=
[
  term ((-76932215320372771359995 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 74 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0074 : Poly :=
[
  term ((-153864430640745542719990 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((76932215320372771359995 : Rat) / 944793217079644179807) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-153864430640745542719990 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((76932215320372771359995 : Rat) / 944793217079644179807) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((153864430640745542719990 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-76932215320372771359995 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0074
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0075 : Poly :=
[
  term ((-9139465025292072048215 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 75 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0075 : Poly :=
[
  term ((-18278930050584144096430 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9139465025292072048215 : Rat) / 314931072359881393269) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-18278930050584144096430 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9139465025292072048215 : Rat) / 314931072359881393269) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((18278930050584144096430 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9139465025292072048215 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0075
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0076 : Poly :=
[
  term ((15386443064074554271999 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0076 : Poly :=
[
  term ((30772886128149108543998 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15386443064074554271999 : Rat) / 314931072359881393269) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((30772886128149108543998 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-15386443064074554271999 : Rat) / 314931072359881393269) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30772886128149108543998 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15386443064074554271999 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0076
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0077 : Poly :=
[
  term ((1827893005058414409643 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0077 : Poly :=
[
  term ((3655786010116828819286 : Rat) / 104977024119960464423) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1827893005058414409643 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((3655786010116828819286 : Rat) / 104977024119960464423) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1827893005058414409643 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3655786010116828819286 : Rat) / 104977024119960464423) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1827893005058414409643 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0077
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0078 : Poly :=
[
  term ((21198539313498540667445 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 78 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0078 : Poly :=
[
  term ((21198539313498540667445 : Rat) / 104977024119960464423) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((21198539313498540667445 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 104977024119960464423) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21198539313498540667445 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0078
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0079 : Poly :=
[
  term ((6366447014118188586775 : Rat) / 102139807251853424844) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0079 : Poly :=
[
  term ((6366447014118188586775 : Rat) / 51069903625926712422) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6366447014118188586775 : Rat) / 102139807251853424844) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6366447014118188586775 : Rat) / 51069903625926712422) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6366447014118188586775 : Rat) / 102139807251853424844) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6366447014118188586775 : Rat) / 51069903625926712422) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6366447014118188586775 : Rat) / 102139807251853424844) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0079
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0080 : Poly :=
[
  term ((-12719123588099124400467 : Rat) / 209954048239920928846) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0080 : Poly :=
[
  term ((-12719123588099124400467 : Rat) / 104977024119960464423) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12719123588099124400467 : Rat) / 104977024119960464423) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 209954048239920928846) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0080_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0080
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0081 : Poly :=
[
  term ((-1273289402823637717355 : Rat) / 34046602417284474948) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 81 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0081 : Poly :=
[
  term ((-1273289402823637717355 : Rat) / 17023301208642237474) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1273289402823637717355 : Rat) / 34046602417284474948) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1273289402823637717355 : Rat) / 17023301208642237474) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((1273289402823637717355 : Rat) / 34046602417284474948) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((1273289402823637717355 : Rat) / 17023301208642237474) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1273289402823637717355 : Rat) / 34046602417284474948) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0081_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0081
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0082 : Poly :=
[
  term ((2 : Rat) / 3) [(10, 1), (16, 1)]
]

/-- Partial product 82 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0082 : Poly :=
[
  term ((4 : Rat) / 3) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 2), (10, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(3, 2), (10, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0082_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0082
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0083 : Poly :=
[
  term ((-9631978763963075063305 : Rat) / 55576071592920245871) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 83 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0083 : Poly :=
[
  term ((-19263957527926150126610 : Rat) / 55576071592920245871) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9631978763963075063305 : Rat) / 55576071592920245871) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-19263957527926150126610 : Rat) / 55576071592920245871) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9631978763963075063305 : Rat) / 55576071592920245871) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((19263957527926150126610 : Rat) / 55576071592920245871) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9631978763963075063305 : Rat) / 55576071592920245871) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0083_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0083
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0084 : Poly :=
[
  term ((-124517044724194869667007 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0084 : Poly :=
[
  term ((-124517044724194869667007 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((124517044724194869667007 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124517044724194869667007 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((124517044724194869667007 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((124517044724194869667007 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124517044724194869667007 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0084_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0084
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0085 : Poly :=
[
  term ((5044940412568175239870 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 85 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0085 : Poly :=
[
  term ((10089880825136350479740 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5044940412568175239870 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10089880825136350479740 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5044940412568175239870 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5044940412568175239870 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10089880825136350479740 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0085_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0085
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0086 : Poly :=
[
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 86 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0086 : Poly :=
[
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0086_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0086
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0087 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 14996717731422923489) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 87 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0087 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 14996717731422923489) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 14996717731422923489) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 14996717731422923489) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 14996717731422923489) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0087_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0087
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0088 : Poly :=
[
  term ((489500217070088477287715 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 88 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0088 : Poly :=
[
  term ((489500217070088477287715 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-489500217070088477287715 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((489500217070088477287715 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-489500217070088477287715 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-489500217070088477287715 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((489500217070088477287715 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0088_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0088
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0089 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0089 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0089_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0089
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0090 : Poly :=
[
  term ((165226827959601285315845 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0090 : Poly :=
[
  term ((165226827959601285315845 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-165226827959601285315845 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((165226827959601285315845 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-165226827959601285315845 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((165226827959601285315845 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-165226827959601285315845 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0090_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0090
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0091 : Poly :=
[
  term ((-7418197908393716818100 : Rat) / 314931072359881393269) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0091 : Poly :=
[
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((7418197908393716818100 : Rat) / 314931072359881393269) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((7418197908393716818100 : Rat) / 314931072359881393269) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7418197908393716818100 : Rat) / 314931072359881393269) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((14836395816787433636200 : Rat) / 314931072359881393269) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0091_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0091
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0092 : Poly :=
[
  term ((221382859665286647149455 : Rat) / 2159527353324900982416) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0092 : Poly :=
[
  term ((221382859665286647149455 : Rat) / 1079763676662450491208) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-221382859665286647149455 : Rat) / 2159527353324900982416) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((221382859665286647149455 : Rat) / 1079763676662450491208) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-221382859665286647149455 : Rat) / 2159527353324900982416) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-221382859665286647149455 : Rat) / 1079763676662450491208) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((221382859665286647149455 : Rat) / 2159527353324900982416) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0092_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0092
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0093 : Poly :=
[
  term ((-7418197908393716818100 : Rat) / 314931072359881393269) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 93 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0093 : Poly :=
[
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((7418197908393716818100 : Rat) / 314931072359881393269) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((7418197908393716818100 : Rat) / 314931072359881393269) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((14836395816787433636200 : Rat) / 314931072359881393269) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7418197908393716818100 : Rat) / 314931072359881393269) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0093_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0093
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0094 : Poly :=
[
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 94 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0094 : Poly :=
[
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0094_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0094
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0095 : Poly :=
[
  term ((-392827095710670979949075 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 95 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0095 : Poly :=
[
  term ((-392827095710670979949075 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((392827095710670979949075 : Rat) / 3779172868318576719228) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((-392827095710670979949075 : Rat) / 1889586434159288359614) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((392827095710670979949075 : Rat) / 3779172868318576719228) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((-392827095710670979949075 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (16, 1)],
  term ((392827095710670979949075 : Rat) / 1889586434159288359614) [(11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0095_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0095
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0096 : Poly :=
[
  term ((45955907499795475967600 : Rat) / 314931072359881393269) [(11, 2), (16, 1)]
]

/-- Partial product 96 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0096 : Poly :=
[
  term ((91911814999590951935200 : Rat) / 314931072359881393269) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-45955907499795475967600 : Rat) / 314931072359881393269) [(2, 2), (11, 2), (16, 1)],
  term ((91911814999590951935200 : Rat) / 314931072359881393269) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-45955907499795475967600 : Rat) / 314931072359881393269) [(3, 2), (11, 2), (16, 1)],
  term ((-91911814999590951935200 : Rat) / 314931072359881393269) [(11, 2), (14, 1), (16, 1)],
  term ((45955907499795475967600 : Rat) / 314931072359881393269) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0096_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0096
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0097 : Poly :=
[
  term ((1926395752792615012661 : Rat) / 18525357197640081957) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0097 : Poly :=
[
  term ((3852791505585230025322 : Rat) / 18525357197640081957) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1926395752792615012661 : Rat) / 18525357197640081957) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3852791505585230025322 : Rat) / 18525357197640081957) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1926395752792615012661 : Rat) / 18525357197640081957) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3852791505585230025322 : Rat) / 18525357197640081957) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1926395752792615012661 : Rat) / 18525357197640081957) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0097_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0097
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0098 : Poly :=
[
  term ((8988544945613668549841 : Rat) / 314931072359881393269) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 98 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0098 : Poly :=
[
  term ((17977089891227337099682 : Rat) / 314931072359881393269) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8988544945613668549841 : Rat) / 314931072359881393269) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((17977089891227337099682 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-8988544945613668549841 : Rat) / 314931072359881393269) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-17977089891227337099682 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8988544945613668549841 : Rat) / 314931072359881393269) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0098_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0098
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0099 : Poly :=
[
  term ((2 : Rat) / 3) [(12, 1), (16, 1)]
]

/-- Partial product 99 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0099 : Poly :=
[
  term ((4 : Rat) / 3) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 2), (12, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(3, 2), (12, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(12, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0099_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0099
        rs_R007_ueqv_R007NY_generator_28_0000_0099 =
      rs_R007_ueqv_R007NY_partial_28_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_28_0000_0099 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_28_0000,
  rs_R007_ueqv_R007NY_partial_28_0001,
  rs_R007_ueqv_R007NY_partial_28_0002,
  rs_R007_ueqv_R007NY_partial_28_0003,
  rs_R007_ueqv_R007NY_partial_28_0004,
  rs_R007_ueqv_R007NY_partial_28_0005,
  rs_R007_ueqv_R007NY_partial_28_0006,
  rs_R007_ueqv_R007NY_partial_28_0007,
  rs_R007_ueqv_R007NY_partial_28_0008,
  rs_R007_ueqv_R007NY_partial_28_0009,
  rs_R007_ueqv_R007NY_partial_28_0010,
  rs_R007_ueqv_R007NY_partial_28_0011,
  rs_R007_ueqv_R007NY_partial_28_0012,
  rs_R007_ueqv_R007NY_partial_28_0013,
  rs_R007_ueqv_R007NY_partial_28_0014,
  rs_R007_ueqv_R007NY_partial_28_0015,
  rs_R007_ueqv_R007NY_partial_28_0016,
  rs_R007_ueqv_R007NY_partial_28_0017,
  rs_R007_ueqv_R007NY_partial_28_0018,
  rs_R007_ueqv_R007NY_partial_28_0019,
  rs_R007_ueqv_R007NY_partial_28_0020,
  rs_R007_ueqv_R007NY_partial_28_0021,
  rs_R007_ueqv_R007NY_partial_28_0022,
  rs_R007_ueqv_R007NY_partial_28_0023,
  rs_R007_ueqv_R007NY_partial_28_0024,
  rs_R007_ueqv_R007NY_partial_28_0025,
  rs_R007_ueqv_R007NY_partial_28_0026,
  rs_R007_ueqv_R007NY_partial_28_0027,
  rs_R007_ueqv_R007NY_partial_28_0028,
  rs_R007_ueqv_R007NY_partial_28_0029,
  rs_R007_ueqv_R007NY_partial_28_0030,
  rs_R007_ueqv_R007NY_partial_28_0031,
  rs_R007_ueqv_R007NY_partial_28_0032,
  rs_R007_ueqv_R007NY_partial_28_0033,
  rs_R007_ueqv_R007NY_partial_28_0034,
  rs_R007_ueqv_R007NY_partial_28_0035,
  rs_R007_ueqv_R007NY_partial_28_0036,
  rs_R007_ueqv_R007NY_partial_28_0037,
  rs_R007_ueqv_R007NY_partial_28_0038,
  rs_R007_ueqv_R007NY_partial_28_0039,
  rs_R007_ueqv_R007NY_partial_28_0040,
  rs_R007_ueqv_R007NY_partial_28_0041,
  rs_R007_ueqv_R007NY_partial_28_0042,
  rs_R007_ueqv_R007NY_partial_28_0043,
  rs_R007_ueqv_R007NY_partial_28_0044,
  rs_R007_ueqv_R007NY_partial_28_0045,
  rs_R007_ueqv_R007NY_partial_28_0046,
  rs_R007_ueqv_R007NY_partial_28_0047,
  rs_R007_ueqv_R007NY_partial_28_0048,
  rs_R007_ueqv_R007NY_partial_28_0049,
  rs_R007_ueqv_R007NY_partial_28_0050,
  rs_R007_ueqv_R007NY_partial_28_0051,
  rs_R007_ueqv_R007NY_partial_28_0052,
  rs_R007_ueqv_R007NY_partial_28_0053,
  rs_R007_ueqv_R007NY_partial_28_0054,
  rs_R007_ueqv_R007NY_partial_28_0055,
  rs_R007_ueqv_R007NY_partial_28_0056,
  rs_R007_ueqv_R007NY_partial_28_0057,
  rs_R007_ueqv_R007NY_partial_28_0058,
  rs_R007_ueqv_R007NY_partial_28_0059,
  rs_R007_ueqv_R007NY_partial_28_0060,
  rs_R007_ueqv_R007NY_partial_28_0061,
  rs_R007_ueqv_R007NY_partial_28_0062,
  rs_R007_ueqv_R007NY_partial_28_0063,
  rs_R007_ueqv_R007NY_partial_28_0064,
  rs_R007_ueqv_R007NY_partial_28_0065,
  rs_R007_ueqv_R007NY_partial_28_0066,
  rs_R007_ueqv_R007NY_partial_28_0067,
  rs_R007_ueqv_R007NY_partial_28_0068,
  rs_R007_ueqv_R007NY_partial_28_0069,
  rs_R007_ueqv_R007NY_partial_28_0070,
  rs_R007_ueqv_R007NY_partial_28_0071,
  rs_R007_ueqv_R007NY_partial_28_0072,
  rs_R007_ueqv_R007NY_partial_28_0073,
  rs_R007_ueqv_R007NY_partial_28_0074,
  rs_R007_ueqv_R007NY_partial_28_0075,
  rs_R007_ueqv_R007NY_partial_28_0076,
  rs_R007_ueqv_R007NY_partial_28_0077,
  rs_R007_ueqv_R007NY_partial_28_0078,
  rs_R007_ueqv_R007NY_partial_28_0079,
  rs_R007_ueqv_R007NY_partial_28_0080,
  rs_R007_ueqv_R007NY_partial_28_0081,
  rs_R007_ueqv_R007NY_partial_28_0082,
  rs_R007_ueqv_R007NY_partial_28_0083,
  rs_R007_ueqv_R007NY_partial_28_0084,
  rs_R007_ueqv_R007NY_partial_28_0085,
  rs_R007_ueqv_R007NY_partial_28_0086,
  rs_R007_ueqv_R007NY_partial_28_0087,
  rs_R007_ueqv_R007NY_partial_28_0088,
  rs_R007_ueqv_R007NY_partial_28_0089,
  rs_R007_ueqv_R007NY_partial_28_0090,
  rs_R007_ueqv_R007NY_partial_28_0091,
  rs_R007_ueqv_R007NY_partial_28_0092,
  rs_R007_ueqv_R007NY_partial_28_0093,
  rs_R007_ueqv_R007NY_partial_28_0094,
  rs_R007_ueqv_R007NY_partial_28_0095,
  rs_R007_ueqv_R007NY_partial_28_0096,
  rs_R007_ueqv_R007NY_partial_28_0097,
  rs_R007_ueqv_R007NY_partial_28_0098,
  rs_R007_ueqv_R007NY_partial_28_0099
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_28_0000_0099 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 7558345736637153438456) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 2519448578879051146152) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 7558345736637153438456) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 2519448578879051146152) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (12, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 2519448578879051146152) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 839816192959683715384) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 5038897157758102292304) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1679632385919367430768) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 2519448578879051146152) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 839816192959683715384) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 5038897157758102292304) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1679632385919367430768) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-2060672231199384896730475 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 5038897157758102292304) [(1, 1), (11, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 2519448578879051146152) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1679632385919367430768) [(1, 1), (15, 1), (16, 1)],
  term ((6257465185561923095680 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3754479111337153857408 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2550757605349594937120 : Rat) / 134970459582806311401) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((510151521069918987424 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-530235226376994072010315 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((106047045275398814402063 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((35863956241780731362670 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((89861352511333669672820 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-891367733023007537733565 : Rat) / 1889586434159288359614) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((30126401832728520492895 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((310454755541631184995655 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-21518373745068438817602 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17972270502266733934564 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((178273546604601507546713 : Rat) / 629862144719762786538) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18075841099637112295737 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62090951108326236999131 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((1275378802674797468560 : Rat) / 134970459582806311401) [(2, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-255075760534959493712 : Rat) / 44990153194268770467) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((530235226376994072010315 : Rat) / 1889586434159288359614) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-106047045275398814402063 : Rat) / 629862144719762786538) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44930676255666834836410 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(2, 1), (3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-310454755541631184995655 : Rat) / 1889586434159288359614) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8986135251133366967282 : Rat) / 104977024119960464423) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((62090951108326236999131 : Rat) / 629862144719762786538) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((8303041681286811044130 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4981825008772086626478 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9333570197103328896280 : Rat) / 134970459582806311401) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1866714039420665779256 : Rat) / 44990153194268770467) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((201568986197755822015070 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-40313797239551164403014 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61546464674841376364615 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-66979652874621181956313 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-449523384347783454430510 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12309292934968275272923 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31376865948835574568483 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((4256087275487586179710 : Rat) / 9354388287917269107) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-851217455097517235942 : Rat) / 3118129429305756369) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((33472766443737263222305 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-173703167491221162151880 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((225335060813510054991155 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1275378802674797468560 : Rat) / 134970459582806311401) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-20083659866242357933383 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((34740633498244232430376 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45067012162702010998231 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((255075760534959493712 : Rat) / 44990153194268770467) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((11552511886354317511240 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6931507131812590506744 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10174790039254025616665 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((262455379110901132817915 : Rat) / 539881838331225245604) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-329774532132269920520035 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-530235226376994072010315 : Rat) / 1889586434159288359614) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((2034958007850805123333 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17337060284924897670645 : Rat) / 59986870925691693956) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((65954906426453984104007 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((106047045275398814402063 : Rat) / 629862144719762786538) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-456677803004277301999180 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3949278293081743139824 : Rat) / 14996717731422923489) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19746391465408715699120 : Rat) / 44990153194268770467) [(2, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((91335560600855460399836 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-153864430640745542719990 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2784411807087259220945 : Rat) / 8511650604321118737) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((30772886128149108543998 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-556882361417451844189 : Rat) / 2837216868107039579) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((21198539313498540667445 : Rat) / 104977024119960464423) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6366447014118188586775 : Rat) / 51069903625926712422) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 104977024119960464423) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1273289402823637717355 : Rat) / 17023301208642237474) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-19263957527926150126610 : Rat) / 55576071592920245871) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-124517044724194869667007 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((22093142363370773948755 : Rat) / 209954048239920928846) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-238416298443114155808260 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((44930676255666834836410 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1091226582864340952157455 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((243861106053750286435045 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((310454755541631184995655 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((91911814999590951935200 : Rat) / 314931072359881393269) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-392827095710670979949075 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((3852791505585230025322 : Rat) / 18525357197640081957) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17977089891227337099682 : Rat) / 314931072359881393269) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((29066193579975151174892 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8986135251133366967282 : Rat) / 104977024119960464423) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1294562059079091903041 : Rat) / 6175119065880027319) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-62090951108326236999131 : Rat) / 629862144719762786538) [(2, 1), (15, 2), (16, 1)],
  term ((-3128732592780961547840 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((1877239555668576928704 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17931978120890365681335 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30126401832728520492895 : Rat) / 209954048239920928846) [(2, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((891367733023007537733565 : Rat) / 3779172868318576719228) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((10759186872534219408801 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((18075841099637112295737 : Rat) / 209954048239920928846) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178273546604601507546713 : Rat) / 1259724289439525573076) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((-4151520840643405522065 : Rat) / 104977024119960464423) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((2490912504386043313239 : Rat) / 104977024119960464423) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((4666785098551664448140 : Rat) / 134970459582806311401) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-933357019710332889628 : Rat) / 44990153194268770467) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((20156898619775582201507 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((61546464674841376364615 : Rat) / 629862144719762786538) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((66979652874621181956313 : Rat) / 629862144719762786538) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((224761692173891727215255 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12309292934968275272923 : Rat) / 209954048239920928846) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31376865948835574568483 : Rat) / 209954048239920928846) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-2128043637743793089855 : Rat) / 9354388287917269107) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((425608727548758617971 : Rat) / 3118129429305756369) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-33472766443737263222305 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-87015222429468128036945 : Rat) / 629862144719762786538) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((269482402855555325507740 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((20083659866242357933383 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((17403044485893625607389 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53896480571111065101548 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((10174790039254025616665 : Rat) / 1889586434159288359614) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-558872468411954665080355 : Rat) / 1079763676662450491208) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((283753251731668358315855 : Rat) / 7558345736637153438456) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-2034958007850805123333 : Rat) / 629862144719762786538) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((111774493682390933016071 : Rat) / 359921225554150163736) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60109915118172406524707 : Rat) / 2519448578879051146152) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 3) [(2, 2), (7, 2), (16, 1)],
  term ((228338901502138650999590 : Rat) / 944793217079644179807) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1974639146540871569912 : Rat) / 14996717731422923489) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9873195732704357849560 : Rat) / 44990153194268770467) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((-45667780300427730199918 : Rat) / 314931072359881393269) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((76932215320372771359995 : Rat) / 944793217079644179807) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9139465025292072048215 : Rat) / 314931072359881393269) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-15386443064074554271999 : Rat) / 314931072359881393269) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1827893005058414409643 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6366447014118188586775 : Rat) / 102139807251853424844) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1273289402823637717355 : Rat) / 34046602417284474948) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 2), (10, 1), (16, 1)],
  term ((9631978763963075063305 : Rat) / 55576071592920245871) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((124517044724194869667007 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((264539117121432833778590 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8875220688151803796000 : Rat) / 44990153194268770467) [(2, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 14996717731422923489) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-489500217070088477287715 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1076592194206923454666775 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1003679136581961770900 : Rat) / 55576071592920245871) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-221382859665286647149455 : Rat) / 2159527353324900982416) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((7418197908393716818100 : Rat) / 314931072359881393269) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((392827095710670979949075 : Rat) / 3779172868318576719228) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((-45955907499795475967600 : Rat) / 314931072359881393269) [(2, 2), (11, 2), (16, 1)],
  term ((-1926395752792615012661 : Rat) / 18525357197640081957) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8988544945613668549841 : Rat) / 314931072359881393269) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 2), (12, 1), (16, 1)],
  term ((-17972270502266733934564 : Rat) / 104977024119960464423) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62090951108326236999131 : Rat) / 314931072359881393269) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((1275378802674797468560 : Rat) / 134970459582806311401) [(2, 3), (5, 1), (11, 1), (16, 1)],
  term ((-255075760534959493712 : Rat) / 44990153194268770467) [(2, 3), (5, 1), (15, 1), (16, 1)],
  term ((530235226376994072010315 : Rat) / 1889586434159288359614) [(2, 3), (7, 1), (11, 1), (16, 1)],
  term ((-106047045275398814402063 : Rat) / 629862144719762786538) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(2, 3), (9, 1), (11, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44930676255666834836410 : Rat) / 314931072359881393269) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(2, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-310454755541631184995655 : Rat) / 1889586434159288359614) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8986135251133366967282 : Rat) / 104977024119960464423) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(2, 3), (14, 1), (15, 2), (16, 1)],
  term ((62090951108326236999131 : Rat) / 629862144719762786538) [(2, 3), (15, 2), (16, 1)],
  term ((8303041681286811044130 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4981825008772086626478 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-9333570197103328896280 : Rat) / 134970459582806311401) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1866714039420665779256 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((201568986197755822015070 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-40313797239551164403014 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-61546464674841376364615 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6257465185561923095680 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-66979652874621181956313 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((3128732592780961547840 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-449523384347783454430510 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((12309292934968275272923 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((3754479111337153857408 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1877239555668576928704 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((31376865948835574568483 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((4256087275487586179710 : Rat) / 9354388287917269107) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-851217455097517235942 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((33472766443737263222305 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((225335060813510054991155 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-538964805711110651015480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20083659866242357933383 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-45067012162702010998231 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((107792961142222130203096 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((11552511886354317511240 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6931507131812590506744 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10174790039254025616665 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-329774532132269920520035 : Rat) / 3779172868318576719228) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-283753251731668358315855 : Rat) / 3779172868318576719228) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((2034958007850805123333 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((65954906426453984104007 : Rat) / 1259724289439525573076) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((60109915118172406524707 : Rat) / 1259724289439525573076) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-2 : Rat) / 3) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-456677803004277301999180 : Rat) / 944793217079644179807) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3949278293081743139824 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((19746391465408715699120 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((91335560600855460399836 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-153864430640745542719990 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18278930050584144096430 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((30772886128149108543998 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3655786010116828819286 : Rat) / 104977024119960464423) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((21198539313498540667445 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6366447014118188586775 : Rat) / 51069903625926712422) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1273289402823637717355 : Rat) / 17023301208642237474) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-19263957527926150126610 : Rat) / 55576071592920245871) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35863956241780731362670 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-124517044724194869667007 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((17931978120890365681335 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((86198686697795618922580 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((240994037801837970999715 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((28864183288484094732215 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((581252674758782111084810 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-30126401832728520492895 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((1706948573845304532284585 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-891367733023007537733565 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-392827095710670979949075 : Rat) / 1889586434159288359614) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((91911814999590951935200 : Rat) / 314931072359881393269) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((3852791505585230025322 : Rat) / 18525357197640081957) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((21518373745068438817602 : Rat) / 104977024119960464423) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31857652521122816368711 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((17977089891227337099682 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-116250534951756422216962 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((18075841099637112295737 : Rat) / 104977024119960464423) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((178273546604601507546713 : Rat) / 1259724289439525573076) [(3, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (15, 3), (16, 1)],
  term ((-4151520840643405522065 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((2490912504386043313239 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((4666785098551664448140 : Rat) / 134970459582806311401) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-933357019710332889628 : Rat) / 44990153194268770467) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((20156898619775582201507 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((61546464674841376364615 : Rat) / 629862144719762786538) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((104524443987992720530393 : Rat) / 629862144719762786538) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((224761692173891727215255 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12309292934968275272923 : Rat) / 209954048239920928846) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38885824171509882283299 : Rat) / 209954048239920928846) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-2128043637743793089855 : Rat) / 9354388287917269107) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((425608727548758617971 : Rat) / 3118129429305756369) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-33472766443737263222305 : Rat) / 209954048239920928846) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-225335060813510054991155 : Rat) / 1889586434159288359614) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((269482402855555325507740 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((20083659866242357933383 : Rat) / 209954048239920928846) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((45067012162702010998231 : Rat) / 629862144719762786538) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53896480571111065101548 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((10174790039254025616665 : Rat) / 1889586434159288359614) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((329774532132269920520035 : Rat) / 7558345736637153438456) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((283753251731668358315855 : Rat) / 7558345736637153438456) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-2034958007850805123333 : Rat) / 629862144719762786538) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65954906426453984104007 : Rat) / 2519448578879051146152) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60109915118172406524707 : Rat) / 2519448578879051146152) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 3) [(3, 2), (7, 2), (16, 1)],
  term ((228338901502138650999590 : Rat) / 944793217079644179807) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((54256529663390346079849 : Rat) / 104977024119960464423) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9873195732704357849560 : Rat) / 44990153194268770467) [(3, 2), (8, 1), (11, 2), (16, 1)],
  term ((-45667780300427730199918 : Rat) / 314931072359881393269) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((76932215320372771359995 : Rat) / 944793217079644179807) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((9139465025292072048215 : Rat) / 314931072359881393269) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-15386443064074554271999 : Rat) / 314931072359881393269) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1827893005058414409643 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6366447014118188586775 : Rat) / 102139807251853424844) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1273289402823637717355 : Rat) / 34046602417284474948) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(3, 2), (10, 1), (16, 1)],
  term ((9631978763963075063305 : Rat) / 55576071592920245871) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((110009751010892576313581 : Rat) / 269940919165612622802) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5044940412568175239870 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-51476279991280462016800 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-489500217070088477287715 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((131331948288375064632625 : Rat) / 539881838331225245604) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7418197908393716818100 : Rat) / 314931072359881393269) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2893540627280355610638235 : Rat) / 5038897157758102292304) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((61571732772255651013900 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((392827095710670979949075 : Rat) / 3779172868318576719228) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((-45955907499795475967600 : Rat) / 314931072359881393269) [(3, 2), (11, 2), (16, 1)],
  term ((-1926395752792615012661 : Rat) / 18525357197640081957) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73543666180818985002647 : Rat) / 314931072359881393269) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(3, 2), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-18075841099637112295737 : Rat) / 104977024119960464423) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((178273546604601507546713 : Rat) / 629862144719762786538) [(3, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 4), (16, 1)],
  term ((-3128732592780961547840 : Rat) / 104977024119960464423) [(3, 3), (4, 1), (11, 1), (16, 1)],
  term ((1877239555668576928704 : Rat) / 104977024119960464423) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(3, 3), (8, 1), (11, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((-17931978120890365681335 : Rat) / 104977024119960464423) [(3, 3), (11, 1), (12, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30126401832728520492895 : Rat) / 209954048239920928846) [(3, 3), (11, 1), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 3), (11, 1), (15, 2), (16, 1)],
  term ((891367733023007537733565 : Rat) / 3779172868318576719228) [(3, 3), (11, 1), (16, 1)],
  term ((10759186872534219408801 : Rat) / 104977024119960464423) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((18075841099637112295737 : Rat) / 209954048239920928846) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((-178273546604601507546713 : Rat) / 1259724289439525573076) [(3, 3), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 3), (15, 3), (16, 1)],
  term ((-8303041681286811044130 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((4151520840643405522065 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((4981825008772086626478 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2490912504386043313239 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((9333570197103328896280 : Rat) / 134970459582806311401) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4666785098551664448140 : Rat) / 134970459582806311401) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1866714039420665779256 : Rat) / 44990153194268770467) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((933357019710332889628 : Rat) / 44990153194268770467) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-201568986197755822015070 : Rat) / 944793217079644179807) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((100784493098877911007535 : Rat) / 944793217079644179807) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((40313797239551164403014 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20156898619775582201507 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((61546464674841376364615 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61546464674841376364615 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((66979652874621181956313 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66979652874621181956313 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((449523384347783454430510 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-224761692173891727215255 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12309292934968275272923 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12309292934968275272923 : Rat) / 209954048239920928846) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31376865948835574568483 : Rat) / 104977024119960464423) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((31376865948835574568483 : Rat) / 209954048239920928846) [(4, 1), (15, 2), (16, 1)],
  term ((-4256087275487586179710 : Rat) / 9354388287917269107) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2128043637743793089855 : Rat) / 9354388287917269107) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((851217455097517235942 : Rat) / 3118129429305756369) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425608727548758617971 : Rat) / 3118129429305756369) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-33472766443737263222305 : Rat) / 104977024119960464423) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((33472766443737263222305 : Rat) / 209954048239920928846) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((20686740829138592968605 : Rat) / 29993435462845846978) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-225335060813510054991155 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-269482402855555325507740 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (16, 1)],
  term ((20083659866242357933383 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20083659866242357933383 : Rat) / 209954048239920928846) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12412044497483155781163 : Rat) / 29993435462845846978) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((45067012162702010998231 : Rat) / 314931072359881393269) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((53896480571111065101548 : Rat) / 314931072359881393269) [(5, 1), (15, 1), (16, 1)],
  term ((-11552511886354317511240 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((6931507131812590506744 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((10174790039254025616665 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10174790039254025616665 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11320570063384133148175 : Rat) / 359921225554150163736) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((329774532132269920520035 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-283753251731668358315855 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (16, 1)],
  term ((-2034958007850805123333 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2034958007850805123333 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7752131972841546992201 : Rat) / 359921225554150163736) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65954906426453984104007 : Rat) / 1259724289439525573076) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((60109915118172406524707 : Rat) / 2519448578879051146152) [(7, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 1), (15, 3), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(7, 2), (16, 1)],
  term ((456677803004277301999180 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228338901502138650999590 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((3949278293081743139824 : Rat) / 14996717731422923489) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1974639146540871569912 : Rat) / 14996717731422923489) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19746391465408715699120 : Rat) / 44990153194268770467) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((9873195732704357849560 : Rat) / 44990153194268770467) [(8, 1), (11, 2), (16, 1)],
  term ((-91335560600855460399836 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45667780300427730199918 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((153864430640745542719990 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-76932215320372771359995 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((18278930050584144096430 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9139465025292072048215 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (16, 1)],
  term ((-30772886128149108543998 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15386443064074554271999 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3655786010116828819286 : Rat) / 104977024119960464423) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1827893005058414409643 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 104977024119960464423) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21198539313498540667445 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6366447014118188586775 : Rat) / 51069903625926712422) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6366447014118188586775 : Rat) / 102139807251853424844) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((12719123588099124400467 : Rat) / 104977024119960464423) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 209954048239920928846) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1273289402823637717355 : Rat) / 17023301208642237474) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(10, 1), (14, 1), (16, 1)],
  term ((-1273289402823637717355 : Rat) / 34046602417284474948) [(10, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (16, 1)],
  term ((19263957527926150126610 : Rat) / 55576071592920245871) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9631978763963075063305 : Rat) / 55576071592920245871) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((124517044724194869667007 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124517044724194869667007 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 14996717731422923489) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-205667239916324378725 : Rat) / 810633390887725594) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((52036663991926276092260 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((1775044137630360759200 : Rat) / 14996717731422923489) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((489500217070088477287715 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-406408787245934653138165 : Rat) / 2519448578879051146152) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14836395816787433636200 : Rat) / 314931072359881393269) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-209736015409963586224445 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((14836395816787433636200 : Rat) / 314931072359881393269) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((221382859665286647149455 : Rat) / 2159527353324900982416) [(11, 1), (15, 1), (16, 1)],
  term ((-7418197908393716818100 : Rat) / 314931072359881393269) [(11, 1), (15, 3), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (16, 1)],
  term ((-213681267957966057595925 : Rat) / 539881838331225245604) [(11, 2), (14, 1), (16, 1)],
  term ((392827095710670979949075 : Rat) / 1889586434159288359614) [(11, 2), (14, 2), (16, 1)],
  term ((45955907499795475967600 : Rat) / 314931072359881393269) [(11, 2), (16, 1)],
  term ((-3852791505585230025322 : Rat) / 18525357197640081957) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1926395752792615012661 : Rat) / 18525357197640081957) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17977089891227337099682 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(12, 1), (14, 1), (16, 1)],
  term ((8988544945613668549841 : Rat) / 314931072359881393269) [(12, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 99. -/
theorem rs_R007_ueqv_R007NY_block_28_0000_0099_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_28_0000_0099
      rs_R007_ueqv_R007NY_block_28_0000_0099 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
