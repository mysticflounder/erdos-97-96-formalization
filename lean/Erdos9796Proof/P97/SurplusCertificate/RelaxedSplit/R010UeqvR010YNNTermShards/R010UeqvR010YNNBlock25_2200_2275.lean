/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:2200-2275

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_2200_2275 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 2200 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2200 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 2200 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2200 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2200 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2200_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2200
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2200 := by
  native_decide

/-- Coefficient term 2201 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2201 : Poly :=
[
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 2201 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2201 : Poly :=
[
  term ((1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2201 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2201_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2201
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2201 := by
  native_decide

/-- Coefficient term 2202 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2202 : Poly :=
[
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2202 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2202 : Poly :=
[
  term ((36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2202 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2202_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2202
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2202 := by
  native_decide

/-- Coefficient term 2203 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2203 : Poly :=
[
  term ((36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2203 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2203 : Poly :=
[
  term ((72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2203 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2203_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2203
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2203 := by
  native_decide

/-- Coefficient term 2204 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2204 : Poly :=
[
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2204 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2204 : Poly :=
[
  term ((36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2204 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2204_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2204
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2204 := by
  native_decide

/-- Coefficient term 2205 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2205 : Poly :=
[
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2205 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2205 : Poly :=
[
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2205 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2205_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2205
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2205 := by
  native_decide

/-- Coefficient term 2206 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2206 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2206 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2206 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2206 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2206_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2206
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2206 := by
  native_decide

/-- Coefficient term 2207 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2207 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2207 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2207 : Poly :=
[
  term ((453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2207 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2207_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2207
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2207 := by
  native_decide

/-- Coefficient term 2208 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2208 : Poly :=
[
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2208 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2208 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2208 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2208_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2208
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2208 := by
  native_decide

/-- Coefficient term 2209 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2209 : Poly :=
[
  term ((-899030953188873472 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 2209 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2209 : Poly :=
[
  term ((-1798061906377746944 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((899030953188873472 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2209 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2209_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2209
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2209 := by
  native_decide

/-- Coefficient term 2210 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2210 : Poly :=
[
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 2210 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2210 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2210 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2210_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2210
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2210 := by
  native_decide

/-- Coefficient term 2211 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2211 : Poly :=
[
  term ((-374064252674107072 : Rat) / 5988696105078439) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 2211 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2211 : Poly :=
[
  term ((-748128505348214144 : Rat) / 5988696105078439) [(5, 3), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((374064252674107072 : Rat) / 5988696105078439) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2211 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2211_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2211
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2211 := by
  native_decide

/-- Coefficient term 2212 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2212 : Poly :=
[
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2212 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2212 : Poly :=
[
  term ((11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2212 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2212_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2212
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2212 := by
  native_decide

/-- Coefficient term 2213 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2213 : Poly :=
[
  term ((11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2213 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2213 : Poly :=
[
  term ((23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2213 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2213_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2213
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2213 := by
  native_decide

/-- Coefficient term 2214 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2214 : Poly :=
[
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 2214 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2214 : Poly :=
[
  term ((11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2214 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2214_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2214
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2214 := by
  native_decide

/-- Coefficient term 2215 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2215 : Poly :=
[
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 2215 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2215 : Poly :=
[
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2215 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2215_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2215
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2215 := by
  native_decide

/-- Coefficient term 2216 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2216 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2216 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2216 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2216 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2216_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2216
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2216 := by
  native_decide

/-- Coefficient term 2217 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2217 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2217 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2217 : Poly :=
[
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2217 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2217_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2217
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2217 := by
  native_decide

/-- Coefficient term 2218 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2218 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 2218 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2218 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2218 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2218_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2218
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2218 := by
  native_decide

/-- Coefficient term 2219 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2219 : Poly :=
[
  term ((2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 2219 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2219 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2219 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2219_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2219
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2219 := by
  native_decide

/-- Coefficient term 2220 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2220 : Poly :=
[
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 2220 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2220 : Poly :=
[
  term ((8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2220 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2220_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2220
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2220 := by
  native_decide

/-- Coefficient term 2221 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2221 : Poly :=
[
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 2221 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2221 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2221 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2221_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2221
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2221 := by
  native_decide

/-- Coefficient term 2222 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2222 : Poly :=
[
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 2222 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2222 : Poly :=
[
  term ((824473105066198016 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2222 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2222_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2222
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2222 := by
  native_decide

/-- Coefficient term 2223 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2223 : Poly :=
[
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2223 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2223 : Poly :=
[
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2223 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2223_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2223
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2223 := by
  native_decide

/-- Coefficient term 2224 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2224 : Poly :=
[
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2224 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2224 : Poly :=
[
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2224 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2224_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2224
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2224 := by
  native_decide

/-- Coefficient term 2225 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2225 : Poly :=
[
  term ((-3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2225 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2225 : Poly :=
[
  term ((-6823378830145568768 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2225 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2225_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2225
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2225 := by
  native_decide

/-- Coefficient term 2226 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2226 : Poly :=
[
  term ((-6405593232047691712 : Rat) / 269491324728529755) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2226 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2226 : Poly :=
[
  term ((-12811186464095383424 : Rat) / 269491324728529755) [(5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6405593232047691712 : Rat) / 269491324728529755) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2226 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2226_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2226
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2226 := by
  native_decide

/-- Coefficient term 2227 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2227 : Poly :=
[
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 2227 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2227 : Poly :=
[
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2227 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2227_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2227
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2227 := by
  native_decide

/-- Coefficient term 2228 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2228 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2228 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2228 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2228 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2228_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2228
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2228 := by
  native_decide

/-- Coefficient term 2229 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2229 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2229 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2229 : Poly :=
[
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2229 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2229_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2229
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2229 := by
  native_decide

/-- Coefficient term 2230 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2230 : Poly :=
[
  term ((-212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2230 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2230 : Poly :=
[
  term ((-425807632509172689184 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2230 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2230_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2230
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2230 := by
  native_decide

/-- Coefficient term 2231 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2231 : Poly :=
[
  term ((245140584166027968 : Rat) / 5988696105078439) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 2231 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2231 : Poly :=
[
  term ((490281168332055936 : Rat) / 5988696105078439) [(5, 3), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-245140584166027968 : Rat) / 5988696105078439) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2231 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2231_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2231
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2231 := by
  native_decide

/-- Coefficient term 2232 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2232 : Poly :=
[
  term ((-1141118447250296768 : Rat) / 53898264945705951) [(5, 3), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 2232 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2232 : Poly :=
[
  term ((-2282236894500593536 : Rat) / 53898264945705951) [(5, 3), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((1141118447250296768 : Rat) / 53898264945705951) [(5, 3), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2232 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2232_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2232
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2232 := by
  native_decide

/-- Coefficient term 2233 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2233 : Poly :=
[
  term ((206920271389095766096 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 2233 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2233 : Poly :=
[
  term ((413840542778191532192 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-206920271389095766096 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2233 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2233_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2233
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2233 := by
  native_decide

/-- Coefficient term 2234 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2234 : Poly :=
[
  term ((30886042583523913444 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 2234 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2234 : Poly :=
[
  term ((61772085167047826888 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (16, 1)],
  term ((-30886042583523913444 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2234 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2234_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2234
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2234 := by
  native_decide

/-- Coefficient term 2235 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2235 : Poly :=
[
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2235 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2235 : Poly :=
[
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2235 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2235_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2235
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2235 := by
  native_decide

/-- Coefficient term 2236 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2236 : Poly :=
[
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2236 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2236 : Poly :=
[
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2236 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2236_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2236
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2236 := by
  native_decide

/-- Coefficient term 2237 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2237 : Poly :=
[
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 2237 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2237 : Poly :=
[
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2237 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2237_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2237
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2237 := by
  native_decide

/-- Coefficient term 2238 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2238 : Poly :=
[
  term ((21014714090742697600 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 2238 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2238 : Poly :=
[
  term ((42029428181485395200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21014714090742697600 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2238 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2238_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2238
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2238 := by
  native_decide

/-- Coefficient term 2239 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2239 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2239 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2239 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2239 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2239_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2239
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2239 := by
  native_decide

/-- Coefficient term 2240 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2240 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2240 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2240 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2240 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2240_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2240
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2240 := by
  native_decide

/-- Coefficient term 2241 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2241 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2241 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2241 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2241 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2241_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2241
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2241 := by
  native_decide

/-- Coefficient term 2242 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2242 : Poly :=
[
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2242 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2242 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2242 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2242_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2242
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2242 := by
  native_decide

/-- Coefficient term 2243 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2243 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 2243 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2243 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2243 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2243_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2243
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2243 := by
  native_decide

/-- Coefficient term 2244 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2244 : Poly :=
[
  term ((-5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 2244 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2244 : Poly :=
[
  term ((-11147594596347129856 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2244 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2244_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2244
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2244 := by
  native_decide

/-- Coefficient term 2245 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2245 : Poly :=
[
  term ((23645627752871438336 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2245 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2245 : Poly :=
[
  term ((-23645627752871438336 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((47291255505742876672 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2245 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2245_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2245
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2245 := by
  native_decide

/-- Coefficient term 2246 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2246 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2246 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2246 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2246 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2246_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2246
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2246 := by
  native_decide

/-- Coefficient term 2247 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2247 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2247 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2247 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2247 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2247_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2247
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2247 := by
  native_decide

/-- Coefficient term 2248 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2248 : Poly :=
[
  term ((-2365832583217013504 : Rat) / 5988696105078439) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2248 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2248 : Poly :=
[
  term ((-4731665166434027008 : Rat) / 5988696105078439) [(5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2365832583217013504 : Rat) / 5988696105078439) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2248 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2248_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2248
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2248 := by
  native_decide

/-- Coefficient term 2249 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2249 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2249 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2249 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2249 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2249_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2249
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2249 := by
  native_decide

/-- Coefficient term 2250 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2250 : Poly :=
[
  term ((-6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 2250 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2250 : Poly :=
[
  term ((-13126344574278977536 : Rat) / 29943480525392195) [(5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2250 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2250_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2250
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2250 := by
  native_decide

/-- Coefficient term 2251 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2251 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2251 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2251 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2251 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2251_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2251
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2251 := by
  native_decide

/-- Coefficient term 2252 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2252 : Poly :=
[
  term ((109089324513126108544 : Rat) / 269491324728529755) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 2252 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2252 : Poly :=
[
  term ((218178649026252217088 : Rat) / 269491324728529755) [(5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-109089324513126108544 : Rat) / 269491324728529755) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2252 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2252_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2252
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2252 := by
  native_decide

/-- Coefficient term 2253 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2253 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 2253 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2253 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2253 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2253_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2253
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2253 := by
  native_decide

/-- Coefficient term 2254 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2254 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2254 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2254 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2254 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2254_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2254
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2254 := by
  native_decide

/-- Coefficient term 2255 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2255 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2255 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2255 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2255 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2255_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2255
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2255 := by
  native_decide

/-- Coefficient term 2256 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2256 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2256 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2256 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2256 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2256_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2256
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2256 := by
  native_decide

/-- Coefficient term 2257 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2257 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 2257 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2257 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2257 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2257_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2257
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2257 := by
  native_decide

/-- Coefficient term 2258 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2258 : Poly :=
[
  term ((6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

/-- Partial product 2258 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2258 : Poly :=
[
  term ((12219177287232399872 : Rat) / 269491324728529755) [(5, 3), (9, 3), (12, 1), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2258 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2258_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2258
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2258 := by
  native_decide

/-- Coefficient term 2259 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2259 : Poly :=
[
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (16, 1)]
]

/-- Partial product 2259 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2259 : Poly :=
[
  term ((-29529423139308755544 : Rat) / 149717402626960975) [(5, 3), (11, 1), (12, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2259 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2259_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2259
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2259 := by
  native_decide

/-- Coefficient term 2260 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2260 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2260 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2260 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2260 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2260_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2260
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2260 := by
  native_decide

/-- Coefficient term 2261 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2261 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2261 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2261 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2261 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2261_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2261
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2261 := by
  native_decide

/-- Coefficient term 2262 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2262 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)]
]

/-- Partial product 2262 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2262 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (12, 1), (13, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2262 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2262_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2262
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2262 := by
  native_decide

/-- Coefficient term 2263 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2263 : Poly :=
[
  term ((-21875906245353883358 : Rat) / 149717402626960975) [(5, 3), (15, 1), (16, 1)]
]

/-- Partial product 2263 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2263 : Poly :=
[
  term ((-43751812490707766716 : Rat) / 149717402626960975) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((21875906245353883358 : Rat) / 149717402626960975) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2263 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2263_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2263
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2263 := by
  native_decide

/-- Coefficient term 2264 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2264 : Poly :=
[
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 2264 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2264 : Poly :=
[
  term ((3194260827736903936 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2264 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2264_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2264
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2264 := by
  native_decide

/-- Coefficient term 2265 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2265 : Poly :=
[
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2265 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2265 : Poly :=
[
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(5, 4), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2265 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2265_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2265
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2265 := by
  native_decide

/-- Coefficient term 2266 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2266 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2266 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2266 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2266 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2266_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2266
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2266 := by
  native_decide

/-- Coefficient term 2267 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2267 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2267 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2267 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2267 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2267_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2267
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2267 := by
  native_decide

/-- Coefficient term 2268 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2268 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2268 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2268 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2268 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2268_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2268
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2268 := by
  native_decide

/-- Coefficient term 2269 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2269 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 2269 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2269 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2269 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2269_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2269
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2269 := by
  native_decide

/-- Coefficient term 2270 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2270 : Poly :=
[
  term ((-298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (16, 1)]
]

/-- Partial product 2270 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2270 : Poly :=
[
  term ((-597468916947693824 : Rat) / 5988696105078439) [(5, 4), (9, 2), (12, 1), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2270 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2270_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2270
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2270 := by
  native_decide

/-- Coefficient term 2271 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2271 : Poly :=
[
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2271 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2271 : Poly :=
[
  term (-4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2271 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2271_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2271
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2271 := by
  native_decide

/-- Coefficient term 2272 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2272 : Poly :=
[
  term (-4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2272 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2272 : Poly :=
[
  term (-8 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2272 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2272_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2272
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2272 := by
  native_decide

/-- Coefficient term 2273 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2273 : Poly :=
[
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2273 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2273 : Poly :=
[
  term (-4 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2273 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2273_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2273
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2273 := by
  native_decide

/-- Coefficient term 2274 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2274 : Poly :=
[
  term (1 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 2274 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2274 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2274 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2274_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2274
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2274 := by
  native_decide

/-- Coefficient term 2275 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2275 : Poly :=
[
  term (2 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 2275 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2275 : Poly :=
[
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2275 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2275_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2275
        rs_R010_ueqv_R010YNN_generator_25_2200_2275 =
      rs_R010_ueqv_R010YNN_partial_25_2275 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_2200_2275 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_2200,
  rs_R010_ueqv_R010YNN_partial_25_2201,
  rs_R010_ueqv_R010YNN_partial_25_2202,
  rs_R010_ueqv_R010YNN_partial_25_2203,
  rs_R010_ueqv_R010YNN_partial_25_2204,
  rs_R010_ueqv_R010YNN_partial_25_2205,
  rs_R010_ueqv_R010YNN_partial_25_2206,
  rs_R010_ueqv_R010YNN_partial_25_2207,
  rs_R010_ueqv_R010YNN_partial_25_2208,
  rs_R010_ueqv_R010YNN_partial_25_2209,
  rs_R010_ueqv_R010YNN_partial_25_2210,
  rs_R010_ueqv_R010YNN_partial_25_2211,
  rs_R010_ueqv_R010YNN_partial_25_2212,
  rs_R010_ueqv_R010YNN_partial_25_2213,
  rs_R010_ueqv_R010YNN_partial_25_2214,
  rs_R010_ueqv_R010YNN_partial_25_2215,
  rs_R010_ueqv_R010YNN_partial_25_2216,
  rs_R010_ueqv_R010YNN_partial_25_2217,
  rs_R010_ueqv_R010YNN_partial_25_2218,
  rs_R010_ueqv_R010YNN_partial_25_2219,
  rs_R010_ueqv_R010YNN_partial_25_2220,
  rs_R010_ueqv_R010YNN_partial_25_2221,
  rs_R010_ueqv_R010YNN_partial_25_2222,
  rs_R010_ueqv_R010YNN_partial_25_2223,
  rs_R010_ueqv_R010YNN_partial_25_2224,
  rs_R010_ueqv_R010YNN_partial_25_2225,
  rs_R010_ueqv_R010YNN_partial_25_2226,
  rs_R010_ueqv_R010YNN_partial_25_2227,
  rs_R010_ueqv_R010YNN_partial_25_2228,
  rs_R010_ueqv_R010YNN_partial_25_2229,
  rs_R010_ueqv_R010YNN_partial_25_2230,
  rs_R010_ueqv_R010YNN_partial_25_2231,
  rs_R010_ueqv_R010YNN_partial_25_2232,
  rs_R010_ueqv_R010YNN_partial_25_2233,
  rs_R010_ueqv_R010YNN_partial_25_2234,
  rs_R010_ueqv_R010YNN_partial_25_2235,
  rs_R010_ueqv_R010YNN_partial_25_2236,
  rs_R010_ueqv_R010YNN_partial_25_2237,
  rs_R010_ueqv_R010YNN_partial_25_2238,
  rs_R010_ueqv_R010YNN_partial_25_2239,
  rs_R010_ueqv_R010YNN_partial_25_2240,
  rs_R010_ueqv_R010YNN_partial_25_2241,
  rs_R010_ueqv_R010YNN_partial_25_2242,
  rs_R010_ueqv_R010YNN_partial_25_2243,
  rs_R010_ueqv_R010YNN_partial_25_2244,
  rs_R010_ueqv_R010YNN_partial_25_2245,
  rs_R010_ueqv_R010YNN_partial_25_2246,
  rs_R010_ueqv_R010YNN_partial_25_2247,
  rs_R010_ueqv_R010YNN_partial_25_2248,
  rs_R010_ueqv_R010YNN_partial_25_2249,
  rs_R010_ueqv_R010YNN_partial_25_2250,
  rs_R010_ueqv_R010YNN_partial_25_2251,
  rs_R010_ueqv_R010YNN_partial_25_2252,
  rs_R010_ueqv_R010YNN_partial_25_2253,
  rs_R010_ueqv_R010YNN_partial_25_2254,
  rs_R010_ueqv_R010YNN_partial_25_2255,
  rs_R010_ueqv_R010YNN_partial_25_2256,
  rs_R010_ueqv_R010YNN_partial_25_2257,
  rs_R010_ueqv_R010YNN_partial_25_2258,
  rs_R010_ueqv_R010YNN_partial_25_2259,
  rs_R010_ueqv_R010YNN_partial_25_2260,
  rs_R010_ueqv_R010YNN_partial_25_2261,
  rs_R010_ueqv_R010YNN_partial_25_2262,
  rs_R010_ueqv_R010YNN_partial_25_2263,
  rs_R010_ueqv_R010YNN_partial_25_2264,
  rs_R010_ueqv_R010YNN_partial_25_2265,
  rs_R010_ueqv_R010YNN_partial_25_2266,
  rs_R010_ueqv_R010YNN_partial_25_2267,
  rs_R010_ueqv_R010YNN_partial_25_2268,
  rs_R010_ueqv_R010YNN_partial_25_2269,
  rs_R010_ueqv_R010YNN_partial_25_2270,
  rs_R010_ueqv_R010YNN_partial_25_2271,
  rs_R010_ueqv_R010YNN_partial_25_2272,
  rs_R010_ueqv_R010YNN_partial_25_2273,
  rs_R010_ueqv_R010YNN_partial_25_2274,
  rs_R010_ueqv_R010YNN_partial_25_2275
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_2200_2275 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1798061906377746944 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-748128505348214144 : Rat) / 5988696105078439) [(5, 3), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((899030953188873472 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((374064252674107072 : Rat) / 5988696105078439) [(5, 3), (8, 1), (9, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6823378830145568768 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6161580727866699136 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6405593232047691712 : Rat) / 269491324728529755) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425807632509172689184 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((490281168332055936 : Rat) / 5988696105078439) [(5, 3), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2282236894500593536 : Rat) / 53898264945705951) [(5, 3), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((61772085167047826888 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-245140584166027968 : Rat) / 5988696105078439) [(5, 3), (9, 1), (14, 1), (16, 1)],
  term ((1141118447250296768 : Rat) / 53898264945705951) [(5, 3), (9, 1), (14, 2), (16, 1)],
  term ((-206920271389095766096 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)],
  term ((-30886042583523913444 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-21014714090742697600 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11147594596347129856 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4731665166434027008 : Rat) / 5988696105078439) [(5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13126344574278977536 : Rat) / 29943480525392195) [(5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((99950510261895025408 : Rat) / 269491324728529755) [(5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((47291255505742876672 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2365832583217013504 : Rat) / 5988696105078439) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-109089324513126108544 : Rat) / 269491324728529755) [(5, 3), (9, 2), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 3), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12219177287232399872 : Rat) / 269491324728529755) [(5, 3), (9, 3), (12, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (15, 2), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)],
  term ((-29529423139308755544 : Rat) / 149717402626960975) [(5, 3), (11, 1), (12, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (12, 1), (13, 1), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (12, 2), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)],
  term ((21875906245353883358 : Rat) / 149717402626960975) [(5, 3), (15, 1), (16, 1)],
  term ((3194260827736903936 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(5, 4), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-597468916947693824 : Rat) / 5988696105078439) [(5, 4), (9, 2), (12, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (15, 2), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (16, 1)],
  term (-8 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(12, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 2200 through 2275. -/
theorem rs_R010_ueqv_R010YNN_block_25_2200_2275_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_2200_2275
      rs_R010_ueqv_R010YNN_block_25_2200_2275 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
