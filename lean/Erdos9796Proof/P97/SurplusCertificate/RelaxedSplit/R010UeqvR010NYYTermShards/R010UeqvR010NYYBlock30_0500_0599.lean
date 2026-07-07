/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 30:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_30_0500_0599 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0500 : Poly :=
[
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 500 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0500 : Poly :=
[
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (12, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0500_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0500
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0501 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 501 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0501 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0501_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0501
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0502 : Poly :=
[
  term ((6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 502 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0502 : Poly :=
[
  term ((6149870212956131 : Rat) / 426119688983744) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((6149870212956131 : Rat) / 426119688983744) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0502_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0502
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0503 : Poly :=
[
  term ((1175618734587767943 : Rat) / 1203362001690093056) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 503 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0503 : Poly :=
[
  term ((1175618734587767943 : Rat) / 601681000845046528) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 1203362001690093056) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((1175618734587767943 : Rat) / 601681000845046528) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 1203362001690093056) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0503_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0503
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0504 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 504 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0504 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0504_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0504
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0505 : Poly :=
[
  term ((701456634752293629 : Rat) / 263235437869707856) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0505 : Poly :=
[
  term ((701456634752293629 : Rat) / 131617718934853928) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-701456634752293629 : Rat) / 263235437869707856) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((701456634752293629 : Rat) / 131617718934853928) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-701456634752293629 : Rat) / 263235437869707856) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0505_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0505
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0506 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 506 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0506 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0506_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0506
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0507 : Poly :=
[
  term ((81408417602867953167 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0507 : Poly :=
[
  term ((81408417602867953167 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81408417602867953167 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((81408417602867953167 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-81408417602867953167 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0507_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0507
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0508 : Poly :=
[
  term ((-105890459758015550169 : Rat) / 9626896013520744448) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 508 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0508 : Poly :=
[
  term ((-105890459758015550169 : Rat) / 4813448006760372224) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((105890459758015550169 : Rat) / 9626896013520744448) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-105890459758015550169 : Rat) / 4813448006760372224) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((105890459758015550169 : Rat) / 9626896013520744448) [(5, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0508_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0508
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0509 : Poly :=
[
  term ((907278485838307355433 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 509 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0509 : Poly :=
[
  term ((907278485838307355433 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-907278485838307355433 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((907278485838307355433 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-907278485838307355433 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0509_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0509
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0510 : Poly :=
[
  term ((19172257007324021273 : Rat) / 1821304651206627328) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 510 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0510 : Poly :=
[
  term ((19172257007324021273 : Rat) / 910652325603313664) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-19172257007324021273 : Rat) / 1821304651206627328) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((19172257007324021273 : Rat) / 910652325603313664) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19172257007324021273 : Rat) / 1821304651206627328) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0510_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0510
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0511 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 511 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0511 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0511_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0511
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0512 : Poly :=
[
  term ((9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 512 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0512 : Poly :=
[
  term ((9613258292915725557 : Rat) / 2105883502957662848) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 2105883502957662848) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0512_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0512
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0513 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 513 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0513 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0513_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0513
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0514 : Poly :=
[
  term ((6116872167863060433 : Rat) / 16847068023661302784) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 514 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0514 : Poly :=
[
  term ((6116872167863060433 : Rat) / 8423534011830651392) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6116872167863060433 : Rat) / 16847068023661302784) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((6116872167863060433 : Rat) / 8423534011830651392) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6116872167863060433 : Rat) / 16847068023661302784) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0514_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0514
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0515 : Poly :=
[
  term ((915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 515 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0515 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0515_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0515
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0516 : Poly :=
[
  term ((-761964466074359569479 : Rat) / 134776544189290422272) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 516 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0516 : Poly :=
[
  term ((-761964466074359569479 : Rat) / 67388272094645211136) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((761964466074359569479 : Rat) / 134776544189290422272) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-761964466074359569479 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((761964466074359569479 : Rat) / 134776544189290422272) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0516_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0516
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0517 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 517 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0517 : Poly :=
[
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0517_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0517
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0518 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 518 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0518 : Poly :=
[
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0518_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0518
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0519 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0519 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0519_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0519
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0520 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0520 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0520_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0520
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0521 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 521 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0521 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (12, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0521_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0521
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0522 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 522 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0522 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0522_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0522
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0523 : Poly :=
[
  term ((-3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 523 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0523 : Poly :=
[
  term ((-3728508138334321 : Rat) / 639179533475616) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0523_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0523
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0524 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0524 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0524_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0524
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0525 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 525 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0525 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0525_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0525
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0526 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 526 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0526 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0526_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0526
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0527 : Poly :=
[
  term ((-3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 527 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0527 : Poly :=
[
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0527_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0527
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0528 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 528 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0528 : Poly :=
[
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0528_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0528
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0529 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 529 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0529 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0529_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0529
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0530 : Poly :=
[
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 530 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0530 : Poly :=
[
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0530_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0530
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0531 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 531 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0531 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0531_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0531
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0532 : Poly :=
[
  term ((-927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 532 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0532 : Poly :=
[
  term ((-927970231076998320611 : Rat) / 50541204070983908352) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-927970231076998320611 : Rat) / 50541204070983908352) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0532_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0532
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0533 : Poly :=
[
  term ((-9456908674723431911981 : Rat) / 31920760465884573696) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 533 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0533 : Poly :=
[
  term ((-9456908674723431911981 : Rat) / 15960380232942286848) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9456908674723431911981 : Rat) / 31920760465884573696) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-9456908674723431911981 : Rat) / 15960380232942286848) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9456908674723431911981 : Rat) / 31920760465884573696) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0533_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0533
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0534 : Poly :=
[
  term ((118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 534 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0534 : Poly :=
[
  term ((118762376429848645 : Rat) / 23862702583089664) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((118762376429848645 : Rat) / 23862702583089664) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0534_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0534
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0535 : Poly :=
[
  term ((-174183881016223661 : Rat) / 2579751630604288) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 535 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0535 : Poly :=
[
  term ((-174183881016223661 : Rat) / 1289875815302144) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((174183881016223661 : Rat) / 2579751630604288) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-174183881016223661 : Rat) / 1289875815302144) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((174183881016223661 : Rat) / 2579751630604288) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0535_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0535
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0536 : Poly :=
[
  term ((40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 536 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0536 : Poly :=
[
  term ((40653121365766723152949 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((40653121365766723152949 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0536_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0536
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0537 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 537 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0537 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (12, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0537_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0537
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0538 : Poly :=
[
  term ((-848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 538 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0538 : Poly :=
[
  term ((-848513315802319 : Rat) / 852239377967488) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-848513315802319 : Rat) / 852239377967488) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0538_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0538
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0539 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 539 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0539 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0539_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0539
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0540 : Poly :=
[
  term ((-12189839642686807 : Rat) / 10226872535609856) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 540 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0540 : Poly :=
[
  term ((-12189839642686807 : Rat) / 5113436267804928) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((12189839642686807 : Rat) / 10226872535609856) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-12189839642686807 : Rat) / 5113436267804928) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12189839642686807 : Rat) / 10226872535609856) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0540_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0540
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0541 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)]
]

/-- Partial product 541 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0541 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (12, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0541_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0541
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0542 : Poly :=
[
  term ((3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 542 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0542 : Poly :=
[
  term ((3674057352858660123931 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((3674057352858660123931 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0542_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0542
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0543 : Poly :=
[
  term ((-553915259434168782579 : Rat) / 16847068023661302784) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 543 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0543 : Poly :=
[
  term ((-553915259434168782579 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((553915259434168782579 : Rat) / 16847068023661302784) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-553915259434168782579 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((553915259434168782579 : Rat) / 16847068023661302784) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0543_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0543
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0544 : Poly :=
[
  term ((1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 544 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0544 : Poly :=
[
  term ((1186750147506747 : Rat) / 322468953825536) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1186750147506747 : Rat) / 322468953825536) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0544_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0544
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0545 : Poly :=
[
  term ((21301016807739343590385 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 545 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0545 : Poly :=
[
  term ((21301016807739343590385 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21301016807739343590385 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((21301016807739343590385 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21301016807739343590385 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0545_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0545
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0546 : Poly :=
[
  term ((234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 546 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0546 : Poly :=
[
  term ((234049543066301841079 : Rat) / 8423534011830651392) [(8, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((234049543066301841079 : Rat) / 8423534011830651392) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0546_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0546
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0547 : Poly :=
[
  term ((-475103947355123905247 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 547 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0547 : Poly :=
[
  term ((-475103947355123905247 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((475103947355123905247 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((-475103947355123905247 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((475103947355123905247 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0547_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0547
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0548 : Poly :=
[
  term ((16549472857713853 : Rat) / 1491418911443104) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 548 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0548 : Poly :=
[
  term ((16549472857713853 : Rat) / 745709455721552) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16549472857713853 : Rat) / 745709455721552) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0548_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0548
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0549 : Poly :=
[
  term ((-484540098978225767 : Rat) / 47725405166179328) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 549 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0549 : Poly :=
[
  term ((-484540098978225767 : Rat) / 23862702583089664) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((484540098978225767 : Rat) / 47725405166179328) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-484540098978225767 : Rat) / 23862702583089664) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((484540098978225767 : Rat) / 47725405166179328) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0549_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0549
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0550 : Poly :=
[
  term ((3084653865858353 : Rat) / 958769300213424) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 550 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0550 : Poly :=
[
  term ((3084653865858353 : Rat) / 479384650106712) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3084653865858353 : Rat) / 958769300213424) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((3084653865858353 : Rat) / 479384650106712) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3084653865858353 : Rat) / 958769300213424) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0550_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0550
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0551 : Poly :=
[
  term ((82469186459841715 : Rat) / 1255931714899456) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0551 : Poly :=
[
  term ((82469186459841715 : Rat) / 627965857449728) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82469186459841715 : Rat) / 1255931714899456) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((82469186459841715 : Rat) / 627965857449728) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-82469186459841715 : Rat) / 1255931714899456) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0551_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0551
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0552 : Poly :=
[
  term ((-111796456313038453 : Rat) / 61361235213659136) [(8, 1), (16, 1)]
]

/-- Partial product 552 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0552 : Poly :=
[
  term ((-111796456313038453 : Rat) / 30680617606829568) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((111796456313038453 : Rat) / 61361235213659136) [(8, 1), (12, 2), (16, 1)],
  term ((-111796456313038453 : Rat) / 30680617606829568) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((111796456313038453 : Rat) / 61361235213659136) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0552_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0552
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0553 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 553 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0553 : Poly :=
[
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0553_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0553
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0554 : Poly :=
[
  term ((-44262078859107273043 : Rat) / 16847068023661302784) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 554 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0554 : Poly :=
[
  term ((-44262078859107273043 : Rat) / 8423534011830651392) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((44262078859107273043 : Rat) / 16847068023661302784) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-44262078859107273043 : Rat) / 8423534011830651392) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((44262078859107273043 : Rat) / 16847068023661302784) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0554_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0554
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0555 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 555 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0555 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0555_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0555
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0556 : Poly :=
[
  term ((-50723197831173033 : Rat) / 11931351291544832) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 556 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0556 : Poly :=
[
  term ((-50723197831173033 : Rat) / 5965675645772416) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((50723197831173033 : Rat) / 11931351291544832) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50723197831173033 : Rat) / 5965675645772416) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((50723197831173033 : Rat) / 11931351291544832) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0556_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0556
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0557 : Poly :=
[
  term ((9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0557 : Poly :=
[
  term ((9655207142042678387 : Rat) / 2406724003380186112) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9655207142042678387 : Rat) / 2406724003380186112) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0557_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0557
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0558 : Poly :=
[
  term ((-10610287843087286327027 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 558 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0558 : Poly :=
[
  term ((-10610287843087286327027 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10610287843087286327027 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10610287843087286327027 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((10610287843087286327027 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0558_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0558
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0559 : Poly :=
[
  term ((10949345962164646213349 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 559 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0559 : Poly :=
[
  term ((10949345962164646213349 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-10949345962164646213349 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((10949345962164646213349 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10949345962164646213349 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0559_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0559
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0560 : Poly :=
[
  term ((2485568019506233007025 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 560 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0560 : Poly :=
[
  term ((2485568019506233007025 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2485568019506233007025 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2485568019506233007025 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2485568019506233007025 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0560_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0560
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0561 : Poly :=
[
  term ((25511228095486619850901 : Rat) / 134776544189290422272) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 561 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0561 : Poly :=
[
  term ((25511228095486619850901 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-25511228095486619850901 : Rat) / 134776544189290422272) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((25511228095486619850901 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25511228095486619850901 : Rat) / 134776544189290422272) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0561_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0561
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0562 : Poly :=
[
  term ((-240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 562 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0562 : Poly :=
[
  term ((-240473047099696446673 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-240473047099696446673 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0562_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0562
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0563 : Poly :=
[
  term ((-40600510469440775519 : Rat) / 3158825254436494272) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 563 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0563 : Poly :=
[
  term ((-40600510469440775519 : Rat) / 1579412627218247136) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((40600510469440775519 : Rat) / 3158825254436494272) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-40600510469440775519 : Rat) / 1579412627218247136) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((40600510469440775519 : Rat) / 3158825254436494272) [(9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0563_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0563
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0564 : Poly :=
[
  term ((44142544880674366810393 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 564 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0564 : Poly :=
[
  term ((44142544880674366810393 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44142544880674366810393 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((44142544880674366810393 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-44142544880674366810393 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0564_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0564
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0565 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (16, 1)]
]

/-- Partial product 565 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0565 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (12, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0565_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0565
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0566 : Poly :=
[
  term ((-183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 566 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0566 : Poly :=
[
  term ((-183099752496479997 : Rat) / 23862702583089664) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-183099752496479997 : Rat) / 23862702583089664) [(9, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0566_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0566
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0567 : Poly :=
[
  term ((1396991133095807 : Rat) / 5113436267804928) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 567 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0567 : Poly :=
[
  term ((1396991133095807 : Rat) / 2556718133902464) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1396991133095807 : Rat) / 5113436267804928) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1396991133095807 : Rat) / 2556718133902464) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1396991133095807 : Rat) / 5113436267804928) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0567_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0567
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0568 : Poly :=
[
  term ((-105715467764947237 : Rat) / 13635830047479808) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 568 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0568 : Poly :=
[
  term ((-105715467764947237 : Rat) / 6817915023739904) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((105715467764947237 : Rat) / 13635830047479808) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-105715467764947237 : Rat) / 6817915023739904) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((105715467764947237 : Rat) / 13635830047479808) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0568_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0568
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0569 : Poly :=
[
  term ((-104007624103909 : Rat) / 121748482566784) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 569 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0569 : Poly :=
[
  term ((-104007624103909 : Rat) / 60874241283392) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((104007624103909 : Rat) / 121748482566784) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-104007624103909 : Rat) / 60874241283392) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((104007624103909 : Rat) / 121748482566784) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0569_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0569
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0570 : Poly :=
[
  term ((1620906787880641469 : Rat) / 190901620664717312) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0570 : Poly :=
[
  term ((1620906787880641469 : Rat) / 95450810332358656) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1620906787880641469 : Rat) / 190901620664717312) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1620906787880641469 : Rat) / 95450810332358656) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1620906787880641469 : Rat) / 190901620664717312) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0570_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0570
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0571 : Poly :=
[
  term ((7416331488360494857 : Rat) / 190901620664717312) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 571 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0571 : Poly :=
[
  term ((7416331488360494857 : Rat) / 95450810332358656) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7416331488360494857 : Rat) / 190901620664717312) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((7416331488360494857 : Rat) / 95450810332358656) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7416331488360494857 : Rat) / 190901620664717312) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0571_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0571
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0572 : Poly :=
[
  term ((-183099752496479997 : Rat) / 95450810332358656) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 572 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0572 : Poly :=
[
  term ((-183099752496479997 : Rat) / 47725405166179328) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((183099752496479997 : Rat) / 95450810332358656) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((183099752496479997 : Rat) / 95450810332358656) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0572_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0572
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0573 : Poly :=
[
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 573 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0573 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0573_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0573
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0574 : Poly :=
[
  term ((-447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 574 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0574 : Poly :=
[
  term ((-447111482668512639503 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0574_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0574
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0575 : Poly :=
[
  term ((13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0575 : Poly :=
[
  term ((13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0575_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0575
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0576 : Poly :=
[
  term ((5814353978401980173 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (16, 1)]
]

/-- Partial product 576 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0576 : Poly :=
[
  term ((5814353978401980173 : Rat) / 1052941751478831424) [(9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-5814353978401980173 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (12, 2), (16, 1)],
  term ((5814353978401980173 : Rat) / 1052941751478831424) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5814353978401980173 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0576_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0576
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0577 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0577 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0577_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0577
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0578 : Poly :=
[
  term ((-255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 578 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0578 : Poly :=
[
  term ((-255006898652461167 : Rat) / 5965675645772416) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 5965675645772416) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0578_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0578
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0579 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 579 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0579 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0579_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0579
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0580 : Poly :=
[
  term ((37052508790115989 : Rat) / 1704478755934976) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 580 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0580 : Poly :=
[
  term ((37052508790115989 : Rat) / 852239377967488) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-37052508790115989 : Rat) / 1704478755934976) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((37052508790115989 : Rat) / 852239377967488) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-37052508790115989 : Rat) / 1704478755934976) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0580_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0580
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0581 : Poly :=
[
  term ((-221064281913845 : Rat) / 269128224621312) [(9, 2), (16, 1)]
]

/-- Partial product 581 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0581 : Poly :=
[
  term ((-221064281913845 : Rat) / 134564112310656) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((221064281913845 : Rat) / 269128224621312) [(9, 2), (12, 2), (16, 1)],
  term ((-221064281913845 : Rat) / 134564112310656) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((221064281913845 : Rat) / 269128224621312) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0581_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0581
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0582 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (16, 1)]
]

/-- Partial product 582 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0582 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (12, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0582_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0582
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0583 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 583 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0583 : Poly :=
[
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0583_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0583
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0584 : Poly :=
[
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 584 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0584 : Poly :=
[
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0584_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0584
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0585 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 585 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0585 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0585_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0585
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0586 : Poly :=
[
  term ((683208579787935367 : Rat) / 110835973839876992) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 586 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0586 : Poly :=
[
  term ((683208579787935367 : Rat) / 55417986919938496) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-683208579787935367 : Rat) / 110835973839876992) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((683208579787935367 : Rat) / 55417986919938496) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-683208579787935367 : Rat) / 110835973839876992) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0586_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0586
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0587 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 587 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0587 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0587_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0587
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0588 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 588 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0588 : Poly :=
[
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0588_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0588
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0589 : Poly :=
[
  term ((17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 589 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0589 : Poly :=
[
  term ((17805922420307 : Rat) / 30437120641696) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17805922420307 : Rat) / 30437120641696) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0589_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0589
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0590 : Poly :=
[
  term ((-3086983454325823 : Rat) / 852239377967488) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0590 : Poly :=
[
  term ((-3086983454325823 : Rat) / 426119688983744) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3086983454325823 : Rat) / 852239377967488) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3086983454325823 : Rat) / 426119688983744) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3086983454325823 : Rat) / 852239377967488) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0590_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0590
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0591 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 591 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0591 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0591_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0591
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0592 : Poly :=
[
  term ((-6317130484575125 : Rat) / 1460981790801408) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 592 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0592 : Poly :=
[
  term ((-6317130484575125 : Rat) / 730490895400704) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-6317130484575125 : Rat) / 730490895400704) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0592_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0592
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0593 : Poly :=
[
  term ((-724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 593 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0593 : Poly :=
[
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (12, 1), (14, 3), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0593_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0593
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0594 : Poly :=
[
  term ((-7787729474690171 : Rat) / 23862702583089664) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 594 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0594 : Poly :=
[
  term ((-7787729474690171 : Rat) / 11931351291544832) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7787729474690171 : Rat) / 23862702583089664) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-7787729474690171 : Rat) / 11931351291544832) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7787729474690171 : Rat) / 23862702583089664) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0594_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0594
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0595 : Poly :=
[
  term ((1892829473632371 : Rat) / 426119688983744) [(10, 1), (16, 1)]
]

/-- Partial product 595 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0595 : Poly :=
[
  term ((1892829473632371 : Rat) / 213059844491872) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(10, 1), (12, 2), (16, 1)],
  term ((1892829473632371 : Rat) / 213059844491872) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0595_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0595
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0596 : Poly :=
[
  term ((14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 1), (16, 1)]
]

/-- Partial product 596 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0596 : Poly :=
[
  term ((14849754300339743 : Rat) / 1704478755934976) [(10, 2), (12, 1), (14, 2), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0596_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0596
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0597 : Poly :=
[
  term ((6118903222396731 : Rat) / 6817915023739904) [(10, 2), (16, 1)]
]

/-- Partial product 597 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0597 : Poly :=
[
  term ((6118903222396731 : Rat) / 3408957511869952) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(10, 2), (12, 2), (16, 1)],
  term ((6118903222396731 : Rat) / 3408957511869952) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0597_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0597
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0598 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 3), (16, 1)]
]

/-- Partial product 598 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0598 : Poly :=
[
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 3), (12, 1), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (12, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0598_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0598
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0599 : Poly :=
[
  term ((24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 599 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0599 : Poly :=
[
  term ((24259046380348383 : Rat) / 5965675645772416) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24259046380348383 : Rat) / 5965675645772416) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0599_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0599
        rs_R010_ueqv_R010NYY_generator_30_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_30_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_30_0500_0599 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_30_0500,
  rs_R010_ueqv_R010NYY_partial_30_0501,
  rs_R010_ueqv_R010NYY_partial_30_0502,
  rs_R010_ueqv_R010NYY_partial_30_0503,
  rs_R010_ueqv_R010NYY_partial_30_0504,
  rs_R010_ueqv_R010NYY_partial_30_0505,
  rs_R010_ueqv_R010NYY_partial_30_0506,
  rs_R010_ueqv_R010NYY_partial_30_0507,
  rs_R010_ueqv_R010NYY_partial_30_0508,
  rs_R010_ueqv_R010NYY_partial_30_0509,
  rs_R010_ueqv_R010NYY_partial_30_0510,
  rs_R010_ueqv_R010NYY_partial_30_0511,
  rs_R010_ueqv_R010NYY_partial_30_0512,
  rs_R010_ueqv_R010NYY_partial_30_0513,
  rs_R010_ueqv_R010NYY_partial_30_0514,
  rs_R010_ueqv_R010NYY_partial_30_0515,
  rs_R010_ueqv_R010NYY_partial_30_0516,
  rs_R010_ueqv_R010NYY_partial_30_0517,
  rs_R010_ueqv_R010NYY_partial_30_0518,
  rs_R010_ueqv_R010NYY_partial_30_0519,
  rs_R010_ueqv_R010NYY_partial_30_0520,
  rs_R010_ueqv_R010NYY_partial_30_0521,
  rs_R010_ueqv_R010NYY_partial_30_0522,
  rs_R010_ueqv_R010NYY_partial_30_0523,
  rs_R010_ueqv_R010NYY_partial_30_0524,
  rs_R010_ueqv_R010NYY_partial_30_0525,
  rs_R010_ueqv_R010NYY_partial_30_0526,
  rs_R010_ueqv_R010NYY_partial_30_0527,
  rs_R010_ueqv_R010NYY_partial_30_0528,
  rs_R010_ueqv_R010NYY_partial_30_0529,
  rs_R010_ueqv_R010NYY_partial_30_0530,
  rs_R010_ueqv_R010NYY_partial_30_0531,
  rs_R010_ueqv_R010NYY_partial_30_0532,
  rs_R010_ueqv_R010NYY_partial_30_0533,
  rs_R010_ueqv_R010NYY_partial_30_0534,
  rs_R010_ueqv_R010NYY_partial_30_0535,
  rs_R010_ueqv_R010NYY_partial_30_0536,
  rs_R010_ueqv_R010NYY_partial_30_0537,
  rs_R010_ueqv_R010NYY_partial_30_0538,
  rs_R010_ueqv_R010NYY_partial_30_0539,
  rs_R010_ueqv_R010NYY_partial_30_0540,
  rs_R010_ueqv_R010NYY_partial_30_0541,
  rs_R010_ueqv_R010NYY_partial_30_0542,
  rs_R010_ueqv_R010NYY_partial_30_0543,
  rs_R010_ueqv_R010NYY_partial_30_0544,
  rs_R010_ueqv_R010NYY_partial_30_0545,
  rs_R010_ueqv_R010NYY_partial_30_0546,
  rs_R010_ueqv_R010NYY_partial_30_0547,
  rs_R010_ueqv_R010NYY_partial_30_0548,
  rs_R010_ueqv_R010NYY_partial_30_0549,
  rs_R010_ueqv_R010NYY_partial_30_0550,
  rs_R010_ueqv_R010NYY_partial_30_0551,
  rs_R010_ueqv_R010NYY_partial_30_0552,
  rs_R010_ueqv_R010NYY_partial_30_0553,
  rs_R010_ueqv_R010NYY_partial_30_0554,
  rs_R010_ueqv_R010NYY_partial_30_0555,
  rs_R010_ueqv_R010NYY_partial_30_0556,
  rs_R010_ueqv_R010NYY_partial_30_0557,
  rs_R010_ueqv_R010NYY_partial_30_0558,
  rs_R010_ueqv_R010NYY_partial_30_0559,
  rs_R010_ueqv_R010NYY_partial_30_0560,
  rs_R010_ueqv_R010NYY_partial_30_0561,
  rs_R010_ueqv_R010NYY_partial_30_0562,
  rs_R010_ueqv_R010NYY_partial_30_0563,
  rs_R010_ueqv_R010NYY_partial_30_0564,
  rs_R010_ueqv_R010NYY_partial_30_0565,
  rs_R010_ueqv_R010NYY_partial_30_0566,
  rs_R010_ueqv_R010NYY_partial_30_0567,
  rs_R010_ueqv_R010NYY_partial_30_0568,
  rs_R010_ueqv_R010NYY_partial_30_0569,
  rs_R010_ueqv_R010NYY_partial_30_0570,
  rs_R010_ueqv_R010NYY_partial_30_0571,
  rs_R010_ueqv_R010NYY_partial_30_0572,
  rs_R010_ueqv_R010NYY_partial_30_0573,
  rs_R010_ueqv_R010NYY_partial_30_0574,
  rs_R010_ueqv_R010NYY_partial_30_0575,
  rs_R010_ueqv_R010NYY_partial_30_0576,
  rs_R010_ueqv_R010NYY_partial_30_0577,
  rs_R010_ueqv_R010NYY_partial_30_0578,
  rs_R010_ueqv_R010NYY_partial_30_0579,
  rs_R010_ueqv_R010NYY_partial_30_0580,
  rs_R010_ueqv_R010NYY_partial_30_0581,
  rs_R010_ueqv_R010NYY_partial_30_0582,
  rs_R010_ueqv_R010NYY_partial_30_0583,
  rs_R010_ueqv_R010NYY_partial_30_0584,
  rs_R010_ueqv_R010NYY_partial_30_0585,
  rs_R010_ueqv_R010NYY_partial_30_0586,
  rs_R010_ueqv_R010NYY_partial_30_0587,
  rs_R010_ueqv_R010NYY_partial_30_0588,
  rs_R010_ueqv_R010NYY_partial_30_0589,
  rs_R010_ueqv_R010NYY_partial_30_0590,
  rs_R010_ueqv_R010NYY_partial_30_0591,
  rs_R010_ueqv_R010NYY_partial_30_0592,
  rs_R010_ueqv_R010NYY_partial_30_0593,
  rs_R010_ueqv_R010NYY_partial_30_0594,
  rs_R010_ueqv_R010NYY_partial_30_0595,
  rs_R010_ueqv_R010NYY_partial_30_0596,
  rs_R010_ueqv_R010NYY_partial_30_0597,
  rs_R010_ueqv_R010NYY_partial_30_0598,
  rs_R010_ueqv_R010NYY_partial_30_0599
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_30_0500_0599 : Poly :=
[
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (12, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (13, 2), (16, 1)],
  term ((6149870212956131 : Rat) / 426119688983744) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 426119688983744) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1175618734587767943 : Rat) / 601681000845046528) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((701456634752293629 : Rat) / 131617718934853928) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 1203362001690093056) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-701456634752293629 : Rat) / 263235437869707856) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((701456634752293629 : Rat) / 131617718934853928) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2993975013922322463 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 1203362001690093056) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((81408417602867953167 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((907278485838307355433 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((19172257007324021273 : Rat) / 910652325603313664) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-105890459758015550169 : Rat) / 4813448006760372224) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81408417602867953167 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((105890459758015550169 : Rat) / 9626896013520744448) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-907278485838307355433 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-19172257007324021273 : Rat) / 1821304651206627328) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-105890459758015550169 : Rat) / 4813448006760372224) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19172257007324021273 : Rat) / 910652325603313664) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((907278485838307355433 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((105890459758015550169 : Rat) / 9626896013520744448) [(5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-581644815426835542765 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19172257007324021273 : Rat) / 1821304651206627328) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-81408417602867953167 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6116872167863060433 : Rat) / 8423534011830651392) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 2105883502957662848) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-761964466074359569479 : Rat) / 67388272094645211136) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6116872167863060433 : Rat) / 16847068023661302784) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((761964466074359569479 : Rat) / 134776544189290422272) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-761964466074359569479 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-42932581144914963249 : Rat) / 19253792027041488896) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((859834420760168536407 : Rat) / 134776544189290422272) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (13, 3), (14, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-6116872167863060433 : Rat) / 16847068023661302784) [(5, 1), (13, 3), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (12, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9456908674723431911981 : Rat) / 15960380232942286848) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-927970231076998320611 : Rat) / 50541204070983908352) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((9456908674723431911981 : Rat) / 31920760465884573696) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-927970231076998320611 : Rat) / 50541204070983908352) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9456908674723431911981 : Rat) / 15960380232942286848) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((9456908674723431911981 : Rat) / 31920760465884573696) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-174183881016223661 : Rat) / 1289875815302144) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((118762376429848645 : Rat) / 23862702583089664) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((174183881016223661 : Rat) / 2579751630604288) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((118762376429848645 : Rat) / 23862702583089664) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-174183881016223661 : Rat) / 1289875815302144) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((174183881016223661 : Rat) / 2579751630604288) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((40653121365766723152949 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((40653121365766723152949 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (12, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (13, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12189839642686807 : Rat) / 5113436267804928) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-848513315802319 : Rat) / 852239377967488) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((12189839642686807 : Rat) / 10226872535609856) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-848513315802319 : Rat) / 852239377967488) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12189839642686807 : Rat) / 5113436267804928) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((12189839642686807 : Rat) / 10226872535609856) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (12, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-553915259434168782579 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3674057352858660123931 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((21301016807739343590385 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1186750147506747 : Rat) / 322468953825536) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((553915259434168782579 : Rat) / 16847068023661302784) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21301016807739343590385 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1186750147506747 : Rat) / 322468953825536) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((21301016807739343590385 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7208613412628049644759 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6571563535661715658399 : Rat) / 18952951526618965632) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((553915259434168782579 : Rat) / 16847068023661302784) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-475103947355123905247 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((234049543066301841079 : Rat) / 8423534011830651392) [(8, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((475103947355123905247 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((234049543066301841079 : Rat) / 8423534011830651392) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-475103947355123905247 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((475103947355123905247 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-484540098978225767 : Rat) / 23862702583089664) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16549472857713853 : Rat) / 745709455721552) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((82469186459841715 : Rat) / 627965857449728) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-111796456313038453 : Rat) / 30680617606829568) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((3084653865858353 : Rat) / 479384650106712) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((484540098978225767 : Rat) / 47725405166179328) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3084653865858353 : Rat) / 958769300213424) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-82469186459841715 : Rat) / 1255931714899456) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((111796456313038453 : Rat) / 61361235213659136) [(8, 1), (12, 2), (16, 1)],
  term ((3084653865858353 : Rat) / 479384650106712) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-111796456313038453 : Rat) / 30680617606829568) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((82469186459841715 : Rat) / 627965857449728) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((16549472857713853 : Rat) / 745709455721552) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3084653865858353 : Rat) / 958769300213424) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-128215915107201147 : Rat) / 1491418911443104) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((111796456313038453 : Rat) / 61361235213659136) [(8, 1), (13, 2), (16, 1)],
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((484540098978225767 : Rat) / 47725405166179328) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-44262078859107273043 : Rat) / 8423534011830651392) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((44262078859107273043 : Rat) / 16847068023661302784) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44262078859107273043 : Rat) / 8423534011830651392) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((44262078859107273043 : Rat) / 16847068023661302784) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-50723197831173033 : Rat) / 5965675645772416) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((50723197831173033 : Rat) / 11931351291544832) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-50723197831173033 : Rat) / 5965675645772416) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((50723197831173033 : Rat) / 11931351291544832) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10610287843087286327027 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9655207142042678387 : Rat) / 2406724003380186112) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2485568019506233007025 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((25511228095486619850901 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10949345962164646213349 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10610287843087286327027 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10949345962164646213349 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2485568019506233007025 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25511228095486619850901 : Rat) / 134776544189290422272) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((10949345962164646213349 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25511228095486619850901 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2485568019506233007025 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((9655207142042678387 : Rat) / 2406724003380186112) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10949345962164646213349 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-28677279744693271675129 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-25511228095486619850901 : Rat) / 134776544189290422272) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((10610287843087286327027 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-40600510469440775519 : Rat) / 1579412627218247136) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-240473047099696446673 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((44142544880674366810393 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((40600510469440775519 : Rat) / 3158825254436494272) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-44142544880674366810393 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((44142544880674366810393 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-240473047099696446673 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-51937842890806995710041 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 3), (14, 1), (16, 1)],
  term ((40600510469440775519 : Rat) / 3158825254436494272) [(9, 1), (11, 2), (13, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (12, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (13, 2), (16, 1)],
  term ((-105715467764947237 : Rat) / 6817915023739904) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-104007624103909 : Rat) / 60874241283392) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-183099752496479997 : Rat) / 23862702583089664) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1396991133095807 : Rat) / 2556718133902464) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((7416331488360494857 : Rat) / 95450810332358656) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((1620906787880641469 : Rat) / 95450810332358656) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1396991133095807 : Rat) / 5113436267804928) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((105715467764947237 : Rat) / 13635830047479808) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((104007624103909 : Rat) / 121748482566784) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1620906787880641469 : Rat) / 190901620664717312) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7416331488360494857 : Rat) / 190901620664717312) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((183099752496479997 : Rat) / 95450810332358656) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((1620906787880641469 : Rat) / 95450810332358656) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7416331488360494857 : Rat) / 95450810332358656) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-122967414860228747 : Rat) / 15478509783625728) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-183099752496479997 : Rat) / 23862702583089664) [(9, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-7742499397550353481 : Rat) / 190901620664717312) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1296916796212781321 : Rat) / 95450810332358656) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1396991133095807 : Rat) / 5113436267804928) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((105715467764947237 : Rat) / 13635830047479808) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((104007624103909 : Rat) / 121748482566784) [(9, 1), (13, 3), (16, 1)],
  term ((-447111482668512639503 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-907358272974065289287 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 3), (16, 1)],
  term ((5814353978401980173 : Rat) / 1052941751478831424) [(9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-5814353978401980173 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (12, 2), (16, 1)],
  term ((5814353978401980173 : Rat) / 1052941751478831424) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5814353978401980173 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term ((-255006898652461167 : Rat) / 5965675645772416) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((37052508790115989 : Rat) / 852239377967488) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-221064281913845 : Rat) / 134564112310656) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-37052508790115989 : Rat) / 1704478755934976) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((221064281913845 : Rat) / 269128224621312) [(9, 2), (12, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-221064281913845 : Rat) / 134564112310656) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((37052508790115989 : Rat) / 852239377967488) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-769381358835734257 : Rat) / 11931351291544832) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((221064281913845 : Rat) / 269128224621312) [(9, 2), (13, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (12, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((683208579787935367 : Rat) / 55417986919938496) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-683208579787935367 : Rat) / 110835973839876992) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((683208579787935367 : Rat) / 55417986919938496) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9015867509815616395 : Rat) / 526470875739415712) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (12, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (13, 2), (16, 1)],
  term ((-3086983454325823 : Rat) / 426119688983744) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17805922420307 : Rat) / 30437120641696) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7787729474690171 : Rat) / 11931351291544832) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1892829473632371 : Rat) / 213059844491872) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6317130484575125 : Rat) / 730490895400704) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (12, 1), (14, 3), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3086983454325823 : Rat) / 852239377967488) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((7787729474690171 : Rat) / 23862702583089664) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(10, 1), (12, 2), (16, 1)],
  term ((-6317130484575125 : Rat) / 730490895400704) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1892829473632371 : Rat) / 213059844491872) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7787729474690171 : Rat) / 11931351291544832) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1381239528081409425 : Rat) / 47725405166179328) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1204987912171941 : Rat) / 174180310825472) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(10, 1), (13, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3086983454325823 : Rat) / 852239377967488) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((6118903222396731 : Rat) / 3408957511869952) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(10, 2), (12, 1), (14, 2), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(10, 2), (12, 2), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6118903222396731 : Rat) / 3408957511869952) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(10, 2), (13, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 3), (12, 1), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (12, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (13, 2), (16, 1)],
  term ((24259046380348383 : Rat) / 5965675645772416) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24259046380348383 : Rat) / 5965675645772416) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 500 through 599. -/
theorem rs_R010_ueqv_R010NYY_block_30_0500_0599_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_30_0500_0599
      rs_R010_ueqv_R010NYY_block_30_0500_0599 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
