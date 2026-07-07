/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 29:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_29_0100_0199 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(7, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0100 : Poly :=
[
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0100 : Poly :=
[
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0100
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0101 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0101 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (6, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (7, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0101
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0102 : Poly :=
[
  term ((-187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0102 : Poly :=
[
  term ((-375028342928753661013742 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((375028342928753661013742 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-375028342928753661013742 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (7, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0102
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0103 : Poly :=
[
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 103 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0103 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (7, 1), (11, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0103
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0104 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0104 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0104
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0105 : Poly :=
[
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 105 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0105 : Poly :=
[
  term ((8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (7, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0105
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0106 : Poly :=
[
  term ((36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0106 : Poly :=
[
  term ((73330129734431195504408 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-73330129734431195504408 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((73330129734431195504408 : Rat) / 104977024119960464423) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0106
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0107 : Poly :=
[
  term ((-4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 107 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0107 : Poly :=
[
  term ((-8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0107
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0108 : Poly :=
[
  term ((135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 108 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0108 : Poly :=
[
  term ((271474920300762237020 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((271474920300762237020 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-271474920300762237020 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0108
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0109 : Poly :=
[
  term ((-27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0109 : Poly :=
[
  term ((-54294984060152447404 : Rat) / 14996717731422923489) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-54294984060152447404 : Rat) / 14996717731422923489) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((54294984060152447404 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0109
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0110 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 209954048239920928846) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 110 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0110 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 209954048239920928846) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0110
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0111 : Poly :=
[
  term ((12566541384896525237553 : Rat) / 209954048239920928846) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0111 : Poly :=
[
  term ((12566541384896525237553 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12566541384896525237553 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((12566541384896525237553 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12566541384896525237553 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-12566541384896525237553 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12566541384896525237553 : Rat) / 209954048239920928846) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0111
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0112 : Poly :=
[
  term ((-864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 112 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0112 : Poly :=
[
  term ((-864451638997170129687205 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-864451638997170129687205 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((864451638997170129687205 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0112
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0113 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0113 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0113
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0114 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 114 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0114 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0114
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0115 : Poly :=
[
  term ((-309048415754334491796115 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 115 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0115 : Poly :=
[
  term ((-309048415754334491796115 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((309048415754334491796115 : Rat) / 7558345736637153438456) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-309048415754334491796115 : Rat) / 3779172868318576719228) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((309048415754334491796115 : Rat) / 7558345736637153438456) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-309048415754334491796115 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((309048415754334491796115 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0115
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0116 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 116 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0116 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (14, 3), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0116
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0117 : Poly :=
[
  term ((-81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 117 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0117 : Poly :=
[
  term ((-81066579038598020573485 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-81066579038598020573485 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((81066579038598020573485 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0117
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0118 : Poly :=
[
  term ((1006689638265763429957705 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 118 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0118 : Poly :=
[
  term ((1006689638265763429957705 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1006689638265763429957705 : Rat) / 3779172868318576719228) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((1006689638265763429957705 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1006689638265763429957705 : Rat) / 3779172868318576719228) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1006689638265763429957705 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1006689638265763429957705 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0118
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0119 : Poly :=
[
  term ((-184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0119 : Poly :=
[
  term ((-368618547290298073634888 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-368618547290298073634888 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((368618547290298073634888 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0119
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0120 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (16, 1)]
]

/-- Partial product 120 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0120 : Poly :=
[
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (14, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 3), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 3), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (14, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0120
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0121 : Poly :=
[
  term ((172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0121 : Poly :=
[
  term ((172890327799434025937441 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((172890327799434025937441 : Rat) / 629862144719762786538) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-172890327799434025937441 : Rat) / 629862144719762786538) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0121
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0122 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0122 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0122
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0123 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0123 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0123
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0124 : Poly :=
[
  term ((61809683150866898359223 : Rat) / 2519448578879051146152) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0124 : Poly :=
[
  term ((61809683150866898359223 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-61809683150866898359223 : Rat) / 2519448578879051146152) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((61809683150866898359223 : Rat) / 1259724289439525573076) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-61809683150866898359223 : Rat) / 2519448578879051146152) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((61809683150866898359223 : Rat) / 2519448578879051146152) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61809683150866898359223 : Rat) / 1259724289439525573076) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0124
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0125 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0125 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0125
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0126 : Poly :=
[
  term ((-203857376232031737137693 : Rat) / 1259724289439525573076) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0126 : Poly :=
[
  term ((-203857376232031737137693 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((203857376232031737137693 : Rat) / 1259724289439525573076) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-203857376232031737137693 : Rat) / 629862144719762786538) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((203857376232031737137693 : Rat) / 1259724289439525573076) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((203857376232031737137693 : Rat) / 629862144719762786538) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203857376232031737137693 : Rat) / 1259724289439525573076) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0126
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0127 : Poly :=
[
  term ((163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 127 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0127 : Poly :=
[
  term ((163759376193623329753091 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((-163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((163759376193623329753091 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-163759376193623329753091 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0127
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0128 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 128 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0128 : Poly :=
[
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0128
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0129 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0129 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0129
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0130 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0130 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0130
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0131 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 131 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0131 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0131
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0132 : Poly :=
[
  term ((-83133200350547461287370 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 132 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0132 : Poly :=
[
  term ((-166266400701094922574740 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((83133200350547461287370 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-166266400701094922574740 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((83133200350547461287370 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((166266400701094922574740 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-83133200350547461287370 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0132
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0133 : Poly :=
[
  term ((16626640070109492257474 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0133 : Poly :=
[
  term ((33253280140218984514948 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16626640070109492257474 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((33253280140218984514948 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16626640070109492257474 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-33253280140218984514948 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((16626640070109492257474 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0133
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0134 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 134 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0134 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0134
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0135 : Poly :=
[
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0135 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0135
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0136 : Poly :=
[
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 136 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0136 : Poly :=
[
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0136
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0137 : Poly :=
[
  term ((-332441979814249899516905 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 137 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0137 : Poly :=
[
  term ((-332441979814249899516905 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((332441979814249899516905 : Rat) / 629862144719762786538) [(4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((332441979814249899516905 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-332441979814249899516905 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-332441979814249899516905 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((332441979814249899516905 : Rat) / 629862144719762786538) [(4, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0137_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0137
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0138 : Poly :=
[
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0138 : Poly :=
[
  term ((-57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0138_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0138
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0139 : Poly :=
[
  term ((66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0139 : Poly :=
[
  term ((66488395962849979903381 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-66488395962849979903381 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((66488395962849979903381 : Rat) / 104977024119960464423) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0139_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0139
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0140 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0140 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0140_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0140
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0141 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 141 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0141 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (10, 1), (11, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (10, 1), (11, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0141_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0141
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0142 : Poly :=
[
  term ((-141440952335103081240820 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 142 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0142 : Poly :=
[
  term ((-282881904670206162481640 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((141440952335103081240820 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-282881904670206162481640 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((141440952335103081240820 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((282881904670206162481640 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-141440952335103081240820 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0142_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0142
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0143 : Poly :=
[
  term ((259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0143 : Poly :=
[
  term ((518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0143_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0143
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0144 : Poly :=
[
  term ((-660743909820351092624501 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0144 : Poly :=
[
  term ((-1321487819640702185249002 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((660743909820351092624501 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1321487819640702185249002 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((660743909820351092624501 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1321487819640702185249002 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-660743909820351092624501 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0144_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0144
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0145 : Poly :=
[
  term ((-1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 145 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0145 : Poly :=
[
  term ((-2590904389962257072212360 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-2590904389962257072212360 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((2590904389962257072212360 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0145_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0145
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0146 : Poly :=
[
  term ((1105335385017988748182460 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 146 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0146 : Poly :=
[
  term ((2210670770035977496364920 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1105335385017988748182460 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((2210670770035977496364920 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1105335385017988748182460 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-2210670770035977496364920 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((1105335385017988748182460 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0146_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0146
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0147 : Poly :=
[
  term ((28288190467020616248164 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0147 : Poly :=
[
  term ((56576380934041232496328 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28288190467020616248164 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((56576380934041232496328 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28288190467020616248164 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56576380934041232496328 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28288190467020616248164 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0147_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0147
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0148 : Poly :=
[
  term ((-491464238088431256995 : Rat) / 314931072359881393269) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 148 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0148 : Poly :=
[
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((491464238088431256995 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((491464238088431256995 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-491464238088431256995 : Rat) / 314931072359881393269) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0148_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0148
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0149 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0149 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0149_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0149
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0150 : Poly :=
[
  term ((404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0150 : Poly :=
[
  term ((809914646739307623782630 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-809914646739307623782630 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((809914646739307623782630 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (7, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0150_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0150
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0151 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 151 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0151 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (7, 1), (11, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0151_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0151
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0152 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 152 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0152 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0152_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0152
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0153 : Poly :=
[
  term ((-79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 153 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0153 : Poly :=
[
  term ((-158444386833624819706162 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((158444386833624819706162 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-158444386833624819706162 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0153_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0153
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0154 : Poly :=
[
  term ((59010956011113363151045 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 154 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0154 : Poly :=
[
  term ((118021912022226726302090 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-59010956011113363151045 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((118021912022226726302090 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-59010956011113363151045 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-118021912022226726302090 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((59010956011113363151045 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0154_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0154
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0155 : Poly :=
[
  term ((-11802191202222672630209 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0155 : Poly :=
[
  term ((-23604382404445345260418 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11802191202222672630209 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-23604382404445345260418 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((11802191202222672630209 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((23604382404445345260418 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11802191202222672630209 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0155_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0155
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0156 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 156 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0156 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0156_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0156
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0157 : Poly :=
[
  term ((42682903390915198962085 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 157 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0157 : Poly :=
[
  term ((85365806781830397924170 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-42682903390915198962085 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((85365806781830397924170 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42682903390915198962085 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-85365806781830397924170 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((42682903390915198962085 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0157_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0157
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0158 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0158 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0158_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0158
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0159 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0159 : Poly :=
[
  term ((-31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0159_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0159
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0160 : Poly :=
[
  term ((129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 160 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0160 : Poly :=
[
  term ((129202062557172933572785 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((129202062557172933572785 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-129202062557172933572785 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0160_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0160
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0161 : Poly :=
[
  term ((779638309401235841983262 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 161 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0161 : Poly :=
[
  term ((1559276618802471683966524 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-779638309401235841983262 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((1559276618802471683966524 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-779638309401235841983262 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1559276618802471683966524 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((779638309401235841983262 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0161_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0161
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0162 : Poly :=
[
  term ((-532741400204049653426575 : Rat) / 1259724289439525573076) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 162 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0162 : Poly :=
[
  term ((-532741400204049653426575 : Rat) / 629862144719762786538) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((532741400204049653426575 : Rat) / 1259724289439525573076) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-532741400204049653426575 : Rat) / 629862144719762786538) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((532741400204049653426575 : Rat) / 1259724289439525573076) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((532741400204049653426575 : Rat) / 629862144719762786538) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-532741400204049653426575 : Rat) / 1259724289439525573076) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0162_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0162
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0163 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0163 : Poly :=
[
  term ((157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0163_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0163
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0164 : Poly :=
[
  term ((-1272530470653225494589710 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0164 : Poly :=
[
  term ((-2545060941306450989179420 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1272530470653225494589710 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-2545060941306450989179420 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((1272530470653225494589710 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((2545060941306450989179420 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1272530470653225494589710 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0164_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0164
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0165 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (16, 1)]
]

/-- Partial product 165 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0165 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 3), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 3), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 3), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0165_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0165
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0166 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0166 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0166_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0166
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0167 : Poly :=
[
  term ((-8536580678183039792417 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0167 : Poly :=
[
  term ((-17073161356366079584834 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8536580678183039792417 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-17073161356366079584834 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((8536580678183039792417 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((17073161356366079584834 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8536580678183039792417 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0167_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0167
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0168 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 168 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0168 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0168_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0168
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0169 : Poly :=
[
  term ((-25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0169 : Poly :=
[
  term ((-25840412511434586714557 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25840412511434586714557 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((25840412511434586714557 : Rat) / 314931072359881393269) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0169_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0169
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0170 : Poly :=
[
  term ((106548280040809930685315 : Rat) / 419908096479841857692) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0170 : Poly :=
[
  term ((106548280040809930685315 : Rat) / 209954048239920928846) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106548280040809930685315 : Rat) / 419908096479841857692) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((106548280040809930685315 : Rat) / 209954048239920928846) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-106548280040809930685315 : Rat) / 419908096479841857692) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-106548280040809930685315 : Rat) / 209954048239920928846) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((106548280040809930685315 : Rat) / 419908096479841857692) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0170_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0170
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0171 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 171 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0171 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0171_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0171
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0172 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 2)]
]

/-- Partial product 172 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0172 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (8, 1), (10, 1), (11, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (8, 1), (10, 1), (11, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0172_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0172
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0173 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 2)]
]

/-- Partial product 173 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0173 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (8, 1), (10, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0173_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0173
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0174 : Poly :=
[
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 174 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0174 : Poly :=
[
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(6, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 3), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0174_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0174
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0175 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 2)]
]

/-- Partial product 175 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0175 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (8, 1), (11, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0175_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0175
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0176 : Poly :=
[
  term ((42626953896872390210210 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 176 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0176 : Poly :=
[
  term ((85253907793744780420420 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-42626953896872390210210 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-85253907793744780420420 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((42626953896872390210210 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((85253907793744780420420 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42626953896872390210210 : Rat) / 944793217079644179807) [(7, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0176_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0176
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0177 : Poly :=
[
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0177 : Poly :=
[
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(7, 3), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0177_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0177
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0178 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 178 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0178 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (8, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0178_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0178
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0179 : Poly :=
[
  term ((-8525390779374478042042 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0179 : Poly :=
[
  term ((-17050781558748956084084 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((8525390779374478042042 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((17050781558748956084084 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8525390779374478042042 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17050781558748956084084 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((8525390779374478042042 : Rat) / 314931072359881393269) [(7, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0179_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0179
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0180 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)]
]

/-- Partial product 180 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0180 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 3), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0180_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0180
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0181 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 181 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0181 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 3), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0181_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0181
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0182 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)]
]

/-- Partial product 182 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0182 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0182_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0182
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0183 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0183 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0183_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0183
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0184 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 184 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0184 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0184_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0184
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0185 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 185 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0185 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0185_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0185
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0186 : Poly :=
[
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 186 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0186 : Poly :=
[
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 3), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0186_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0186
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0187 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 2)]
]

/-- Partial product 187 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0187 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (10, 1), (11, 1), (12, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (10, 1), (11, 1), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0187_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0187
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0188 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0188 : Poly :=
[
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(7, 3), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0188_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0188
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0189 : Poly :=
[
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 189 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0189 : Poly :=
[
  term ((61579824695772740558575 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 209954048239920928846) [(6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((61579824695772740558575 : Rat) / 104977024119960464423) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 209954048239920928846) [(7, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0189_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0189
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0190 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (16, 2)]
]

/-- Partial product 190 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0190 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (10, 1), (11, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 3), (10, 1), (11, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0190_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0190
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0191 : Poly :=
[
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0191 : Poly :=
[
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 3), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0191_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0191
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0192 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 192 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0192 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (10, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0192_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0192
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0193 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 193 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0193 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(7, 3), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0193_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0193
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0194 : Poly :=
[
  term ((-114202949224229667866971 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0194 : Poly :=
[
  term ((-114202949224229667866971 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((114202949224229667866971 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((114202949224229667866971 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114202949224229667866971 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114202949224229667866971 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((114202949224229667866971 : Rat) / 629862144719762786538) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0194_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0194
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0195 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 1), (15, 1), (16, 2)]
]

/-- Partial product 195 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0195 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (10, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 3), (10, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0195_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0195
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0196 : Poly :=
[
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 196 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0196 : Poly :=
[
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 3), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0196_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0196
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0197 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 2)]
]

/-- Partial product 197 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0197 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (11, 1), (12, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0197_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0197
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0198 : Poly :=
[
  term ((190392236949759303483965 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 198 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0198 : Poly :=
[
  term ((380784473899518606967930 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-190392236949759303483965 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-380784473899518606967930 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((190392236949759303483965 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((380784473899518606967930 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-190392236949759303483965 : Rat) / 944793217079644179807) [(7, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0198_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0198
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0199 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0199 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0199_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0199
        rs_R007_ueqv_R007NY_generator_29_0100_0199 =
      rs_R007_ueqv_R007NY_partial_29_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_29_0100_0199 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_29_0100,
  rs_R007_ueqv_R007NY_partial_29_0101,
  rs_R007_ueqv_R007NY_partial_29_0102,
  rs_R007_ueqv_R007NY_partial_29_0103,
  rs_R007_ueqv_R007NY_partial_29_0104,
  rs_R007_ueqv_R007NY_partial_29_0105,
  rs_R007_ueqv_R007NY_partial_29_0106,
  rs_R007_ueqv_R007NY_partial_29_0107,
  rs_R007_ueqv_R007NY_partial_29_0108,
  rs_R007_ueqv_R007NY_partial_29_0109,
  rs_R007_ueqv_R007NY_partial_29_0110,
  rs_R007_ueqv_R007NY_partial_29_0111,
  rs_R007_ueqv_R007NY_partial_29_0112,
  rs_R007_ueqv_R007NY_partial_29_0113,
  rs_R007_ueqv_R007NY_partial_29_0114,
  rs_R007_ueqv_R007NY_partial_29_0115,
  rs_R007_ueqv_R007NY_partial_29_0116,
  rs_R007_ueqv_R007NY_partial_29_0117,
  rs_R007_ueqv_R007NY_partial_29_0118,
  rs_R007_ueqv_R007NY_partial_29_0119,
  rs_R007_ueqv_R007NY_partial_29_0120,
  rs_R007_ueqv_R007NY_partial_29_0121,
  rs_R007_ueqv_R007NY_partial_29_0122,
  rs_R007_ueqv_R007NY_partial_29_0123,
  rs_R007_ueqv_R007NY_partial_29_0124,
  rs_R007_ueqv_R007NY_partial_29_0125,
  rs_R007_ueqv_R007NY_partial_29_0126,
  rs_R007_ueqv_R007NY_partial_29_0127,
  rs_R007_ueqv_R007NY_partial_29_0128,
  rs_R007_ueqv_R007NY_partial_29_0129,
  rs_R007_ueqv_R007NY_partial_29_0130,
  rs_R007_ueqv_R007NY_partial_29_0131,
  rs_R007_ueqv_R007NY_partial_29_0132,
  rs_R007_ueqv_R007NY_partial_29_0133,
  rs_R007_ueqv_R007NY_partial_29_0134,
  rs_R007_ueqv_R007NY_partial_29_0135,
  rs_R007_ueqv_R007NY_partial_29_0136,
  rs_R007_ueqv_R007NY_partial_29_0137,
  rs_R007_ueqv_R007NY_partial_29_0138,
  rs_R007_ueqv_R007NY_partial_29_0139,
  rs_R007_ueqv_R007NY_partial_29_0140,
  rs_R007_ueqv_R007NY_partial_29_0141,
  rs_R007_ueqv_R007NY_partial_29_0142,
  rs_R007_ueqv_R007NY_partial_29_0143,
  rs_R007_ueqv_R007NY_partial_29_0144,
  rs_R007_ueqv_R007NY_partial_29_0145,
  rs_R007_ueqv_R007NY_partial_29_0146,
  rs_R007_ueqv_R007NY_partial_29_0147,
  rs_R007_ueqv_R007NY_partial_29_0148,
  rs_R007_ueqv_R007NY_partial_29_0149,
  rs_R007_ueqv_R007NY_partial_29_0150,
  rs_R007_ueqv_R007NY_partial_29_0151,
  rs_R007_ueqv_R007NY_partial_29_0152,
  rs_R007_ueqv_R007NY_partial_29_0153,
  rs_R007_ueqv_R007NY_partial_29_0154,
  rs_R007_ueqv_R007NY_partial_29_0155,
  rs_R007_ueqv_R007NY_partial_29_0156,
  rs_R007_ueqv_R007NY_partial_29_0157,
  rs_R007_ueqv_R007NY_partial_29_0158,
  rs_R007_ueqv_R007NY_partial_29_0159,
  rs_R007_ueqv_R007NY_partial_29_0160,
  rs_R007_ueqv_R007NY_partial_29_0161,
  rs_R007_ueqv_R007NY_partial_29_0162,
  rs_R007_ueqv_R007NY_partial_29_0163,
  rs_R007_ueqv_R007NY_partial_29_0164,
  rs_R007_ueqv_R007NY_partial_29_0165,
  rs_R007_ueqv_R007NY_partial_29_0166,
  rs_R007_ueqv_R007NY_partial_29_0167,
  rs_R007_ueqv_R007NY_partial_29_0168,
  rs_R007_ueqv_R007NY_partial_29_0169,
  rs_R007_ueqv_R007NY_partial_29_0170,
  rs_R007_ueqv_R007NY_partial_29_0171,
  rs_R007_ueqv_R007NY_partial_29_0172,
  rs_R007_ueqv_R007NY_partial_29_0173,
  rs_R007_ueqv_R007NY_partial_29_0174,
  rs_R007_ueqv_R007NY_partial_29_0175,
  rs_R007_ueqv_R007NY_partial_29_0176,
  rs_R007_ueqv_R007NY_partial_29_0177,
  rs_R007_ueqv_R007NY_partial_29_0178,
  rs_R007_ueqv_R007NY_partial_29_0179,
  rs_R007_ueqv_R007NY_partial_29_0180,
  rs_R007_ueqv_R007NY_partial_29_0181,
  rs_R007_ueqv_R007NY_partial_29_0182,
  rs_R007_ueqv_R007NY_partial_29_0183,
  rs_R007_ueqv_R007NY_partial_29_0184,
  rs_R007_ueqv_R007NY_partial_29_0185,
  rs_R007_ueqv_R007NY_partial_29_0186,
  rs_R007_ueqv_R007NY_partial_29_0187,
  rs_R007_ueqv_R007NY_partial_29_0188,
  rs_R007_ueqv_R007NY_partial_29_0189,
  rs_R007_ueqv_R007NY_partial_29_0190,
  rs_R007_ueqv_R007NY_partial_29_0191,
  rs_R007_ueqv_R007NY_partial_29_0192,
  rs_R007_ueqv_R007NY_partial_29_0193,
  rs_R007_ueqv_R007NY_partial_29_0194,
  rs_R007_ueqv_R007NY_partial_29_0195,
  rs_R007_ueqv_R007NY_partial_29_0196,
  rs_R007_ueqv_R007NY_partial_29_0197,
  rs_R007_ueqv_R007NY_partial_29_0198,
  rs_R007_ueqv_R007NY_partial_29_0199
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_29_0100_0199 : Poly :=
[
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-375028342928753661013742 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((73330129734431195504408 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((271474920300762237020 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-54294984060152447404 : Rat) / 14996717731422923489) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((12566541384896525237553 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-864451638997170129687205 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-81066579038598020573485 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1006689638265763429957705 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-309048415754334491796115 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (14, 3), (16, 1)],
  term ((-368618547290298073634888 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (14, 1), (16, 1)],
  term ((172890327799434025937441 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203857376232031737137693 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((163759376193623329753091 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((61809683150866898359223 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (6, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (7, 1), (11, 2), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((-36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-12566541384896525237553 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((309048415754334491796115 : Rat) / 7558345736637153438456) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (14, 2), (16, 1)],
  term ((81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1006689638265763429957705 : Rat) / 3779172868318576719228) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 3), (16, 1)],
  term ((-172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((-61809683150866898359223 : Rat) / 2519448578879051146152) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((203857376232031737137693 : Rat) / 1259724289439525573076) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((271474920300762237020 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54294984060152447404 : Rat) / 14996717731422923489) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((12566541384896525237553 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-864451638997170129687205 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4191291699390709440368789 : Rat) / 3779172868318576719228) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118395390520497553083521 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-81066579038598020573485 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-368618547290298073634888 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((172890327799434025937441 : Rat) / 629862144719762786538) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-818151873662307447693673 : Rat) / 1259724289439525573076) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((135571537573628986349 : Rat) / 5292959199325737702) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((163759376193623329753091 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((-135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-12566541384896525237553 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-110101648643305608636665 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((309048415754334491796115 : Rat) / 7558345736637153438456) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (14, 2), (16, 1)],
  term ((-1682704004302335822068057 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1006689638265763429957705 : Rat) / 3779172868318576719228) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((25133082769793050475106 : Rat) / 104977024119960464423) [(3, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 3), (16, 1)],
  term ((-172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((22020329728661121727333 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-18363717869063142878717 : Rat) / 839816192959683715384) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((200498111460193002276157 : Rat) / 1259724289439525573076) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((276221402212963843273357 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (7, 3), (11, 1), (13, 1), (16, 1)],
  term ((187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 3), (11, 2), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (7, 3), (14, 1), (16, 1)],
  term ((-36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 3), (16, 1)],
  term ((-271474920300762237020 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((54294984060152447404 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 209954048239920928846) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-12566541384896525237553 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12566541384896525237553 : Rat) / 209954048239920928846) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((864451638997170129687205 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((81066579038598020573485 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4335806968817388211626935 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-674264431457099790920395 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 3), (16, 1)],
  term ((-81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1006689638265763429957705 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (16, 1)],
  term ((368618547290298073634888 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (14, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (16, 1)],
  term ((-172890327799434025937441 : Rat) / 629862144719762786538) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((877239188078993846909995 : Rat) / 2519448578879051146152) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163759376193623329753091 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((134852886291419958184079 : Rat) / 1259724289439525573076) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-203857376232031737137693 : Rat) / 1259724289439525573076) [(3, 1), (15, 1), (16, 1)],
  term ((163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (15, 3), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 2), (16, 1)],
  term ((-166266400701094922574740 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((33253280140218984514948 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((83133200350547461287370 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-16626640070109492257474 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-166266400701094922574740 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((33253280140218984514948 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((83133200350547461287370 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-16626640070109492257474 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((166266400701094922574740 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-83133200350547461287370 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-33253280140218984514948 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((16626640070109492257474 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-332441979814249899516905 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((66488395962849979903381 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-282881904670206162481640 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1321487819640702185249002 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2210670770035977496364920 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2590904389962257072212360 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((56576380934041232496328 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((332441979814249899516905 : Rat) / 629862144719762786538) [(4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (10, 1), (11, 2), (16, 1)],
  term ((141440952335103081240820 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((660743909820351092624501 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-1105335385017988748182460 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-28288190467020616248164 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-282881904670206162481640 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((475835041214277035465375 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1321487819640702185249002 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-332441979814249899516905 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2590904389962257072212360 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((2210670770035977496364920 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((56576380934041232496328 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-95167008242855407093075 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (10, 1), (11, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((141440952335103081240820 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((3956526257689794953672 : Rat) / 44990153194268770467) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-336582029622398605926214 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-1105335385017988748182460 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-28288190467020616248164 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((199956652126638370967138 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 3), (10, 1), (11, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 3), (11, 1), (14, 1), (16, 1)],
  term ((332441979814249899516905 : Rat) / 629862144719762786538) [(4, 1), (7, 3), (11, 1), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((282881904670206162481640 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-141440952335103081240820 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((2098759136629379306912710 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-660743909820351092624501 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-389569218335234003607900 : Rat) / 104977024119960464423) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((2590904389962257072212360 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((1105335385017988748182460 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (16, 1)],
  term ((-56576380934041232496328 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28288190467020616248164 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-491464238088431256995 : Rat) / 314931072359881393269) [(4, 1), (15, 2), (16, 1)],
  term ((809914646739307623782630 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-158444386833624819706162 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((118021912022226726302090 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-23604382404445345260418 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((85365806781830397924170 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1559276618802471683966524 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-532741400204049653426575 : Rat) / 629862144719762786538) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((129202062557172933572785 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2545060941306450989179420 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 3), (14, 1), (16, 1)],
  term ((-17073161356366079584834 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((106548280040809930685315 : Rat) / 209954048239920928846) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((-25840412511434586714557 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (7, 1), (11, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-59010956011113363151045 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((11802191202222672630209 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-42682903390915198962085 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-779638309401235841983262 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((532741400204049653426575 : Rat) / 1259724289439525573076) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1272530470653225494589710 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 3), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8536580678183039792417 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-106548280040809930685315 : Rat) / 419908096479841857692) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((118021912022226726302090 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23604382404445345260418 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((85365806781830397924170 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-720029723229209190769445 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46371150227814196264535 : Rat) / 111152143185840491742) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1559276618802471683966524 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2545060941306450989179420 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17073161356366079584834 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((140467402131605133103525 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((23028636184114996049969 : Rat) / 89980306388537540934) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-59010956011113363151045 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((11802191202222672630209 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-42682903390915198962085 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31453711237659600447680 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((10092112446023927266456 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((532741400204049653426575 : Rat) / 1259724289439525573076) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1243042616367919619170010 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 3), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8536580678183039792417 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-106548280040809930685315 : Rat) / 419908096479841857692) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-51504224309639123216734 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 3), (11, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 3), (14, 1), (15, 2), (16, 1)],
  term ((79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-118021912022226726302090 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((59010956011113363151045 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((23604382404445345260418 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11802191202222672630209 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5025880318035154461890 : Rat) / 19281494226115187343) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((42682903390915198962085 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-94497481509350652037532 : Rat) / 55576071592920245871) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((863713131584660946926255 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-129202062557172933572785 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((779638309401235841983262 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-532741400204049653426575 : Rat) / 1259724289439525573076) [(5, 1), (11, 1), (16, 1)],
  term ((291521691044511110033180 : Rat) / 104977024119960464423) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1272530470653225494589710 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (16, 1)],
  term ((1005176063607030892378 : Rat) / 6427164742038395781) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8536580678183039792417 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-172742626316932189385251 : Rat) / 314931072359881393269) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((25840412511434586714557 : Rat) / 314931072359881393269) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((106548280040809930685315 : Rat) / 419908096479841857692) [(5, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (15, 3), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((85253907793744780420420 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2), (16, 2)],
  term ((-17050781558748956084084 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61579824695772740558575 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-114202949224229667866971 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((380784473899518606967930 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (8, 1), (10, 1), (11, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 2)],
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(6, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 2)],
  term ((-42626953896872390210210 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 2)],
  term ((8525390779374478042042 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (10, 1), (11, 1), (12, 1), (16, 2)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 209954048239920928846) [(6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (10, 1), (11, 1), (16, 2)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 2)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((114202949224229667866971 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 2)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-190392236949759303483965 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 2)],
  term ((-13865671508047004178275 : Rat) / 37050714395280163914) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 2)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 2)],
  term ((42626953896872390210210 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((2773134301609400835655 : Rat) / 12350238131760054638) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 2)],
  term ((-8525390779374478042042 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((114202949224229667866971 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((-114202949224229667866971 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 1), (15, 1), (16, 2)],
  term ((-170440030294075823088725 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 2)],
  term ((190392236949759303483965 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((85253907793744780420420 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17050781558748956084084 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((61579824695772740558575 : Rat) / 104977024119960464423) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-114202949224229667866971 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (10, 1), (15, 2), (16, 2)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((380784473899518606967930 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (8, 1), (10, 1), (11, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (8, 1), (10, 1), (15, 1), (16, 2)],
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 3), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (8, 1), (11, 1), (14, 1), (16, 2)],
  term ((-42626953896872390210210 : Rat) / 944793217079644179807) [(7, 3), (8, 1), (11, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(7, 3), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (8, 1), (14, 1), (15, 1), (16, 2)],
  term ((8525390779374478042042 : Rat) / 314931072359881393269) [(7, 3), (8, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 3), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 3), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 3), (9, 1), (15, 2), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 3), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (10, 1), (11, 1), (12, 1), (16, 2)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(7, 3), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 209954048239920928846) [(7, 3), (10, 1), (11, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 3), (10, 1), (11, 1), (16, 2)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (10, 1), (12, 1), (15, 1), (16, 2)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(7, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((114202949224229667866971 : Rat) / 629862144719762786538) [(7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 3), (10, 1), (15, 1), (16, 2)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-190392236949759303483965 : Rat) / 944793217079644179807) [(7, 3), (11, 1), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 100 through 199. -/
theorem rs_R007_ueqv_R007NY_block_29_0100_0199_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_29_0100_0199
      rs_R007_ueqv_R007NY_block_29_0100_0199 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
