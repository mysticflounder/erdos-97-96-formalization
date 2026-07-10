/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 9:100-176

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_09_0100_0176 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0100 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0100 : Poly :=
[
  term ((-333796423576923 : Rat) / 426119688983744) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0100_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0100
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0101 : Poly :=
[
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 101 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0101 : Poly :=
[
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0101_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0101
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0102 : Poly :=
[
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0102 : Poly :=
[
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0102_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0102
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0103 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 103 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0103 : Poly :=
[
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0103_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0103
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0104 : Poly :=
[
  term ((-185316212865294973281 : Rat) / 4813448006760372224) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0104 : Poly :=
[
  term ((-185316212865294973281 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((185316212865294973281 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-185316212865294973281 : Rat) / 2406724003380186112) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((185316212865294973281 : Rat) / 4813448006760372224) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((185316212865294973281 : Rat) / 4813448006760372224) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-185316212865294973281 : Rat) / 4813448006760372224) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0104_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0104
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0105 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 105 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0105 : Poly :=
[
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0105_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0105
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0106 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0106 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0106_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0106
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0107 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0107 : Poly :=
[
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0107_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0107
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0108 : Poly :=
[
  term ((11215336445624068029 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 108 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0108 : Poly :=
[
  term ((11215336445624068029 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-11215336445624068029 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((11215336445624068029 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0108_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0108
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0109 : Poly :=
[
  term ((-68325355880159966655 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0109 : Poly :=
[
  term ((-68325355880159966655 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((68325355880159966655 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0109_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0109
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0110 : Poly :=
[
  term ((28555009717267949313 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0110 : Poly :=
[
  term ((28555009717267949313 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28555009717267949313 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((28555009717267949313 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28555009717267949313 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28555009717267949313 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((28555009717267949313 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0110_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0110
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0111 : Poly :=
[
  term ((-33646009336872204087 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0111 : Poly :=
[
  term ((-33646009336872204087 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((33646009336872204087 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0111_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0111
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0112 : Poly :=
[
  term ((1498396661370411861999 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0112 : Poly :=
[
  term ((1498396661370411861999 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1498396661370411861999 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1498396661370411861999 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1498396661370411861999 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1498396661370411861999 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1498396661370411861999 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0112_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0112
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0113 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 113 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0113 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0113_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0113
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0114 : Poly :=
[
  term ((5277992815297258827 : Rat) / 455326162801656832) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0114 : Poly :=
[
  term ((5277992815297258827 : Rat) / 227663081400828416) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5277992815297258827 : Rat) / 227663081400828416) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5277992815297258827 : Rat) / 227663081400828416) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5277992815297258827 : Rat) / 455326162801656832) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5277992815297258827 : Rat) / 455326162801656832) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5277992815297258827 : Rat) / 455326162801656832) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0114_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0114
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0115 : Poly :=
[
  term ((-5277992815297258827 : Rat) / 227663081400828416) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 115 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0115 : Poly :=
[
  term ((-5277992815297258827 : Rat) / 113831540700414208) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((5277992815297258827 : Rat) / 113831540700414208) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5277992815297258827 : Rat) / 113831540700414208) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5277992815297258827 : Rat) / 227663081400828416) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((5277992815297258827 : Rat) / 227663081400828416) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5277992815297258827 : Rat) / 227663081400828416) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0115_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0115
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0116 : Poly :=
[
  term ((460599445431435387999 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 116 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0116 : Poly :=
[
  term ((460599445431435387999 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-460599445431435387999 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((460599445431435387999 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-460599445431435387999 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-460599445431435387999 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((460599445431435387999 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0116_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0116
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0117 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 117 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0117 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0117_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0117
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0118 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 118 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0118 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(1, 1), (5, 1), (9, 2), (13, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0118_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0118
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0119 : Poly :=
[
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0119 : Poly :=
[
  term ((12853999827937751211 : Rat) / 263235437869707856) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 263235437869707856) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 263235437869707856) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0119_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0119
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0120 : Poly :=
[
  term ((-3581463029851285581 : Rat) / 16847068023661302784) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 120 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0120 : Poly :=
[
  term ((-3581463029851285581 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3581463029851285581 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3581463029851285581 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((3581463029851285581 : Rat) / 16847068023661302784) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3581463029851285581 : Rat) / 16847068023661302784) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((3581463029851285581 : Rat) / 16847068023661302784) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0120_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0120
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0121 : Poly :=
[
  term ((24588413136768094185 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0121 : Poly :=
[
  term ((24588413136768094185 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24588413136768094185 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((24588413136768094185 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24588413136768094185 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24588413136768094185 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((24588413136768094185 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0121_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0121
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0122 : Poly :=
[
  term ((1416352153783970493 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0122 : Poly :=
[
  term ((1416352153783970493 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1416352153783970493 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1416352153783970493 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1416352153783970493 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1416352153783970493 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1416352153783970493 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0122_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0122
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0123 : Poly :=
[
  term ((-904445781530739414447 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0123 : Poly :=
[
  term ((-904445781530739414447 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((904445781530739414447 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-904445781530739414447 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((904445781530739414447 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((904445781530739414447 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-904445781530739414447 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0123_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0123
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0124 : Poly :=
[
  term ((-7749354200420478363 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 124 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0124 : Poly :=
[
  term ((-7749354200420478363 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((7749354200420478363 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-7749354200420478363 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((7749354200420478363 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((7749354200420478363 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7749354200420478363 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0124_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0124
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0125 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0125 : Poly :=
[
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0125_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0125
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0126 : Poly :=
[
  term ((51321474185104460545 : Rat) / 8423534011830651392) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 126 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0126 : Poly :=
[
  term ((51321474185104460545 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-51321474185104460545 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((51321474185104460545 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-51321474185104460545 : Rat) / 8423534011830651392) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((51321474185104460545 : Rat) / 8423534011830651392) [(5, 1), (13, 1), (16, 1)],
  term ((-51321474185104460545 : Rat) / 8423534011830651392) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0126_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0126
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0127 : Poly :=
[
  term ((-205231466045820821041 : Rat) / 16847068023661302784) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0127 : Poly :=
[
  term ((-205231466045820821041 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((205231466045820821041 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-205231466045820821041 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((205231466045820821041 : Rat) / 16847068023661302784) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((205231466045820821041 : Rat) / 16847068023661302784) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-205231466045820821041 : Rat) / 16847068023661302784) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0127_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0127
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0128 : Poly :=
[
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 128 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0128 : Poly :=
[
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0128_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0128
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0129 : Poly :=
[
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0129 : Poly :=
[
  term ((-711968041840092767 : Rat) / 23862702583089664) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 23862702583089664) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0129_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0129
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0130 : Poly :=
[
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0130 : Poly :=
[
  term ((28288027507455275093431 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 151623612212951725056) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0130_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0130
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0131 : Poly :=
[
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 131 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0131 : Poly :=
[
  term ((711968041840092767 : Rat) / 23862702583089664) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((711968041840092767 : Rat) / 23862702583089664) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0131_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0131
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0132 : Poly :=
[
  term ((50588546304313719590377 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0132 : Poly :=
[
  term ((50588546304313719590377 : Rat) / 75811806106475862528) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50588546304313719590377 : Rat) / 75811806106475862528) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((50588546304313719590377 : Rat) / 75811806106475862528) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50588546304313719590377 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50588546304313719590377 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((50588546304313719590377 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0132_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0132
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0133 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 133 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0133 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0133_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0133
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0134 : Poly :=
[
  term ((273677226018603023 : Rat) / 3408957511869952) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 134 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0134 : Poly :=
[
  term ((273677226018603023 : Rat) / 1704478755934976) [(0, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-273677226018603023 : Rat) / 1704478755934976) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((273677226018603023 : Rat) / 1704478755934976) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-273677226018603023 : Rat) / 3408957511869952) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-273677226018603023 : Rat) / 3408957511869952) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((273677226018603023 : Rat) / 3408957511869952) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0134_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0134
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0135 : Poly :=
[
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 135 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0135 : Poly :=
[
  term ((3728508138334321 : Rat) / 319589766737808) [(0, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 319589766737808) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 319589766737808) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0135_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0135
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0136 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 136 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0136 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0136_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0136
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0137 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0137 : Poly :=
[
  term ((-70302592550481639 : Rat) / 1491418911443104) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 1491418911443104) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 1491418911443104) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0137_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0137
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0138 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 138 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0138 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 75811806106475862528) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 75811806106475862528) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 75811806106475862528) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0138_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0138
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0139 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0139 : Poly :=
[
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0139_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0139
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0140 : Poly :=
[
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0140 : Poly :=
[
  term ((-3728508138334321 : Rat) / 319589766737808) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 319589766737808) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 319589766737808) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0140_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0140
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0141 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 141 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0141 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 11931351291544832) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 11931351291544832) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 11931351291544832) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0141_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0141
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0142 : Poly :=
[
  term ((-1104993165499089067 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 142 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0142 : Poly :=
[
  term ((-1104993165499089067 : Rat) / 1052941751478831424) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 1052941751478831424) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1104993165499089067 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0142_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0142
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0143 : Poly :=
[
  term ((-13825011908841381 : Rat) / 2982837822886208) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0143 : Poly :=
[
  term ((-13825011908841381 : Rat) / 1491418911443104) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 1491418911443104) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 1491418911443104) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 2982837822886208) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 2982837822886208) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 2982837822886208) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0143_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0143
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0144 : Poly :=
[
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0144 : Poly :=
[
  term ((423685498714386141241 : Rat) / 2105883502957662848) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 2105883502957662848) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0144_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0144
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0145 : Poly :=
[
  term ((-211290252774443526087 : Rat) / 1052941751478831424) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0145 : Poly :=
[
  term ((-211290252774443526087 : Rat) / 526470875739415712) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((211290252774443526087 : Rat) / 526470875739415712) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211290252774443526087 : Rat) / 526470875739415712) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((211290252774443526087 : Rat) / 1052941751478831424) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((211290252774443526087 : Rat) / 1052941751478831424) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-211290252774443526087 : Rat) / 1052941751478831424) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0145_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0145
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0146 : Poly :=
[
  term ((137004120164657951 : Rat) / 5965675645772416) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0146 : Poly :=
[
  term ((137004120164657951 : Rat) / 2982837822886208) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 2982837822886208) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 2982837822886208) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0146_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0146
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0147 : Poly :=
[
  term ((-449558789254805 : Rat) / 10886269426592) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 147 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0147 : Poly :=
[
  term ((-449558789254805 : Rat) / 5443134713296) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((449558789254805 : Rat) / 5443134713296) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-449558789254805 : Rat) / 5443134713296) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((449558789254805 : Rat) / 10886269426592) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((449558789254805 : Rat) / 10886269426592) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-449558789254805 : Rat) / 10886269426592) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0147_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0147
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0148 : Poly :=
[
  term ((78753047889291123627 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0148 : Poly :=
[
  term ((78753047889291123627 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78753047889291123627 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((78753047889291123627 : Rat) / 4211767005915325696) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78753047889291123627 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((78753047889291123627 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78753047889291123627 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0148_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0148
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0149 : Poly :=
[
  term ((-99535346759191807129 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0149 : Poly :=
[
  term ((-99535346759191807129 : Rat) / 601681000845046528) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((99535346759191807129 : Rat) / 601681000845046528) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-99535346759191807129 : Rat) / 601681000845046528) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((99535346759191807129 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((99535346759191807129 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-99535346759191807129 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0149_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0149
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0150 : Poly :=
[
  term ((-10873660960049902938779 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 150 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0150 : Poly :=
[
  term ((-10873660960049902938779 : Rat) / 50541204070983908352) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((10873660960049902938779 : Rat) / 50541204070983908352) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10873660960049902938779 : Rat) / 50541204070983908352) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((10873660960049902938779 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((10873660960049902938779 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-10873660960049902938779 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0150_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0150
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0151 : Poly :=
[
  term ((13502676193222081713 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 151 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0151 : Poly :=
[
  term ((13502676193222081713 : Rat) / 2105883502957662848) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 2105883502957662848) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 2105883502957662848) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0151_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0151
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0152 : Poly :=
[
  term ((-41445420265768652568481 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0152 : Poly :=
[
  term ((-41445420265768652568481 : Rat) / 75811806106475862528) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((41445420265768652568481 : Rat) / 75811806106475862528) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-41445420265768652568481 : Rat) / 75811806106475862528) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((41445420265768652568481 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((41445420265768652568481 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-41445420265768652568481 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0152_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0152
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0153 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (16, 1)]
]

/-- Partial product 153 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0153 : Poly :=
[
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(1, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (12, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (13, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0153_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0153
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0154 : Poly :=
[
  term ((-10483373500691465 : Rat) / 627965857449728) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0154 : Poly :=
[
  term ((-10483373500691465 : Rat) / 313982928724864) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10483373500691465 : Rat) / 313982928724864) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10483373500691465 : Rat) / 313982928724864) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((10483373500691465 : Rat) / 627965857449728) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10483373500691465 : Rat) / 627965857449728) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((10483373500691465 : Rat) / 627965857449728) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0154_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0154
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0155 : Poly :=
[
  term ((-4505778878673406597 : Rat) / 143176215498537984) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0155 : Poly :=
[
  term ((-4505778878673406597 : Rat) / 71588107749268992) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4505778878673406597 : Rat) / 71588107749268992) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4505778878673406597 : Rat) / 71588107749268992) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4505778878673406597 : Rat) / 143176215498537984) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((4505778878673406597 : Rat) / 143176215498537984) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4505778878673406597 : Rat) / 143176215498537984) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0155_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0155
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0156 : Poly :=
[
  term ((10483373500691465 : Rat) / 313982928724864) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 156 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0156 : Poly :=
[
  term ((10483373500691465 : Rat) / 156991464362432) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10483373500691465 : Rat) / 156991464362432) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((10483373500691465 : Rat) / 156991464362432) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10483373500691465 : Rat) / 313982928724864) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-10483373500691465 : Rat) / 313982928724864) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((10483373500691465 : Rat) / 313982928724864) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0156_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0156
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0157 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 157 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0157 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(1, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0157_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0157
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0158 : Poly :=
[
  term ((-20151335617015521323 : Rat) / 150420250211261632) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0158 : Poly :=
[
  term ((-20151335617015521323 : Rat) / 75210125105630816) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20151335617015521323 : Rat) / 75210125105630816) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-20151335617015521323 : Rat) / 75210125105630816) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((20151335617015521323 : Rat) / 150420250211261632) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((20151335617015521323 : Rat) / 150420250211261632) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20151335617015521323 : Rat) / 150420250211261632) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0158_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0158
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0159 : Poly :=
[
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (16, 1)]
]

/-- Partial product 159 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0159 : Poly :=
[
  term ((240937308571641895789 : Rat) / 1579412627218247136) [(0, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(0, 1), (9, 2), (11, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 1579412627218247136) [(1, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0159_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0159
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0160 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0160 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(1, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0160_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0160
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0161 : Poly :=
[
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 161 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0161 : Poly :=
[
  term ((-23088038262747441 : Rat) / 186427363930388) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 186427363930388) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 186427363930388) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0161_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0161
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0162 : Poly :=
[
  term ((-29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 162 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0162 : Poly :=
[
  term ((-29843229626409921277 : Rat) / 4211767005915325696) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 4211767005915325696) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 4211767005915325696) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0162_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0162
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0163 : Poly :=
[
  term ((664798014354914683 : Rat) / 221671947679753984) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0163 : Poly :=
[
  term ((664798014354914683 : Rat) / 110835973839876992) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-664798014354914683 : Rat) / 110835973839876992) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((664798014354914683 : Rat) / 110835973839876992) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-664798014354914683 : Rat) / 221671947679753984) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-664798014354914683 : Rat) / 221671947679753984) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((664798014354914683 : Rat) / 221671947679753984) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0163_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0163
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0164 : Poly :=
[
  term ((-615465265418789 : Rat) / 967406861476608) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0164 : Poly :=
[
  term ((-615465265418789 : Rat) / 483703430738304) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((615465265418789 : Rat) / 483703430738304) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-615465265418789 : Rat) / 483703430738304) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((615465265418789 : Rat) / 967406861476608) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-615465265418789 : Rat) / 967406861476608) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((615465265418789 : Rat) / 967406861476608) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0164_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0164
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0165 : Poly :=
[
  term ((-25882149920427299 : Rat) / 8948513468658624) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 165 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0165 : Poly :=
[
  term ((-25882149920427299 : Rat) / 4474256734329312) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((25882149920427299 : Rat) / 4474256734329312) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-25882149920427299 : Rat) / 4474256734329312) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((25882149920427299 : Rat) / 8948513468658624) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((25882149920427299 : Rat) / 8948513468658624) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-25882149920427299 : Rat) / 8948513468658624) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0165_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0165
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0166 : Poly :=
[
  term ((-8086348793449461 : Rat) / 2982837822886208) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0166 : Poly :=
[
  term ((-8086348793449461 : Rat) / 1491418911443104) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8086348793449461 : Rat) / 1491418911443104) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8086348793449461 : Rat) / 1491418911443104) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((8086348793449461 : Rat) / 2982837822886208) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8086348793449461 : Rat) / 2982837822886208) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8086348793449461 : Rat) / 2982837822886208) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0166_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0166
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0167 : Poly :=
[
  term ((-125246935636332351515 : Rat) / 1579412627218247136) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 167 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0167 : Poly :=
[
  term ((-125246935636332351515 : Rat) / 789706313609123568) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((125246935636332351515 : Rat) / 789706313609123568) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-125246935636332351515 : Rat) / 789706313609123568) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((125246935636332351515 : Rat) / 1579412627218247136) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-125246935636332351515 : Rat) / 1579412627218247136) [(11, 1), (13, 1), (16, 1)],
  term ((125246935636332351515 : Rat) / 1579412627218247136) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0167_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0167
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0168 : Poly :=
[
  term ((666416976405201562229 : Rat) / 3158825254436494272) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0168 : Poly :=
[
  term ((666416976405201562229 : Rat) / 1579412627218247136) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-666416976405201562229 : Rat) / 1579412627218247136) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((666416976405201562229 : Rat) / 1579412627218247136) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-666416976405201562229 : Rat) / 3158825254436494272) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-666416976405201562229 : Rat) / 3158825254436494272) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((666416976405201562229 : Rat) / 3158825254436494272) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0168_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0168
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0169 : Poly :=
[
  term ((1288629051378772361 : Rat) / 23862702583089664) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 169 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0169 : Poly :=
[
  term ((1288629051378772361 : Rat) / 11931351291544832) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1288629051378772361 : Rat) / 11931351291544832) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((1288629051378772361 : Rat) / 11931351291544832) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1288629051378772361 : Rat) / 23862702583089664) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1288629051378772361 : Rat) / 23862702583089664) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((1288629051378772361 : Rat) / 23862702583089664) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0169_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0169
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0170 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 6317650508872988544) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0170 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 3158825254436494272) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 3158825254436494272) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 3158825254436494272) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 6317650508872988544) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 6317650508872988544) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 6317650508872988544) [(11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0170_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0170
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0171 : Poly :=
[
  term ((37337669038798732441633 : Rat) / 151623612212951725056) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 171 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0171 : Poly :=
[
  term ((37337669038798732441633 : Rat) / 75811806106475862528) [(0, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-37337669038798732441633 : Rat) / 75811806106475862528) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((37337669038798732441633 : Rat) / 75811806106475862528) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-37337669038798732441633 : Rat) / 151623612212951725056) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-37337669038798732441633 : Rat) / 151623612212951725056) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((37337669038798732441633 : Rat) / 151623612212951725056) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0171_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0171
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0172 : Poly :=
[
  term ((651491840237955147455 : Rat) / 50541204070983908352) [(11, 2), (16, 1)]
]

/-- Partial product 172 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0172 : Poly :=
[
  term ((651491840237955147455 : Rat) / 25270602035491954176) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-651491840237955147455 : Rat) / 25270602035491954176) [(0, 1), (11, 2), (16, 1)],
  term ((651491840237955147455 : Rat) / 25270602035491954176) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-651491840237955147455 : Rat) / 50541204070983908352) [(11, 2), (12, 2), (16, 1)],
  term ((-651491840237955147455 : Rat) / 50541204070983908352) [(11, 2), (13, 2), (16, 1)],
  term ((651491840237955147455 : Rat) / 50541204070983908352) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0172_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0172
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0173 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0173 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0173_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0173
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0174 : Poly :=
[
  term ((-2979595045926644639 : Rat) / 143176215498537984) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0174 : Poly :=
[
  term ((-2979595045926644639 : Rat) / 71588107749268992) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2979595045926644639 : Rat) / 71588107749268992) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2979595045926644639 : Rat) / 71588107749268992) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((2979595045926644639 : Rat) / 143176215498537984) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2979595045926644639 : Rat) / 143176215498537984) [(13, 1), (15, 1), (16, 1)],
  term ((2979595045926644639 : Rat) / 143176215498537984) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0174_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0174
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0175 : Poly :=
[
  term ((120172672601373517 : Rat) / 2511863429798912) [(15, 2), (16, 1)]
]

/-- Partial product 175 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0175 : Poly :=
[
  term ((120172672601373517 : Rat) / 1255931714899456) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-120172672601373517 : Rat) / 1255931714899456) [(0, 1), (15, 2), (16, 1)],
  term ((120172672601373517 : Rat) / 1255931714899456) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-120172672601373517 : Rat) / 2511863429798912) [(12, 2), (15, 2), (16, 1)],
  term ((-120172672601373517 : Rat) / 2511863429798912) [(13, 2), (15, 2), (16, 1)],
  term ((120172672601373517 : Rat) / 2511863429798912) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0175_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0175
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0176 : Poly :=
[
  term ((-3061504394017 : Rat) / 7609280160424) [(16, 1)]
]

/-- Partial product 176 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0176 : Poly :=
[
  term ((-3061504394017 : Rat) / 3804640080212) [(0, 1), (12, 1), (16, 1)],
  term ((3061504394017 : Rat) / 3804640080212) [(0, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 3804640080212) [(1, 1), (13, 1), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(12, 2), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(13, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0176_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0176
        rs_R010_ueqv_R010NYY_generator_09_0100_0176 =
      rs_R010_ueqv_R010NYY_partial_09_0176 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_09_0100_0176 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_09_0100,
  rs_R010_ueqv_R010NYY_partial_09_0101,
  rs_R010_ueqv_R010NYY_partial_09_0102,
  rs_R010_ueqv_R010NYY_partial_09_0103,
  rs_R010_ueqv_R010NYY_partial_09_0104,
  rs_R010_ueqv_R010NYY_partial_09_0105,
  rs_R010_ueqv_R010NYY_partial_09_0106,
  rs_R010_ueqv_R010NYY_partial_09_0107,
  rs_R010_ueqv_R010NYY_partial_09_0108,
  rs_R010_ueqv_R010NYY_partial_09_0109,
  rs_R010_ueqv_R010NYY_partial_09_0110,
  rs_R010_ueqv_R010NYY_partial_09_0111,
  rs_R010_ueqv_R010NYY_partial_09_0112,
  rs_R010_ueqv_R010NYY_partial_09_0113,
  rs_R010_ueqv_R010NYY_partial_09_0114,
  rs_R010_ueqv_R010NYY_partial_09_0115,
  rs_R010_ueqv_R010NYY_partial_09_0116,
  rs_R010_ueqv_R010NYY_partial_09_0117,
  rs_R010_ueqv_R010NYY_partial_09_0118,
  rs_R010_ueqv_R010NYY_partial_09_0119,
  rs_R010_ueqv_R010NYY_partial_09_0120,
  rs_R010_ueqv_R010NYY_partial_09_0121,
  rs_R010_ueqv_R010NYY_partial_09_0122,
  rs_R010_ueqv_R010NYY_partial_09_0123,
  rs_R010_ueqv_R010NYY_partial_09_0124,
  rs_R010_ueqv_R010NYY_partial_09_0125,
  rs_R010_ueqv_R010NYY_partial_09_0126,
  rs_R010_ueqv_R010NYY_partial_09_0127,
  rs_R010_ueqv_R010NYY_partial_09_0128,
  rs_R010_ueqv_R010NYY_partial_09_0129,
  rs_R010_ueqv_R010NYY_partial_09_0130,
  rs_R010_ueqv_R010NYY_partial_09_0131,
  rs_R010_ueqv_R010NYY_partial_09_0132,
  rs_R010_ueqv_R010NYY_partial_09_0133,
  rs_R010_ueqv_R010NYY_partial_09_0134,
  rs_R010_ueqv_R010NYY_partial_09_0135,
  rs_R010_ueqv_R010NYY_partial_09_0136,
  rs_R010_ueqv_R010NYY_partial_09_0137,
  rs_R010_ueqv_R010NYY_partial_09_0138,
  rs_R010_ueqv_R010NYY_partial_09_0139,
  rs_R010_ueqv_R010NYY_partial_09_0140,
  rs_R010_ueqv_R010NYY_partial_09_0141,
  rs_R010_ueqv_R010NYY_partial_09_0142,
  rs_R010_ueqv_R010NYY_partial_09_0143,
  rs_R010_ueqv_R010NYY_partial_09_0144,
  rs_R010_ueqv_R010NYY_partial_09_0145,
  rs_R010_ueqv_R010NYY_partial_09_0146,
  rs_R010_ueqv_R010NYY_partial_09_0147,
  rs_R010_ueqv_R010NYY_partial_09_0148,
  rs_R010_ueqv_R010NYY_partial_09_0149,
  rs_R010_ueqv_R010NYY_partial_09_0150,
  rs_R010_ueqv_R010NYY_partial_09_0151,
  rs_R010_ueqv_R010NYY_partial_09_0152,
  rs_R010_ueqv_R010NYY_partial_09_0153,
  rs_R010_ueqv_R010NYY_partial_09_0154,
  rs_R010_ueqv_R010NYY_partial_09_0155,
  rs_R010_ueqv_R010NYY_partial_09_0156,
  rs_R010_ueqv_R010NYY_partial_09_0157,
  rs_R010_ueqv_R010NYY_partial_09_0158,
  rs_R010_ueqv_R010NYY_partial_09_0159,
  rs_R010_ueqv_R010NYY_partial_09_0160,
  rs_R010_ueqv_R010NYY_partial_09_0161,
  rs_R010_ueqv_R010NYY_partial_09_0162,
  rs_R010_ueqv_R010NYY_partial_09_0163,
  rs_R010_ueqv_R010NYY_partial_09_0164,
  rs_R010_ueqv_R010NYY_partial_09_0165,
  rs_R010_ueqv_R010NYY_partial_09_0166,
  rs_R010_ueqv_R010NYY_partial_09_0167,
  rs_R010_ueqv_R010NYY_partial_09_0168,
  rs_R010_ueqv_R010NYY_partial_09_0169,
  rs_R010_ueqv_R010NYY_partial_09_0170,
  rs_R010_ueqv_R010NYY_partial_09_0171,
  rs_R010_ueqv_R010NYY_partial_09_0172,
  rs_R010_ueqv_R010NYY_partial_09_0173,
  rs_R010_ueqv_R010NYY_partial_09_0174,
  rs_R010_ueqv_R010NYY_partial_09_0175,
  rs_R010_ueqv_R010NYY_partial_09_0176
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_09_0100_0176 : Poly :=
[
  term ((-333796423576923 : Rat) / 426119688983744) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-185316212865294973281 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((185316212865294973281 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((11215336445624068029 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((28555009717267949313 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-28555009717267949313 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1498396661370411861999 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1498396661370411861999 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((5277992815297258827 : Rat) / 227663081400828416) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5277992815297258827 : Rat) / 113831540700414208) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((460599445431435387999 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-5277992815297258827 : Rat) / 227663081400828416) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5277992815297258827 : Rat) / 113831540700414208) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-460599445431435387999 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 263235437869707856) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 263235437869707856) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3581463029851285581 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((24588413136768094185 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3581463029851285581 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-24588413136768094185 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((1416352153783970493 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-904445781530739414447 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7749354200420478363 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1416352153783970493 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((904445781530739414447 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((7749354200420478363 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((51321474185104460545 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-205231466045820821041 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51321474185104460545 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((205231466045820821041 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 23862702583089664) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 23862702583089664) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((50588546304313719590377 : Rat) / 75811806106475862528) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50588546304313719590377 : Rat) / 75811806106475862528) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((273677226018603023 : Rat) / 1704478755934976) [(0, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 319589766737808) [(0, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-273677226018603023 : Rat) / 1704478755934976) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 319589766737808) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 1491418911443104) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 1491418911443104) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 75811806106475862528) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 75811806106475862528) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 319589766737808) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 11931351291544832) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((3728508138334321 : Rat) / 319589766737808) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 11931351291544832) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1104993165499089067 : Rat) / 1052941751478831424) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 1052941751478831424) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 1491418911443104) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 1491418911443104) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 2105883502957662848) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-211290252774443526087 : Rat) / 526470875739415712) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 2105883502957662848) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((211290252774443526087 : Rat) / 526470875739415712) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 2982837822886208) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-449558789254805 : Rat) / 5443134713296) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 2982837822886208) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((449558789254805 : Rat) / 5443134713296) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((78753047889291123627 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99535346759191807129 : Rat) / 601681000845046528) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10873660960049902938779 : Rat) / 50541204070983908352) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-78753047889291123627 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99535346759191807129 : Rat) / 601681000845046528) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10873660960049902938779 : Rat) / 50541204070983908352) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 2105883502957662848) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-41445420265768652568481 : Rat) / 75811806106475862528) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 2105883502957662848) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((41445420265768652568481 : Rat) / 75811806106475862528) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((-10483373500691465 : Rat) / 313982928724864) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4505778878673406597 : Rat) / 71588107749268992) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10483373500691465 : Rat) / 156991464362432) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((10483373500691465 : Rat) / 313982928724864) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((4505778878673406597 : Rat) / 71588107749268992) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10483373500691465 : Rat) / 156991464362432) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20151335617015521323 : Rat) / 75210125105630816) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((20151335617015521323 : Rat) / 75210125105630816) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 1579412627218247136) [(0, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(0, 1), (9, 2), (11, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 186427363930388) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 186427363930388) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((-29843229626409921277 : Rat) / 4211767005915325696) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((664798014354914683 : Rat) / 110835973839876992) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 4211767005915325696) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-664798014354914683 : Rat) / 110835973839876992) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-615465265418789 : Rat) / 483703430738304) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25882149920427299 : Rat) / 4474256734329312) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((615465265418789 : Rat) / 483703430738304) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((25882149920427299 : Rat) / 4474256734329312) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8086348793449461 : Rat) / 1491418911443104) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-125246935636332351515 : Rat) / 789706313609123568) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((666416976405201562229 : Rat) / 1579412627218247136) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1288629051378772361 : Rat) / 11931351291544832) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((8086348793449461 : Rat) / 1491418911443104) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((125246935636332351515 : Rat) / 789706313609123568) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-666416976405201562229 : Rat) / 1579412627218247136) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1288629051378772361 : Rat) / 11931351291544832) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-70245268919840672953 : Rat) / 3158825254436494272) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37337669038798732441633 : Rat) / 75811806106475862528) [(0, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((651491840237955147455 : Rat) / 25270602035491954176) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 3158825254436494272) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37337669038798732441633 : Rat) / 75811806106475862528) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-651491840237955147455 : Rat) / 25270602035491954176) [(0, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-2979595045926644639 : Rat) / 71588107749268992) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((120172672601373517 : Rat) / 1255931714899456) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 3804640080212) [(0, 1), (12, 1), (16, 1)],
  term ((2979595045926644639 : Rat) / 71588107749268992) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120172672601373517 : Rat) / 1255931714899456) [(0, 1), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 3804640080212) [(0, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-185316212865294973281 : Rat) / 2406724003380186112) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((11215336445624068029 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((28555009717267949313 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((1498396661370411861999 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-5277992815297258827 : Rat) / 113831540700414208) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((460599445431435387999 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((5277992815297258827 : Rat) / 227663081400828416) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 263235437869707856) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(1, 1), (5, 1), (9, 2), (13, 2), (16, 1)],
  term ((24588413136768094185 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3581463029851285581 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-904445781530739414447 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7749354200420478363 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((1416352153783970493 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-205231466045820821041 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((51321474185104460545 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 151623612212951725056) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 23862702583089664) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((50588546304313719590377 : Rat) / 75811806106475862528) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((273677226018603023 : Rat) / 1704478755934976) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 319589766737808) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 1491418911443104) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 75811806106475862528) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 319589766737808) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 11931351291544832) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1104993165499089067 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 1491418911443104) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-211290252774443526087 : Rat) / 526470875739415712) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-449558789254805 : Rat) / 5443134713296) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 2982837822886208) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-99535346759191807129 : Rat) / 601681000845046528) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10873660960049902938779 : Rat) / 50541204070983908352) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((78753047889291123627 : Rat) / 4211767005915325696) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-41445420265768652568481 : Rat) / 75811806106475862528) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 2105883502957662848) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(1, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-4505778878673406597 : Rat) / 71588107749268992) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10483373500691465 : Rat) / 156991464362432) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10483373500691465 : Rat) / 313982928724864) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-20151335617015521323 : Rat) / 75210125105630816) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(1, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 1579412627218247136) [(1, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 186427363930388) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(1, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((664798014354914683 : Rat) / 110835973839876992) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 4211767005915325696) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-25882149920427299 : Rat) / 4474256734329312) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-615465265418789 : Rat) / 483703430738304) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((666416976405201562229 : Rat) / 1579412627218247136) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1288629051378772361 : Rat) / 11931351291544832) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8086348793449461 : Rat) / 1491418911443104) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-125246935636332351515 : Rat) / 789706313609123568) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((37337669038798732441633 : Rat) / 75811806106475862528) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((651491840237955147455 : Rat) / 25270602035491954176) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 3158825254436494272) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((120172672601373517 : Rat) / 1255931714899456) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 3804640080212) [(1, 1), (13, 1), (16, 1)],
  term ((-2979595045926644639 : Rat) / 71588107749268992) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 2), (15, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((185316212865294973281 : Rat) / 4813448006760372224) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((185316212865294973281 : Rat) / 4813448006760372224) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-185316212865294973281 : Rat) / 4813448006760372224) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-11215336445624068029 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-11215336445624068029 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((11215336445624068029 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-28555009717267949313 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-28555009717267949313 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 3), (16, 1)],
  term ((28555009717267949313 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1498396661370411861999 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1498396661370411861999 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((1498396661370411861999 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-5277992815297258827 : Rat) / 455326162801656832) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5277992815297258827 : Rat) / 227663081400828416) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-460599445431435387999 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((5277992815297258827 : Rat) / 455326162801656832) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5277992815297258827 : Rat) / 227663081400828416) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-460599445431435387999 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-5277992815297258827 : Rat) / 455326162801656832) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5277992815297258827 : Rat) / 227663081400828416) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((460599445431435387999 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 3), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((3581463029851285581 : Rat) / 16847068023661302784) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-24588413136768094185 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3581463029851285581 : Rat) / 16847068023661302784) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-24588413136768094185 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3581463029851285581 : Rat) / 16847068023661302784) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((24588413136768094185 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1416352153783970493 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((904445781530739414447 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((7749354200420478363 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((1416352153783970493 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((904445781530739414447 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((7749354200420478363 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1416352153783970493 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-904445781530739414447 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7749354200420478363 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-51321474185104460545 : Rat) / 8423534011830651392) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((205231466045820821041 : Rat) / 16847068023661302784) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((51321474185104460545 : Rat) / 8423534011830651392) [(5, 1), (13, 1), (16, 1)],
  term ((205231466045820821041 : Rat) / 16847068023661302784) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51321474185104460545 : Rat) / 8423534011830651392) [(5, 1), (13, 3), (16, 1)],
  term ((-205231466045820821041 : Rat) / 16847068023661302784) [(5, 1), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (15, 2), (16, 1)],
  term ((-50588546304313719590377 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50588546304313719590377 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((50588546304313719590377 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-273677226018603023 : Rat) / 3408957511869952) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-273677226018603023 : Rat) / 3408957511869952) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((273677226018603023 : Rat) / 3408957511869952) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (15, 3), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1104993165499089067 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 2982837822886208) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 2982837822886208) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 2982837822886208) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((211290252774443526087 : Rat) / 1052941751478831424) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((211290252774443526087 : Rat) / 1052941751478831424) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-211290252774443526087 : Rat) / 1052941751478831424) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((449558789254805 : Rat) / 10886269426592) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((449558789254805 : Rat) / 10886269426592) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-449558789254805 : Rat) / 10886269426592) [(8, 1), (15, 2), (16, 1)],
  term ((-78753047889291123627 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((99535346759191807129 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((10873660960049902938779 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((78753047889291123627 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99535346759191807129 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((10873660960049902938779 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-78753047889291123627 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-99535346759191807129 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10873660960049902938779 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((41445420265768652568481 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((41445420265768652568481 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 3), (16, 1)],
  term ((-41445420265768652568481 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (12, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (13, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (16, 1)],
  term ((10483373500691465 : Rat) / 627965857449728) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((4505778878673406597 : Rat) / 143176215498537984) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10483373500691465 : Rat) / 313982928724864) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-10483373500691465 : Rat) / 627965857449728) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((4505778878673406597 : Rat) / 143176215498537984) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10483373500691465 : Rat) / 313982928724864) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((10483373500691465 : Rat) / 627965857449728) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4505778878673406597 : Rat) / 143176215498537984) [(9, 1), (15, 1), (16, 1)],
  term ((10483373500691465 : Rat) / 313982928724864) [(9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((20151335617015521323 : Rat) / 150420250211261632) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((20151335617015521323 : Rat) / 150420250211261632) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-20151335617015521323 : Rat) / 150420250211261632) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 2), (15, 2), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-664798014354914683 : Rat) / 221671947679753984) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-664798014354914683 : Rat) / 221671947679753984) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((664798014354914683 : Rat) / 221671947679753984) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((615465265418789 : Rat) / 967406861476608) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((25882149920427299 : Rat) / 8948513468658624) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-615465265418789 : Rat) / 967406861476608) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((25882149920427299 : Rat) / 8948513468658624) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((615465265418789 : Rat) / 967406861476608) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-25882149920427299 : Rat) / 8948513468658624) [(10, 1), (15, 2), (16, 1)],
  term ((8086348793449461 : Rat) / 2982837822886208) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((125246935636332351515 : Rat) / 1579412627218247136) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-666416976405201562229 : Rat) / 3158825254436494272) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1288629051378772361 : Rat) / 23862702583089664) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-8086348793449461 : Rat) / 2982837822886208) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-125246935636332351515 : Rat) / 1579412627218247136) [(11, 1), (13, 1), (16, 1)],
  term ((-666416976405201562229 : Rat) / 3158825254436494272) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1288629051378772361 : Rat) / 23862702583089664) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((8086348793449461 : Rat) / 2982837822886208) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((125246935636332351515 : Rat) / 1579412627218247136) [(11, 1), (13, 3), (16, 1)],
  term ((666416976405201562229 : Rat) / 3158825254436494272) [(11, 1), (15, 1), (16, 1)],
  term ((1288629051378772361 : Rat) / 23862702583089664) [(11, 1), (15, 3), (16, 1)],
  term ((70245268919840672953 : Rat) / 6317650508872988544) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37337669038798732441633 : Rat) / 151623612212951725056) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-651491840237955147455 : Rat) / 50541204070983908352) [(11, 2), (12, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 6317650508872988544) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37337669038798732441633 : Rat) / 151623612212951725056) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-651491840237955147455 : Rat) / 50541204070983908352) [(11, 2), (13, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 6317650508872988544) [(11, 2), (13, 3), (15, 1), (16, 1)],
  term ((37337669038798732441633 : Rat) / 151623612212951725056) [(11, 2), (15, 2), (16, 1)],
  term ((651491840237955147455 : Rat) / 50541204070983908352) [(11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (15, 1), (16, 1)],
  term ((2979595045926644639 : Rat) / 143176215498537984) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-120172672601373517 : Rat) / 2511863429798912) [(12, 2), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(12, 2), (16, 1)],
  term ((-2979595045926644639 : Rat) / 143176215498537984) [(13, 1), (15, 1), (16, 1)],
  term ((-120172672601373517 : Rat) / 2511863429798912) [(13, 2), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(13, 2), (16, 1)],
  term ((2979595045926644639 : Rat) / 143176215498537984) [(13, 3), (15, 1), (16, 1)],
  term ((120172672601373517 : Rat) / 2511863429798912) [(15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 100 through 176. -/
theorem rs_R010_ueqv_R010NYY_block_09_0100_0176_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_09_0100_0176
      rs_R010_ueqv_R010NYY_block_09_0100_0176 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
