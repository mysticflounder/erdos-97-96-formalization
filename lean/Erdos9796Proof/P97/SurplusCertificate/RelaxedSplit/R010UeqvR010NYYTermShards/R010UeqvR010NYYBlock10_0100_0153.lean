/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 10:100-153

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_10_0100_0153 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0100 : Poly :=
[
  term ((56076682228120340145 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0100 : Poly :=
[
  term ((-56076682228120340145 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((56076682228120340145 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-56076682228120340145 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((56076682228120340145 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0100_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0100
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0101 : Poly :=
[
  term ((-77546125733351215755 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0101 : Poly :=
[
  term ((77546125733351215755 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77546125733351215755 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((77546125733351215755 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77546125733351215755 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0101_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0101
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0102 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 102 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0102 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0102_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0102
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0103 : Poly :=
[
  term ((-137830605883394360583 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 103 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0103 : Poly :=
[
  term ((137830605883394360583 : Rat) / 33694136047322605568) [(0, 1), (2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-137830605883394360583 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((137830605883394360583 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-137830605883394360583 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0103_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0103
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0104 : Poly :=
[
  term ((-1179409767734894602959 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 104 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0104 : Poly :=
[
  term ((1179409767734894602959 : Rat) / 134776544189290422272) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-1179409767734894602959 : Rat) / 269553088378580844544) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((1179409767734894602959 : Rat) / 134776544189290422272) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-1179409767734894602959 : Rat) / 269553088378580844544) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0104_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0104
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0105 : Poly :=
[
  term ((12776310151009994475 : Rat) / 1203362001690093056) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0105 : Poly :=
[
  term ((-12776310151009994475 : Rat) / 601681000845046528) [(0, 1), (2, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((12776310151009994475 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-12776310151009994475 : Rat) / 601681000845046528) [(1, 1), (3, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((12776310151009994475 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0105_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0105
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0106 : Poly :=
[
  term ((1175618734587767943 : Rat) / 1203362001690093056) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0106 : Poly :=
[
  term ((-1175618734587767943 : Rat) / 601681000845046528) [(0, 1), (2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((1175618734587767943 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 601681000845046528) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((1175618734587767943 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0106_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0106
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0107 : Poly :=
[
  term ((83138926836119409837 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0107 : Poly :=
[
  term ((-83138926836119409837 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((83138926836119409837 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-83138926836119409837 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((83138926836119409837 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0107_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0107
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0108 : Poly :=
[
  term ((-21417006019877675079 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0108 : Poly :=
[
  term ((21417006019877675079 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21417006019877675079 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((21417006019877675079 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21417006019877675079 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0108_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0108
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0109 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 109 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0109 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0109_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0109
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0110 : Poly :=
[
  term ((5186696643685862367 : Rat) / 8423534011830651392) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0110 : Poly :=
[
  term ((-5186696643685862367 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((5186696643685862367 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5186696643685862367 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((5186696643685862367 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0110_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0110
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0111 : Poly :=
[
  term ((39695426072732410569 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 111 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0111 : Poly :=
[
  term ((-39695426072732410569 : Rat) / 33694136047322605568) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((39695426072732410569 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-39695426072732410569 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((39695426072732410569 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0111_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0111
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0112 : Poly :=
[
  term ((5019323732932834287 : Rat) / 4813448006760372224) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0112 : Poly :=
[
  term ((-5019323732932834287 : Rat) / 2406724003380186112) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((5019323732932834287 : Rat) / 4813448006760372224) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-5019323732932834287 : Rat) / 2406724003380186112) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((5019323732932834287 : Rat) / 4813448006760372224) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0112_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0112
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0113 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0113 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0113_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0113
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0114 : Poly :=
[
  term ((-876878097188507633445 : Rat) / 134776544189290422272) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0114 : Poly :=
[
  term ((876878097188507633445 : Rat) / 67388272094645211136) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-876878097188507633445 : Rat) / 134776544189290422272) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((876878097188507633445 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-876878097188507633445 : Rat) / 134776544189290422272) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0114_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0114
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0115 : Poly :=
[
  term ((-1237530431532718364723 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 115 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0115 : Poly :=
[
  term ((1237530431532718364723 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1237530431532718364723 : Rat) / 4211767005915325696) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1237530431532718364723 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1237530431532718364723 : Rat) / 4211767005915325696) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0115_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0115
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0116 : Poly :=
[
  term ((-373060832560145715 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0116 : Poly :=
[
  term ((373060832560145715 : Rat) / 2982837822886208) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-373060832560145715 : Rat) / 5965675645772416) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((373060832560145715 : Rat) / 2982837822886208) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-373060832560145715 : Rat) / 5965675645772416) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0116_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0116
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0117 : Poly :=
[
  term ((1309085505670532258945 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0117 : Poly :=
[
  term ((-1309085505670532258945 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1309085505670532258945 : Rat) / 8423534011830651392) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1309085505670532258945 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1309085505670532258945 : Rat) / 8423534011830651392) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0117_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0117
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0118 : Poly :=
[
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 118 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0118 : Poly :=
[
  term ((-271898372148136966367 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (8, 1), (11, 2), (16, 1)],
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-271898372148136966367 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)],
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(1, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0118_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0118
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0119 : Poly :=
[
  term ((49648418573141559 : Rat) / 1491418911443104) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0119 : Poly :=
[
  term ((-49648418573141559 : Rat) / 745709455721552) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(1, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0119_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0119
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0120 : Poly :=
[
  term ((2992717366447787 : Rat) / 3408957511869952) [(8, 1), (16, 1)]
]

/-- Partial product 120 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0120 : Poly :=
[
  term ((-2992717366447787 : Rat) / 1704478755934976) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((2992717366447787 : Rat) / 3408957511869952) [(0, 2), (8, 1), (16, 1)],
  term ((-2992717366447787 : Rat) / 1704478755934976) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((2992717366447787 : Rat) / 3408957511869952) [(1, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0120_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0120
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0121 : Poly :=
[
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 121 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0121 : Poly :=
[
  term ((-483471987809343275445 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0121_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0121
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0122 : Poly :=
[
  term ((69527544276797127 : Rat) / 2982837822886208) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0122 : Poly :=
[
  term ((-69527544276797127 : Rat) / 1491418911443104) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 2982837822886208) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 2982837822886208) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0122_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0122
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0123 : Poly :=
[
  term ((-19238993851369948251 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0123 : Poly :=
[
  term ((19238993851369948251 : Rat) / 601681000845046528) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19238993851369948251 : Rat) / 1203362001690093056) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19238993851369948251 : Rat) / 601681000845046528) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19238993851369948251 : Rat) / 1203362001690093056) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0123_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0123
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0124 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 124 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0124 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0124_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0124
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0125 : Poly :=
[
  term ((1080289427269892980545 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0125 : Poly :=
[
  term ((-1080289427269892980545 : Rat) / 16847068023661302784) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1080289427269892980545 : Rat) / 33694136047322605568) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1080289427269892980545 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1080289427269892980545 : Rat) / 33694136047322605568) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0125_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0125
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0126 : Poly :=
[
  term ((40864176852752747365771 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 126 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0126 : Poly :=
[
  term ((-40864176852752747365771 : Rat) / 202164816283935633408) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((40864176852752747365771 : Rat) / 404329632567871266816) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-40864176852752747365771 : Rat) / 202164816283935633408) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((40864176852752747365771 : Rat) / 404329632567871266816) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0126_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0126
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0127 : Poly :=
[
  term ((-15712662524220259847 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 127 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0127 : Poly :=
[
  term ((15712662524220259847 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-15712662524220259847 : Rat) / 8423534011830651392) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((15712662524220259847 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-15712662524220259847 : Rat) / 8423534011830651392) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0127_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0127
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0128 : Poly :=
[
  term ((33258853752903365 : Rat) / 5965675645772416) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0128 : Poly :=
[
  term ((-33258853752903365 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((33258853752903365 : Rat) / 5965675645772416) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33258853752903365 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((33258853752903365 : Rat) / 5965675645772416) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0128_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0128
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0129 : Poly :=
[
  term ((-399540155032957 : Rat) / 243496965133568) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 129 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0129 : Poly :=
[
  term ((399540155032957 : Rat) / 121748482566784) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-399540155032957 : Rat) / 243496965133568) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((399540155032957 : Rat) / 121748482566784) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-399540155032957 : Rat) / 243496965133568) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0129_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0129
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0130 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0130 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0130_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0130
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0131 : Poly :=
[
  term ((3884498989690602211 : Rat) / 190901620664717312) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0131 : Poly :=
[
  term ((-3884498989690602211 : Rat) / 95450810332358656) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((3884498989690602211 : Rat) / 190901620664717312) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3884498989690602211 : Rat) / 95450810332358656) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((3884498989690602211 : Rat) / 190901620664717312) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0131_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0131
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0132 : Poly :=
[
  term ((403181853842774263 : Rat) / 47725405166179328) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 132 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0132 : Poly :=
[
  term ((-403181853842774263 : Rat) / 23862702583089664) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((403181853842774263 : Rat) / 47725405166179328) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-403181853842774263 : Rat) / 23862702583089664) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((403181853842774263 : Rat) / 47725405166179328) [(1, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0132_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0132
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0133 : Poly :=
[
  term ((-40176474025583424525 : Rat) / 601681000845046528) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0133 : Poly :=
[
  term ((40176474025583424525 : Rat) / 300840500422523264) [(0, 1), (2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-40176474025583424525 : Rat) / 601681000845046528) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((40176474025583424525 : Rat) / 300840500422523264) [(1, 1), (3, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-40176474025583424525 : Rat) / 601681000845046528) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0133_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0133
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0134 : Poly :=
[
  term ((-23236392228781629 : Rat) / 852239377967488) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0134 : Poly :=
[
  term ((23236392228781629 : Rat) / 426119688983744) [(0, 1), (2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23236392228781629 : Rat) / 852239377967488) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23236392228781629 : Rat) / 426119688983744) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23236392228781629 : Rat) / 852239377967488) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0134_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0134
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0135 : Poly :=
[
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 135 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0135 : Poly :=
[
  term ((3297501003327384801 : Rat) / 300840500422523264) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0135_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0135
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0136 : Poly :=
[
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0136 : Poly :=
[
  term ((454519041116426430531 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0136_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0136
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0137 : Poly :=
[
  term ((-802906227816993 : Rat) / 213059844491872) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0137 : Poly :=
[
  term ((802906227816993 : Rat) / 106529922245936) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 213059844491872) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 213059844491872) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0137_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0137
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0138 : Poly :=
[
  term ((-124172785874529501 : Rat) / 5965675645772416) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 138 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0138 : Poly :=
[
  term ((124172785874529501 : Rat) / 2982837822886208) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-124172785874529501 : Rat) / 5965675645772416) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((124172785874529501 : Rat) / 2982837822886208) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-124172785874529501 : Rat) / 5965675645772416) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0138_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0138
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0139 : Poly :=
[
  term ((-17805922420307 : Rat) / 243496965133568) [(10, 1), (16, 1)]
]

/-- Partial product 139 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0139 : Poly :=
[
  term ((17805922420307 : Rat) / 121748482566784) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 243496965133568) [(0, 2), (10, 1), (16, 1)],
  term ((17805922420307 : Rat) / 121748482566784) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 243496965133568) [(1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0139_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0139
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0140 : Poly :=
[
  term ((96659410250578601 : Rat) / 11931351291544832) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 140 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0140 : Poly :=
[
  term ((-96659410250578601 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((96659410250578601 : Rat) / 11931351291544832) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((96659410250578601 : Rat) / 11931351291544832) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0140_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0140
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0141 : Poly :=
[
  term ((421791696945637791 : Rat) / 65046594685950976) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 141 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0141 : Poly :=
[
  term ((-421791696945637791 : Rat) / 32523297342975488) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((421791696945637791 : Rat) / 65046594685950976) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-421791696945637791 : Rat) / 32523297342975488) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((421791696945637791 : Rat) / 65046594685950976) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0141_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0141
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0142 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0142 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0142_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0142
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0143 : Poly :=
[
  term ((-3134903477673726393569 : Rat) / 606494448851806900224) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0143 : Poly :=
[
  term ((3134903477673726393569 : Rat) / 303247224425903450112) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3134903477673726393569 : Rat) / 606494448851806900224) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((3134903477673726393569 : Rat) / 303247224425903450112) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3134903477673726393569 : Rat) / 606494448851806900224) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0143_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0143
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0144 : Poly :=
[
  term ((-29099288345286953 : Rat) / 5965675645772416) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 144 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0144 : Poly :=
[
  term ((29099288345286953 : Rat) / 2982837822886208) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-29099288345286953 : Rat) / 5965675645772416) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((29099288345286953 : Rat) / 2982837822886208) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-29099288345286953 : Rat) / 5965675645772416) [(1, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0144_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0144
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0145 : Poly :=
[
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0145 : Poly :=
[
  term ((-308307006418498407505 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(0, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-308307006418498407505 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0145_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0145
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0146 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 146 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0146 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (2, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(1, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0146_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0146
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0147 : Poly :=
[
  term ((-137235185884509587845 : Rat) / 4211767005915325696) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 147 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0147 : Poly :=
[
  term ((137235185884509587845 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-137235185884509587845 : Rat) / 4211767005915325696) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((137235185884509587845 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-137235185884509587845 : Rat) / 4211767005915325696) [(1, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0147_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0147
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0148 : Poly :=
[
  term ((-587777155863526864997 : Rat) / 101082408141967816704) [(11, 2), (16, 1)]
]

/-- Partial product 148 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0148 : Poly :=
[
  term ((587777155863526864997 : Rat) / 50541204070983908352) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-587777155863526864997 : Rat) / 101082408141967816704) [(0, 2), (11, 2), (16, 1)],
  term ((587777155863526864997 : Rat) / 50541204070983908352) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-587777155863526864997 : Rat) / 101082408141967816704) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0148_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0148
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0149 : Poly :=
[
  term ((-60650611660908343 : Rat) / 61361235213659136) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0149 : Poly :=
[
  term ((60650611660908343 : Rat) / 30680617606829568) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60650611660908343 : Rat) / 61361235213659136) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((60650611660908343 : Rat) / 30680617606829568) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60650611660908343 : Rat) / 61361235213659136) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0149_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0149
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0150 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 150 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0150 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0150_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0150
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0151 : Poly :=
[
  term ((-13309184894211347 : Rat) / 2556718133902464) [(14, 1), (16, 1)]
]

/-- Partial product 151 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0151 : Poly :=
[
  term ((13309184894211347 : Rat) / 1278359066951232) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-13309184894211347 : Rat) / 2556718133902464) [(0, 2), (14, 1), (16, 1)],
  term ((13309184894211347 : Rat) / 1278359066951232) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-13309184894211347 : Rat) / 2556718133902464) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0151_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0151
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0152 : Poly :=
[
  term ((5306393989234567609 : Rat) / 859057292991227904) [(15, 2), (16, 1)]
]

/-- Partial product 152 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0152 : Poly :=
[
  term ((-5306393989234567609 : Rat) / 429528646495613952) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((5306393989234567609 : Rat) / 859057292991227904) [(0, 2), (15, 2), (16, 1)],
  term ((-5306393989234567609 : Rat) / 429528646495613952) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((5306393989234567609 : Rat) / 859057292991227904) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0152_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0152
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010NYY_coefficient_10_0153 : Poly :=
[
  term ((248512723346296319 : Rat) / 122722470427318272) [(16, 1)]
]

/-- Partial product 153 for generator 10. -/
def rs_R010_ueqv_R010NYY_partial_10_0153 : Poly :=
[
  term ((-248512723346296319 : Rat) / 61361235213659136) [(0, 1), (2, 1), (16, 1)],
  term ((248512723346296319 : Rat) / 122722470427318272) [(0, 2), (16, 1)],
  term ((-248512723346296319 : Rat) / 61361235213659136) [(1, 1), (3, 1), (16, 1)],
  term ((248512723346296319 : Rat) / 122722470427318272) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 10. -/
theorem rs_R010_ueqv_R010NYY_partial_10_0153_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_10_0153
        rs_R010_ueqv_R010NYY_generator_10_0100_0153 =
      rs_R010_ueqv_R010NYY_partial_10_0153 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_10_0100_0153 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_10_0100,
  rs_R010_ueqv_R010NYY_partial_10_0101,
  rs_R010_ueqv_R010NYY_partial_10_0102,
  rs_R010_ueqv_R010NYY_partial_10_0103,
  rs_R010_ueqv_R010NYY_partial_10_0104,
  rs_R010_ueqv_R010NYY_partial_10_0105,
  rs_R010_ueqv_R010NYY_partial_10_0106,
  rs_R010_ueqv_R010NYY_partial_10_0107,
  rs_R010_ueqv_R010NYY_partial_10_0108,
  rs_R010_ueqv_R010NYY_partial_10_0109,
  rs_R010_ueqv_R010NYY_partial_10_0110,
  rs_R010_ueqv_R010NYY_partial_10_0111,
  rs_R010_ueqv_R010NYY_partial_10_0112,
  rs_R010_ueqv_R010NYY_partial_10_0113,
  rs_R010_ueqv_R010NYY_partial_10_0114,
  rs_R010_ueqv_R010NYY_partial_10_0115,
  rs_R010_ueqv_R010NYY_partial_10_0116,
  rs_R010_ueqv_R010NYY_partial_10_0117,
  rs_R010_ueqv_R010NYY_partial_10_0118,
  rs_R010_ueqv_R010NYY_partial_10_0119,
  rs_R010_ueqv_R010NYY_partial_10_0120,
  rs_R010_ueqv_R010NYY_partial_10_0121,
  rs_R010_ueqv_R010NYY_partial_10_0122,
  rs_R010_ueqv_R010NYY_partial_10_0123,
  rs_R010_ueqv_R010NYY_partial_10_0124,
  rs_R010_ueqv_R010NYY_partial_10_0125,
  rs_R010_ueqv_R010NYY_partial_10_0126,
  rs_R010_ueqv_R010NYY_partial_10_0127,
  rs_R010_ueqv_R010NYY_partial_10_0128,
  rs_R010_ueqv_R010NYY_partial_10_0129,
  rs_R010_ueqv_R010NYY_partial_10_0130,
  rs_R010_ueqv_R010NYY_partial_10_0131,
  rs_R010_ueqv_R010NYY_partial_10_0132,
  rs_R010_ueqv_R010NYY_partial_10_0133,
  rs_R010_ueqv_R010NYY_partial_10_0134,
  rs_R010_ueqv_R010NYY_partial_10_0135,
  rs_R010_ueqv_R010NYY_partial_10_0136,
  rs_R010_ueqv_R010NYY_partial_10_0137,
  rs_R010_ueqv_R010NYY_partial_10_0138,
  rs_R010_ueqv_R010NYY_partial_10_0139,
  rs_R010_ueqv_R010NYY_partial_10_0140,
  rs_R010_ueqv_R010NYY_partial_10_0141,
  rs_R010_ueqv_R010NYY_partial_10_0142,
  rs_R010_ueqv_R010NYY_partial_10_0143,
  rs_R010_ueqv_R010NYY_partial_10_0144,
  rs_R010_ueqv_R010NYY_partial_10_0145,
  rs_R010_ueqv_R010NYY_partial_10_0146,
  rs_R010_ueqv_R010NYY_partial_10_0147,
  rs_R010_ueqv_R010NYY_partial_10_0148,
  rs_R010_ueqv_R010NYY_partial_10_0149,
  rs_R010_ueqv_R010NYY_partial_10_0150,
  rs_R010_ueqv_R010NYY_partial_10_0151,
  rs_R010_ueqv_R010NYY_partial_10_0152,
  rs_R010_ueqv_R010NYY_partial_10_0153
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_10_0100_0153 : Poly :=
[
  term ((-56076682228120340145 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((77546125733351215755 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((137830605883394360583 : Rat) / 33694136047322605568) [(0, 1), (2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1179409767734894602959 : Rat) / 134776544189290422272) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-12776310151009994475 : Rat) / 601681000845046528) [(0, 1), (2, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 601681000845046528) [(0, 1), (2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-83138926836119409837 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((21417006019877675079 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5186696643685862367 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39695426072732410569 : Rat) / 33694136047322605568) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-5019323732932834287 : Rat) / 2406724003380186112) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((876878097188507633445 : Rat) / 67388272094645211136) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((1237530431532718364723 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((373060832560145715 : Rat) / 2982837822886208) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1309085505670532258945 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-271898372148136966367 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (8, 1), (11, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2992717366447787 : Rat) / 1704478755934976) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 1491418911443104) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19238993851369948251 : Rat) / 601681000845046528) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1080289427269892980545 : Rat) / 16847068023661302784) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-40864176852752747365771 : Rat) / 202164816283935633408) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((15712662524220259847 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-33258853752903365 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((399540155032957 : Rat) / 121748482566784) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3884498989690602211 : Rat) / 95450810332358656) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-403181853842774263 : Rat) / 23862702583089664) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((40176474025583424525 : Rat) / 300840500422523264) [(0, 1), (2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((23236392228781629 : Rat) / 426119688983744) [(0, 1), (2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((124172785874529501 : Rat) / 2982837822886208) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((17805922420307 : Rat) / 121748482566784) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-96659410250578601 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-421791696945637791 : Rat) / 32523297342975488) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3134903477673726393569 : Rat) / 303247224425903450112) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((29099288345286953 : Rat) / 2982837822886208) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-308307006418498407505 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (2, 1), (11, 2), (14, 1), (16, 1)],
  term ((137235185884509587845 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((587777155863526864997 : Rat) / 50541204070983908352) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((60650611660908343 : Rat) / 30680617606829568) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((13309184894211347 : Rat) / 1278359066951232) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-5306393989234567609 : Rat) / 429528646495613952) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-248512723346296319 : Rat) / 61361235213659136) [(0, 1), (2, 1), (16, 1)],
  term ((56076682228120340145 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-77546125733351215755 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-137830605883394360583 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1179409767734894602959 : Rat) / 269553088378580844544) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((12776310151009994475 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((1175618734587767943 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((83138926836119409837 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21417006019877675079 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((5186696643685862367 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((39695426072732410569 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((5019323732932834287 : Rat) / 4813448006760372224) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-876878097188507633445 : Rat) / 134776544189290422272) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1237530431532718364723 : Rat) / 4211767005915325696) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-373060832560145715 : Rat) / 5965675645772416) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1309085505670532258945 : Rat) / 8423534011830651392) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((2992717366447787 : Rat) / 3408957511869952) [(0, 2), (8, 1), (16, 1)],
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 2982837822886208) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19238993851369948251 : Rat) / 1203362001690093056) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1080289427269892980545 : Rat) / 33694136047322605568) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((40864176852752747365771 : Rat) / 404329632567871266816) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-15712662524220259847 : Rat) / 8423534011830651392) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((33258853752903365 : Rat) / 5965675645772416) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-399540155032957 : Rat) / 243496965133568) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3884498989690602211 : Rat) / 190901620664717312) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((403181853842774263 : Rat) / 47725405166179328) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-40176474025583424525 : Rat) / 601681000845046528) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-23236392228781629 : Rat) / 852239377967488) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 213059844491872) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124172785874529501 : Rat) / 5965675645772416) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 243496965133568) [(0, 2), (10, 1), (16, 1)],
  term ((96659410250578601 : Rat) / 11931351291544832) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((421791696945637791 : Rat) / 65046594685950976) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3134903477673726393569 : Rat) / 606494448851806900224) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-29099288345286953 : Rat) / 5965675645772416) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(0, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-137235185884509587845 : Rat) / 4211767005915325696) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((-587777155863526864997 : Rat) / 101082408141967816704) [(0, 2), (11, 2), (16, 1)],
  term ((-60650611660908343 : Rat) / 61361235213659136) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-13309184894211347 : Rat) / 2556718133902464) [(0, 2), (14, 1), (16, 1)],
  term ((5306393989234567609 : Rat) / 859057292991227904) [(0, 2), (15, 2), (16, 1)],
  term ((248512723346296319 : Rat) / 122722470427318272) [(0, 2), (16, 1)],
  term ((-56076682228120340145 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((77546125733351215755 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((137830605883394360583 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1179409767734894602959 : Rat) / 134776544189290422272) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-12776310151009994475 : Rat) / 601681000845046528) [(1, 1), (3, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 601681000845046528) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-83138926836119409837 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((21417006019877675079 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5186696643685862367 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39695426072732410569 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-5019323732932834287 : Rat) / 2406724003380186112) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((876878097188507633445 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((1237530431532718364723 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((373060832560145715 : Rat) / 2982837822886208) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1309085505670532258945 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-271898372148136966367 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2992717366447787 : Rat) / 1704478755934976) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19238993851369948251 : Rat) / 601681000845046528) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1080289427269892980545 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-40864176852752747365771 : Rat) / 202164816283935633408) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((15712662524220259847 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-33258853752903365 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((399540155032957 : Rat) / 121748482566784) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3884498989690602211 : Rat) / 95450810332358656) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-403181853842774263 : Rat) / 23862702583089664) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((40176474025583424525 : Rat) / 300840500422523264) [(1, 1), (3, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((23236392228781629 : Rat) / 426119688983744) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((124172785874529501 : Rat) / 2982837822886208) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((17805922420307 : Rat) / 121748482566784) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-96659410250578601 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-421791696945637791 : Rat) / 32523297342975488) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3134903477673726393569 : Rat) / 303247224425903450112) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((29099288345286953 : Rat) / 2982837822886208) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-308307006418498407505 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((137235185884509587845 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((587777155863526864997 : Rat) / 50541204070983908352) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((60650611660908343 : Rat) / 30680617606829568) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((13309184894211347 : Rat) / 1278359066951232) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-5306393989234567609 : Rat) / 429528646495613952) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-248512723346296319 : Rat) / 61361235213659136) [(1, 1), (3, 1), (16, 1)],
  term ((56076682228120340145 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-77546125733351215755 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-137830605883394360583 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1179409767734894602959 : Rat) / 269553088378580844544) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((12776310151009994475 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((1175618734587767943 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((83138926836119409837 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21417006019877675079 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((5186696643685862367 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((39695426072732410569 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((5019323732932834287 : Rat) / 4813448006760372224) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-876878097188507633445 : Rat) / 134776544189290422272) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1237530431532718364723 : Rat) / 4211767005915325696) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-373060832560145715 : Rat) / 5965675645772416) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1309085505670532258945 : Rat) / 8423534011830651392) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((2992717366447787 : Rat) / 3408957511869952) [(1, 2), (8, 1), (16, 1)],
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 2982837822886208) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19238993851369948251 : Rat) / 1203362001690093056) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1080289427269892980545 : Rat) / 33694136047322605568) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((40864176852752747365771 : Rat) / 404329632567871266816) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-15712662524220259847 : Rat) / 8423534011830651392) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((33258853752903365 : Rat) / 5965675645772416) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-399540155032957 : Rat) / 243496965133568) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3884498989690602211 : Rat) / 190901620664717312) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((403181853842774263 : Rat) / 47725405166179328) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-40176474025583424525 : Rat) / 601681000845046528) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-23236392228781629 : Rat) / 852239377967488) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 213059844491872) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124172785874529501 : Rat) / 5965675645772416) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 243496965133568) [(1, 2), (10, 1), (16, 1)],
  term ((96659410250578601 : Rat) / 11931351291544832) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((421791696945637791 : Rat) / 65046594685950976) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3134903477673726393569 : Rat) / 606494448851806900224) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-29099288345286953 : Rat) / 5965675645772416) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-137235185884509587845 : Rat) / 4211767005915325696) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-587777155863526864997 : Rat) / 101082408141967816704) [(1, 2), (11, 2), (16, 1)],
  term ((-60650611660908343 : Rat) / 61361235213659136) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-13309184894211347 : Rat) / 2556718133902464) [(1, 2), (14, 1), (16, 1)],
  term ((5306393989234567609 : Rat) / 859057292991227904) [(1, 2), (15, 2), (16, 1)],
  term ((248512723346296319 : Rat) / 122722470427318272) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 100 through 153. -/
theorem rs_R010_ueqv_R010NYY_block_10_0100_0153_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_10_0100_0153
      rs_R010_ueqv_R010NYY_block_10_0100_0153 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
