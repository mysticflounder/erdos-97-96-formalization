/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 29:300-315

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_29_0300_0315 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(7, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0300 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0300 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0300_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0300
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0301 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0301 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0301_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0301
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0302 : Poly :=
[
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 302 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0302 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0302_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0302
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0303 : Poly :=
[
  term ((1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 303 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0303 : Poly :=
[
  term ((1 : Rat) / 3) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0303_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0303
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0304 : Poly :=
[
  term ((-131056943131691104819135 : Rat) / 1259724289439525573076) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0304 : Poly :=
[
  term ((-131056943131691104819135 : Rat) / 629862144719762786538) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((131056943131691104819135 : Rat) / 1259724289439525573076) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-131056943131691104819135 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((131056943131691104819135 : Rat) / 1259724289439525573076) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((131056943131691104819135 : Rat) / 629862144719762786538) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-131056943131691104819135 : Rat) / 1259724289439525573076) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0304_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0304
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0305 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)]
]

/-- Partial product 305 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0305 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (12, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (15, 3), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 2), (12, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0305_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0305
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0306 : Poly :=
[
  term ((5600034321414928086805 : Rat) / 59986870925691693956) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0306 : Poly :=
[
  term ((5600034321414928086805 : Rat) / 29993435462845846978) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5600034321414928086805 : Rat) / 59986870925691693956) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5600034321414928086805 : Rat) / 29993435462845846978) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5600034321414928086805 : Rat) / 59986870925691693956) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5600034321414928086805 : Rat) / 59986870925691693956) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5600034321414928086805 : Rat) / 29993435462845846978) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0306_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0306
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0307 : Poly :=
[
  term ((-3063606909902063657353 : Rat) / 29993435462845846978) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0307 : Poly :=
[
  term ((-3063606909902063657353 : Rat) / 14996717731422923489) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3063606909902063657353 : Rat) / 29993435462845846978) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3063606909902063657353 : Rat) / 14996717731422923489) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3063606909902063657353 : Rat) / 29993435462845846978) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3063606909902063657353 : Rat) / 14996717731422923489) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3063606909902063657353 : Rat) / 29993435462845846978) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0307_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0307
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0308 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 308 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0308 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0308_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0308
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0309 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 309 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0309 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0309_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0309
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0310 : Poly :=
[
  term ((-70428392025343513399 : Rat) / 6427164742038395781) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 310 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0310 : Poly :=
[
  term ((-140856784050687026798 : Rat) / 6427164742038395781) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((70428392025343513399 : Rat) / 6427164742038395781) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-140856784050687026798 : Rat) / 6427164742038395781) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((70428392025343513399 : Rat) / 6427164742038395781) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-70428392025343513399 : Rat) / 6427164742038395781) [(14, 1), (15, 2), (16, 1)],
  term ((140856784050687026798 : Rat) / 6427164742038395781) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0310_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0310
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0311 : Poly :=
[
  term ((7 : Rat) / 24) [(14, 1), (16, 1)]
]

/-- Partial product 311 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0311 : Poly :=
[
  term ((7 : Rat) / 12) [(6, 1), (14, 2), (16, 1)],
  term ((-7 : Rat) / 24) [(6, 2), (14, 1), (16, 1)],
  term ((7 : Rat) / 12) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 24) [(7, 2), (14, 1), (16, 1)],
  term ((7 : Rat) / 24) [(14, 1), (16, 1)],
  term ((-7 : Rat) / 12) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0311_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0311
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0312 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0312 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (14, 3), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(14, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0312_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0312
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0313 : Poly :=
[
  term ((461090674170977344805597 : Rat) / 2519448578879051146152) [(15, 2), (16, 1)]
]

/-- Partial product 313 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0313 : Poly :=
[
  term ((461090674170977344805597 : Rat) / 1259724289439525573076) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-461090674170977344805597 : Rat) / 2519448578879051146152) [(6, 2), (15, 2), (16, 1)],
  term ((461090674170977344805597 : Rat) / 1259724289439525573076) [(7, 1), (15, 3), (16, 1)],
  term ((-461090674170977344805597 : Rat) / 2519448578879051146152) [(7, 2), (15, 2), (16, 1)],
  term ((-461090674170977344805597 : Rat) / 1259724289439525573076) [(14, 1), (15, 2), (16, 1)],
  term ((461090674170977344805597 : Rat) / 2519448578879051146152) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0313_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0313
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0314 : Poly :=
[
  term ((4383909237210669214 : Rat) / 445447061329393767) [(15, 2), (16, 2)]
]

/-- Partial product 314 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0314 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(6, 2), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (15, 3), (16, 2)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(7, 2), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0314_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0314
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0315 : Poly :=
[
  term ((7 : Rat) / 12) [(16, 1)]
]

