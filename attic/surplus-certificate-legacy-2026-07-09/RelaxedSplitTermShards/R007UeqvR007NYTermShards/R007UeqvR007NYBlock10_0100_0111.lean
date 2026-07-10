/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 10:100-111

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_10_0100_0111 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0100 : Poly :=
[
  term ((-39051661324917785252845 : Rat) / 111152143185840491742) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0100 : Poly :=
[
  term ((-39051661324917785252845 : Rat) / 55576071592920245871) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39051661324917785252845 : Rat) / 55576071592920245871) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((39051661324917785252845 : Rat) / 111152143185840491742) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((39051661324917785252845 : Rat) / 111152143185840491742) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0100
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0101 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 101 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0101 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0101
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0102 : Poly :=
[
  term ((-192425374364087047129795 : Rat) / 944793217079644179807) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 102 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0102 : Poly :=
[
  term ((-384850748728174094259590 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-384850748728174094259590 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((192425374364087047129795 : Rat) / 944793217079644179807) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((192425374364087047129795 : Rat) / 944793217079644179807) [(5, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0102
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0103 : Poly :=
[
  term ((-1328457798546143650675 : Rat) / 2201032538333475084) [(11, 2), (16, 1)]
]

/-- Partial product 103 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0103 : Poly :=
[
  term ((-1328457798546143650675 : Rat) / 1100516269166737542) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-1328457798546143650675 : Rat) / 1100516269166737542) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((1328457798546143650675 : Rat) / 2201032538333475084) [(4, 2), (11, 2), (16, 1)],
  term ((1328457798546143650675 : Rat) / 2201032538333475084) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0103
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0104 : Poly :=
[
  term ((-6590089605752130548705 : Rat) / 104977024119960464423) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0104 : Poly :=
[
  term ((-13180179211504261097410 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13180179211504261097410 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6590089605752130548705 : Rat) / 104977024119960464423) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6590089605752130548705 : Rat) / 104977024119960464423) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0104
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0105 : Poly :=
[
  term ((-149171241252454941851537 : Rat) / 629862144719762786538) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0105 : Poly :=
[
  term ((-149171241252454941851537 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-149171241252454941851537 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((149171241252454941851537 : Rat) / 629862144719762786538) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((149171241252454941851537 : Rat) / 629862144719762786538) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0105
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0106 : Poly :=
[
  term ((232608357262512652016711 : Rat) / 629862144719762786538) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0106 : Poly :=
[
  term ((232608357262512652016711 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((232608357262512652016711 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-232608357262512652016711 : Rat) / 629862144719762786538) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-232608357262512652016711 : Rat) / 629862144719762786538) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0106
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0107 : Poly :=
[
  term ((-71708039215830928873505 : Rat) / 629862144719762786538) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0107 : Poly :=
[
  term ((-71708039215830928873505 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71708039215830928873505 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((71708039215830928873505 : Rat) / 629862144719762786538) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((71708039215830928873505 : Rat) / 629862144719762786538) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0107
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0108 : Poly :=
[
  term ((-1915814561380323617785 : Rat) / 104977024119960464423) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0108 : Poly :=
[
  term ((-3831629122760647235570 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3831629122760647235570 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((1915814561380323617785 : Rat) / 104977024119960464423) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((1915814561380323617785 : Rat) / 104977024119960464423) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0108
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0109 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0109 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0109
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0110 : Poly :=
[
  term ((31721573048346375147319 : Rat) / 74101428790560327828) [(15, 2), (16, 1)]
]

/-- Partial product 110 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0110 : Poly :=
[
  term ((31721573048346375147319 : Rat) / 37050714395280163914) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((31721573048346375147319 : Rat) / 37050714395280163914) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-31721573048346375147319 : Rat) / 74101428790560327828) [(4, 2), (15, 2), (16, 1)],
  term ((-31721573048346375147319 : Rat) / 74101428790560327828) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0110
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0111 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(15, 4), (16, 1)]
]

/-- Partial product 111 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0111 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 2), (15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0111
        rs_R007_ueqv_R007NY_generator_10_0100_0111 =
      rs_R007_ueqv_R007NY_partial_10_0111 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_10_0100_0111 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_10_0100,
  rs_R007_ueqv_R007NY_partial_10_0101,
  rs_R007_ueqv_R007NY_partial_10_0102,
  rs_R007_ueqv_R007NY_partial_10_0103,
  rs_R007_ueqv_R007NY_partial_10_0104,
  rs_R007_ueqv_R007NY_partial_10_0105,
  rs_R007_ueqv_R007NY_partial_10_0106,
  rs_R007_ueqv_R007NY_partial_10_0107,
  rs_R007_ueqv_R007NY_partial_10_0108,
  rs_R007_ueqv_R007NY_partial_10_0109,
  rs_R007_ueqv_R007NY_partial_10_0110,
  rs_R007_ueqv_R007NY_partial_10_0111
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_10_0100_0111 : Poly :=
[
  term ((-39051661324917785252845 : Rat) / 55576071592920245871) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-384850748728174094259590 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1328457798546143650675 : Rat) / 1100516269166737542) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-13180179211504261097410 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149171241252454941851537 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((232608357262512652016711 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71708039215830928873505 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3831629122760647235570 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((31721573048346375147319 : Rat) / 37050714395280163914) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((-39051661324917785252845 : Rat) / 55576071592920245871) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-384850748728174094259590 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1328457798546143650675 : Rat) / 1100516269166737542) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-13180179211504261097410 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149171241252454941851537 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((232608357262512652016711 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71708039215830928873505 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3831629122760647235570 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((31721573048346375147319 : Rat) / 37050714395280163914) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((39051661324917785252845 : Rat) / 111152143185840491742) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((192425374364087047129795 : Rat) / 944793217079644179807) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((1328457798546143650675 : Rat) / 2201032538333475084) [(4, 2), (11, 2), (16, 1)],
  term ((6590089605752130548705 : Rat) / 104977024119960464423) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((149171241252454941851537 : Rat) / 629862144719762786538) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-232608357262512652016711 : Rat) / 629862144719762786538) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((71708039215830928873505 : Rat) / 629862144719762786538) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((1915814561380323617785 : Rat) / 104977024119960464423) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((-31721573048346375147319 : Rat) / 74101428790560327828) [(4, 2), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 2), (15, 4), (16, 1)],
  term ((39051661324917785252845 : Rat) / 111152143185840491742) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((192425374364087047129795 : Rat) / 944793217079644179807) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((1328457798546143650675 : Rat) / 2201032538333475084) [(5, 2), (11, 2), (16, 1)],
  term ((6590089605752130548705 : Rat) / 104977024119960464423) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((149171241252454941851537 : Rat) / 629862144719762786538) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-232608357262512652016711 : Rat) / 629862144719762786538) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((71708039215830928873505 : Rat) / 629862144719762786538) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((1915814561380323617785 : Rat) / 104977024119960464423) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((-31721573048346375147319 : Rat) / 74101428790560327828) [(5, 2), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 100 through 111. -/
theorem rs_R007_ueqv_R007NY_block_10_0100_0111_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_10_0100_0111
      rs_R007_ueqv_R007NY_block_10_0100_0111 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