/-- Partial product 315 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0315 : Poly :=
[
  term ((7 : Rat) / 6) [(6, 1), (14, 1), (16, 1)],
  term ((-7 : Rat) / 12) [(6, 2), (16, 1)],
  term ((7 : Rat) / 6) [(7, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 12) [(7, 2), (16, 1)],
  term ((-7 : Rat) / 6) [(14, 1), (16, 1)],
  term ((7 : Rat) / 12) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0315_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0315
        rs_R007_ueqv_R007NY_generator_29_0300_0315 =
      rs_R007_ueqv_R007NY_partial_29_0315 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_29_0300_0315 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_29_0300,
  rs_R007_ueqv_R007NY_partial_29_0301,
  rs_R007_ueqv_R007NY_partial_29_0302,
  rs_R007_ueqv_R007NY_partial_29_0303,
  rs_R007_ueqv_R007NY_partial_29_0304,
  rs_R007_ueqv_R007NY_partial_29_0305,
  rs_R007_ueqv_R007NY_partial_29_0306,
  rs_R007_ueqv_R007NY_partial_29_0307,
  rs_R007_ueqv_R007NY_partial_29_0308,
  rs_R007_ueqv_R007NY_partial_29_0309,
  rs_R007_ueqv_R007NY_partial_29_0310,
  rs_R007_ueqv_R007NY_partial_29_0311,
  rs_R007_ueqv_R007NY_partial_29_0312,
  rs_R007_ueqv_R007NY_partial_29_0313,
  rs_R007_ueqv_R007NY_partial_29_0314,
  rs_R007_ueqv_R007NY_partial_29_0315
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_29_0300_0315 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-131056943131691104819135 : Rat) / 629862144719762786538) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3063606909902063657353 : Rat) / 14996717731422923489) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((5600034321414928086805 : Rat) / 29993435462845846978) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((461090674170977344805597 : Rat) / 1259724289439525573076) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)],
  term ((7 : Rat) / 6) [(6, 1), (14, 1), (16, 1)],
  term ((-140856784050687026798 : Rat) / 6427164742038395781) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((7 : Rat) / 12) [(6, 1), (14, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (14, 3), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((131056943131691104819135 : Rat) / 1259724289439525573076) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (12, 1), (15, 2), (16, 2)],
  term ((-5600034321414928086805 : Rat) / 59986870925691693956) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3063606909902063657353 : Rat) / 29993435462845846978) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((70428392025343513399 : Rat) / 6427164742038395781) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 24) [(6, 2), (14, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((-461090674170977344805597 : Rat) / 2519448578879051146152) [(6, 2), (15, 2), (16, 1)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(6, 2), (15, 2), (16, 2)],
  term ((-7 : Rat) / 12) [(6, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-131056943131691104819135 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (15, 3), (16, 2)],
  term ((5600034321414928086805 : Rat) / 29993435462845846978) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3063606909902063657353 : Rat) / 14996717731422923489) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((7 : Rat) / 12) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140856784050687026798 : Rat) / 6427164742038395781) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((7 : Rat) / 6) [(7, 1), (15, 1), (16, 1)],
  term ((461090674170977344805597 : Rat) / 1259724289439525573076) [(7, 1), (15, 3), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (15, 3), (16, 2)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((131056943131691104819135 : Rat) / 1259724289439525573076) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 2), (12, 1), (15, 2), (16, 2)],
  term ((-5600034321414928086805 : Rat) / 59986870925691693956) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3063606909902063657353 : Rat) / 29993435462845846978) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((70428392025343513399 : Rat) / 6427164742038395781) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 24) [(7, 2), (14, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-461090674170977344805597 : Rat) / 2519448578879051146152) [(7, 2), (15, 2), (16, 1)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(7, 2), (15, 2), (16, 2)],
  term ((-7 : Rat) / 12) [(7, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45342355572352038314965 : Rat) / 209954048239920928846) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)],
  term ((1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 1), (14, 2), (16, 1)],
  term ((-131056943131691104819135 : Rat) / 1259724289439525573076) [(12, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)],
  term ((17854461961023182716217 : Rat) / 59986870925691693956) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5600034321414928086805 : Rat) / 29993435462845846978) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3063606909902063657353 : Rat) / 29993435462845846978) [(13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)],
  term ((-158298213002648224477267 : Rat) / 419908096479841857692) [(14, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)],
  term ((-7 : Rat) / 8) [(14, 1), (16, 1)],
  term ((91993277767554961302 : Rat) / 14996717731422923489) [(14, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 12) [(14, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(14, 3), (15, 2), (16, 1)],
  term ((461090674170977344805597 : Rat) / 2519448578879051146152) [(15, 2), (16, 1)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(15, 2), (16, 2)],
  term ((7 : Rat) / 12) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 300 through 315. -/
theorem rs_R007_ueqv_R007NY_block_29_0300_0315_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_29_0300_0315
      rs_R007_ueqv_R007NY_block_29_0300_0315 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
