/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 12:100-131

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_12_0100_0131 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0100 : Poly :=
[
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0100 : Poly :=
[
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0100_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0100
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0101 : Poly :=
[
  term ((-137004120164657951 : Rat) / 11931351291544832) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0101 : Poly :=
[
  term ((137004120164657951 : Rat) / 5965675645772416) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0101_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0101
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0102 : Poly :=
[
  term ((-137004120164657951 : Rat) / 11931351291544832) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0102 : Poly :=
[
  term ((137004120164657951 : Rat) / 5965675645772416) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0102_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0102
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0103 : Poly :=
[
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 103 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0103 : Poly :=
[
  term ((483471987809343275445 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((483471987809343275445 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0103_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0103
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0104 : Poly :=
[
  term ((-69527544276797127 : Rat) / 2982837822886208) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0104 : Poly :=
[
  term ((69527544276797127 : Rat) / 1491418911443104) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 2982837822886208) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 2982837822886208) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 1491418911443104) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 2982837822886208) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 2982837822886208) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0104_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0104
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0105 : Poly :=
[
  term ((105391581736663592799 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0105 : Poly :=
[
  term ((-105391581736663592799 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((105391581736663592799 : Rat) / 8423534011830651392) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-105391581736663592799 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((105391581736663592799 : Rat) / 8423534011830651392) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((105391581736663592799 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((105391581736663592799 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-105391581736663592799 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-105391581736663592799 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0105_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0105
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0106 : Poly :=
[
  term ((-497327789089350457125 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0106 : Poly :=
[
  term ((497327789089350457125 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-497327789089350457125 : Rat) / 16847068023661302784) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((497327789089350457125 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-497327789089350457125 : Rat) / 16847068023661302784) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-497327789089350457125 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-497327789089350457125 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((497327789089350457125 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((497327789089350457125 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0106_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0106
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0107 : Poly :=
[
  term ((-3905239316688243184115 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 107 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0107 : Poly :=
[
  term ((3905239316688243184115 : Rat) / 33694136047322605568) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3905239316688243184115 : Rat) / 67388272094645211136) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((3905239316688243184115 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3905239316688243184115 : Rat) / 67388272094645211136) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3905239316688243184115 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3905239316688243184115 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3905239316688243184115 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((3905239316688243184115 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0107_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0107
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0108 : Poly :=
[
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 108 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0108 : Poly :=
[
  term ((-1104993165499089067 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0108_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0108
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0109 : Poly :=
[
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0109 : Poly :=
[
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0109_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0109
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0110 : Poly :=
[
  term ((-33258853752903365 : Rat) / 5965675645772416) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0110 : Poly :=
[
  term ((33258853752903365 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33258853752903365 : Rat) / 5965675645772416) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((33258853752903365 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33258853752903365 : Rat) / 5965675645772416) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33258853752903365 : Rat) / 2982837822886208) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33258853752903365 : Rat) / 2982837822886208) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((33258853752903365 : Rat) / 5965675645772416) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((33258853752903365 : Rat) / 5965675645772416) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0110_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0110
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0111 : Poly :=
[
  term ((546492365945773 : Rat) / 365245447700352) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0111 : Poly :=
[
  term ((-546492365945773 : Rat) / 182622723850176) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-546492365945773 : Rat) / 182622723850176) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((546492365945773 : Rat) / 182622723850176) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((546492365945773 : Rat) / 182622723850176) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0111_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0111
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0112 : Poly :=
[
  term ((-2043146571715817789 : Rat) / 286352430997075968) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0112 : Poly :=
[
  term ((2043146571715817789 : Rat) / 143176215498537984) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2043146571715817789 : Rat) / 286352430997075968) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((2043146571715817789 : Rat) / 143176215498537984) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2043146571715817789 : Rat) / 286352430997075968) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2043146571715817789 : Rat) / 143176215498537984) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2043146571715817789 : Rat) / 143176215498537984) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2043146571715817789 : Rat) / 286352430997075968) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2043146571715817789 : Rat) / 286352430997075968) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0112_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0112
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0113 : Poly :=
[
  term ((-9719195013594023 : Rat) / 486993930267136) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 113 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0113 : Poly :=
[
  term ((9719195013594023 : Rat) / 243496965133568) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-9719195013594023 : Rat) / 486993930267136) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((9719195013594023 : Rat) / 243496965133568) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((-9719195013594023 : Rat) / 486993930267136) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-9719195013594023 : Rat) / 243496965133568) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9719195013594023 : Rat) / 243496965133568) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((9719195013594023 : Rat) / 486993930267136) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((9719195013594023 : Rat) / 486993930267136) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0113_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0113
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0114 : Poly :=
[
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0114 : Poly :=
[
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(2, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(3, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0114_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0114
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0115 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0115 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0115_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0115
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0116 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0116 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(3, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0116_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0116
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0117 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 117 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0117 : Poly :=
[
  term ((-23088038262747441 : Rat) / 372854727860776) [(0, 1), (2, 1), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0117_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0117
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0118 : Poly :=
[
  term ((3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 118 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0118 : Poly :=
[
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0118_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0118
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0119 : Poly :=
[
  term ((454519041116426430531 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0119 : Poly :=
[
  term ((-454519041116426430531 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 4211767005915325696) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 4211767005915325696) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 2105883502957662848) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 2105883502957662848) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0119_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0119
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0120 : Poly :=
[
  term ((802906227816993 : Rat) / 213059844491872) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0120 : Poly :=
[
  term ((-802906227816993 : Rat) / 106529922245936) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 213059844491872) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 106529922245936) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 213059844491872) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 213059844491872) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 213059844491872) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0120_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0120
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0121 : Poly :=
[
  term ((129407727066099759 : Rat) / 5965675645772416) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0121 : Poly :=
[
  term ((-129407727066099759 : Rat) / 2982837822886208) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((129407727066099759 : Rat) / 5965675645772416) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-129407727066099759 : Rat) / 2982837822886208) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((129407727066099759 : Rat) / 5965675645772416) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((129407727066099759 : Rat) / 2982837822886208) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((129407727066099759 : Rat) / 2982837822886208) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-129407727066099759 : Rat) / 5965675645772416) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-129407727066099759 : Rat) / 5965675645772416) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0121_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0121
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0122 : Poly :=
[
  term ((-96659410250578601 : Rat) / 11931351291544832) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0122 : Poly :=
[
  term ((96659410250578601 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 11931351291544832) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((96659410250578601 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 11931351291544832) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 5965675645772416) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 5965675645772416) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((96659410250578601 : Rat) / 11931351291544832) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((96659410250578601 : Rat) / 11931351291544832) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0122_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0122
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0123 : Poly :=
[
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0123 : Poly :=
[
  term ((-893650397921630687125 : Rat) / 12635301017745977088) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-893650397921630687125 : Rat) / 12635301017745977088) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((893650397921630687125 : Rat) / 12635301017745977088) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((893650397921630687125 : Rat) / 12635301017745977088) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0123_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0123
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0124 : Poly :=
[
  term ((-3565722424790453374967 : Rat) / 101082408141967816704) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0124 : Poly :=
[
  term ((3565722424790453374967 : Rat) / 50541204070983908352) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3565722424790453374967 : Rat) / 101082408141967816704) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((3565722424790453374967 : Rat) / 50541204070983908352) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3565722424790453374967 : Rat) / 101082408141967816704) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3565722424790453374967 : Rat) / 50541204070983908352) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3565722424790453374967 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3565722424790453374967 : Rat) / 101082408141967816704) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3565722424790453374967 : Rat) / 101082408141967816704) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0124_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0124
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0125 : Poly :=
[
  term ((130975715831619055 : Rat) / 11931351291544832) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 125 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0125 : Poly :=
[
  term ((-130975715831619055 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((130975715831619055 : Rat) / 11931351291544832) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-130975715831619055 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((130975715831619055 : Rat) / 11931351291544832) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((130975715831619055 : Rat) / 5965675645772416) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((130975715831619055 : Rat) / 5965675645772416) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-130975715831619055 : Rat) / 11931351291544832) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-130975715831619055 : Rat) / 11931351291544832) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0125_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0125
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0126 : Poly :=
[
  term ((-308307006418498407505 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0126 : Poly :=
[
  term ((308307006418498407505 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-308307006418498407505 : Rat) / 8423534011830651392) [(0, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((308307006418498407505 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-308307006418498407505 : Rat) / 8423534011830651392) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-308307006418498407505 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-308307006418498407505 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0126_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0126
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0127 : Poly :=
[
  term ((485206178528541194549 : Rat) / 8423534011830651392) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0127 : Poly :=
[
  term ((-485206178528541194549 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((485206178528541194549 : Rat) / 8423534011830651392) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((-485206178528541194549 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((485206178528541194549 : Rat) / 8423534011830651392) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((485206178528541194549 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((485206178528541194549 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-485206178528541194549 : Rat) / 8423534011830651392) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-485206178528541194549 : Rat) / 8423534011830651392) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0127_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0127
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0128 : Poly :=
[
  term ((24905459124066212725 : Rat) / 2406724003380186112) [(11, 2), (16, 1)]
]

/-- Partial product 128 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0128 : Poly :=
[
  term ((-24905459124066212725 : Rat) / 1203362001690093056) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((24905459124066212725 : Rat) / 2406724003380186112) [(0, 2), (11, 2), (16, 1)],
  term ((-24905459124066212725 : Rat) / 1203362001690093056) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((24905459124066212725 : Rat) / 2406724003380186112) [(1, 2), (11, 2), (16, 1)],
  term ((24905459124066212725 : Rat) / 1203362001690093056) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((24905459124066212725 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-24905459124066212725 : Rat) / 2406724003380186112) [(11, 2), (12, 2), (16, 1)],
  term ((-24905459124066212725 : Rat) / 2406724003380186112) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0128_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0128
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0129 : Poly :=
[
  term ((669500262209960141 : Rat) / 71588107749268992) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0129 : Poly :=
[
  term ((-669500262209960141 : Rat) / 35794053874634496) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((669500262209960141 : Rat) / 71588107749268992) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-669500262209960141 : Rat) / 35794053874634496) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((669500262209960141 : Rat) / 71588107749268992) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((669500262209960141 : Rat) / 35794053874634496) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((669500262209960141 : Rat) / 35794053874634496) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-669500262209960141 : Rat) / 71588107749268992) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-669500262209960141 : Rat) / 71588107749268992) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0129_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0129
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0130 : Poly :=
[
  term ((-1435530425385759329 : Rat) / 143176215498537984) [(15, 2), (16, 1)]
]

/-- Partial product 130 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0130 : Poly :=
[
  term ((1435530425385759329 : Rat) / 71588107749268992) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-1435530425385759329 : Rat) / 143176215498537984) [(0, 2), (15, 2), (16, 1)],
  term ((1435530425385759329 : Rat) / 71588107749268992) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-1435530425385759329 : Rat) / 143176215498537984) [(1, 2), (15, 2), (16, 1)],
  term ((-1435530425385759329 : Rat) / 71588107749268992) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1435530425385759329 : Rat) / 71588107749268992) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1435530425385759329 : Rat) / 143176215498537984) [(12, 2), (15, 2), (16, 1)],
  term ((1435530425385759329 : Rat) / 143176215498537984) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0130_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0130
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYY_coefficient_12_0131 : Poly :=
[
  term ((-9184513182051 : Rat) / 60874241283392) [(16, 1)]
]

/-- Partial product 131 for generator 12. -/
def rs_R010_ueqv_R010NYY_partial_12_0131 : Poly :=
[
  term ((9184513182051 : Rat) / 30437120641696) [(0, 1), (2, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 60874241283392) [(0, 2), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(1, 1), (3, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 60874241283392) [(1, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(2, 1), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (16, 1)],
  term ((9184513182051 : Rat) / 60874241283392) [(12, 2), (16, 1)],
  term ((9184513182051 : Rat) / 60874241283392) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 12. -/
theorem rs_R010_ueqv_R010NYY_partial_12_0131_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_12_0131
        rs_R010_ueqv_R010NYY_generator_12_0100_0131 =
      rs_R010_ueqv_R010NYY_partial_12_0131 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_12_0100_0131 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_12_0100,
  rs_R010_ueqv_R010NYY_partial_12_0101,
  rs_R010_ueqv_R010NYY_partial_12_0102,
  rs_R010_ueqv_R010NYY_partial_12_0103,
  rs_R010_ueqv_R010NYY_partial_12_0104,
  rs_R010_ueqv_R010NYY_partial_12_0105,
  rs_R010_ueqv_R010NYY_partial_12_0106,
  rs_R010_ueqv_R010NYY_partial_12_0107,
  rs_R010_ueqv_R010NYY_partial_12_0108,
  rs_R010_ueqv_R010NYY_partial_12_0109,
  rs_R010_ueqv_R010NYY_partial_12_0110,
  rs_R010_ueqv_R010NYY_partial_12_0111,
  rs_R010_ueqv_R010NYY_partial_12_0112,
  rs_R010_ueqv_R010NYY_partial_12_0113,
  rs_R010_ueqv_R010NYY_partial_12_0114,
  rs_R010_ueqv_R010NYY_partial_12_0115,
  rs_R010_ueqv_R010NYY_partial_12_0116,
  rs_R010_ueqv_R010NYY_partial_12_0117,
  rs_R010_ueqv_R010NYY_partial_12_0118,
  rs_R010_ueqv_R010NYY_partial_12_0119,
  rs_R010_ueqv_R010NYY_partial_12_0120,
  rs_R010_ueqv_R010NYY_partial_12_0121,
  rs_R010_ueqv_R010NYY_partial_12_0122,
  rs_R010_ueqv_R010NYY_partial_12_0123,
  rs_R010_ueqv_R010NYY_partial_12_0124,
  rs_R010_ueqv_R010NYY_partial_12_0125,
  rs_R010_ueqv_R010NYY_partial_12_0126,
  rs_R010_ueqv_R010NYY_partial_12_0127,
  rs_R010_ueqv_R010NYY_partial_12_0128,
  rs_R010_ueqv_R010NYY_partial_12_0129,
  rs_R010_ueqv_R010NYY_partial_12_0130,
  rs_R010_ueqv_R010NYY_partial_12_0131
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_12_0100_0131 : Poly :=
[
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((483471987809343275445 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 1491418911443104) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-105391581736663592799 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((497327789089350457125 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3905239316688243184115 : Rat) / 33694136047322605568) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((33258853752903365 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 182622723850176) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((2043146571715817789 : Rat) / 143176215498537984) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((9719195013594023 : Rat) / 243496965133568) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(0, 1), (2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 106529922245936) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129407727066099759 : Rat) / 2982837822886208) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((96659410250578601 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-893650397921630687125 : Rat) / 12635301017745977088) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((3565722424790453374967 : Rat) / 50541204070983908352) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-130975715831619055 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((308307006418498407505 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-485206178528541194549 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-24905459124066212725 : Rat) / 1203362001690093056) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-669500262209960141 : Rat) / 35794053874634496) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1435530425385759329 : Rat) / 71588107749268992) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(0, 1), (2, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 2982837822886208) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((105391581736663592799 : Rat) / 8423534011830651392) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-497327789089350457125 : Rat) / 16847068023661302784) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3905239316688243184115 : Rat) / 67388272094645211136) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-33258853752903365 : Rat) / 5965675645772416) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2043146571715817789 : Rat) / 286352430997075968) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9719195013594023 : Rat) / 486993930267136) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 4211767005915325696) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 213059844491872) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((129407727066099759 : Rat) / 5965675645772416) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 11931351291544832) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3565722424790453374967 : Rat) / 101082408141967816704) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((130975715831619055 : Rat) / 11931351291544832) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-308307006418498407505 : Rat) / 8423534011830651392) [(0, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((485206178528541194549 : Rat) / 8423534011830651392) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((24905459124066212725 : Rat) / 2406724003380186112) [(0, 2), (11, 2), (16, 1)],
  term ((669500262209960141 : Rat) / 71588107749268992) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1435530425385759329 : Rat) / 143176215498537984) [(0, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 60874241283392) [(0, 2), (16, 1)],
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((483471987809343275445 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-105391581736663592799 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((497327789089350457125 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3905239316688243184115 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((33258853752903365 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 182622723850176) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((2043146571715817789 : Rat) / 143176215498537984) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((9719195013594023 : Rat) / 243496965133568) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 106529922245936) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129407727066099759 : Rat) / 2982837822886208) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((96659410250578601 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-893650397921630687125 : Rat) / 12635301017745977088) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((3565722424790453374967 : Rat) / 50541204070983908352) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-130975715831619055 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((308307006418498407505 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-485206178528541194549 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-24905459124066212725 : Rat) / 1203362001690093056) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-669500262209960141 : Rat) / 35794053874634496) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((1435530425385759329 : Rat) / 71588107749268992) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(1, 1), (3, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 2982837822886208) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((105391581736663592799 : Rat) / 8423534011830651392) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-497327789089350457125 : Rat) / 16847068023661302784) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3905239316688243184115 : Rat) / 67388272094645211136) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-33258853752903365 : Rat) / 5965675645772416) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2043146571715817789 : Rat) / 286352430997075968) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9719195013594023 : Rat) / 486993930267136) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 4211767005915325696) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 213059844491872) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((129407727066099759 : Rat) / 5965675645772416) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 11931351291544832) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3565722424790453374967 : Rat) / 101082408141967816704) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((130975715831619055 : Rat) / 11931351291544832) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-308307006418498407505 : Rat) / 8423534011830651392) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((485206178528541194549 : Rat) / 8423534011830651392) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((24905459124066212725 : Rat) / 2406724003380186112) [(1, 2), (11, 2), (16, 1)],
  term ((669500262209960141 : Rat) / 71588107749268992) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1435530425385759329 : Rat) / 143176215498537984) [(1, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 60874241283392) [(1, 2), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-483471987809343275445 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((105391581736663592799 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-497327789089350457125 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3905239316688243184115 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-33258853752903365 : Rat) / 2982837822886208) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 182622723850176) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2043146571715817789 : Rat) / 143176215498537984) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9719195013594023 : Rat) / 243496965133568) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(2, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 2105883502957662848) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((129407727066099759 : Rat) / 2982837822886208) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 5965675645772416) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((893650397921630687125 : Rat) / 12635301017745977088) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3565722424790453374967 : Rat) / 50541204070983908352) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((130975715831619055 : Rat) / 5965675645772416) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-308307006418498407505 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((485206178528541194549 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((24905459124066212725 : Rat) / 1203362001690093056) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((669500262209960141 : Rat) / 35794053874634496) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1435530425385759329 : Rat) / 71588107749268992) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(2, 1), (12, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 1491418911443104) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-497327789089350457125 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3905239316688243184115 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((105391581736663592799 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-2043146571715817789 : Rat) / 143176215498537984) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9719195013594023 : Rat) / 243496965133568) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-33258853752903365 : Rat) / 2982837822886208) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 182622723850176) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(3, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(3, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((454519041116426430531 : Rat) / 2105883502957662848) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((129407727066099759 : Rat) / 2982837822886208) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3565722424790453374967 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((130975715831619055 : Rat) / 5965675645772416) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-96659410250578601 : Rat) / 5965675645772416) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((893650397921630687125 : Rat) / 12635301017745977088) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((485206178528541194549 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((24905459124066212725 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-308307006418498407505 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1435530425385759329 : Rat) / 71588107749268992) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (16, 1)],
  term ((669500262209960141 : Rat) / 35794053874634496) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((69527544276797127 : Rat) / 2982837822886208) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 2982837822886208) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-105391581736663592799 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((497327789089350457125 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((3905239316688243184115 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((497327789089350457125 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((3905239316688243184115 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-105391581736663592799 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 3), (16, 1)],
  term ((33258853752903365 : Rat) / 5965675645772416) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((2043146571715817789 : Rat) / 286352430997075968) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((9719195013594023 : Rat) / 486993930267136) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((2043146571715817789 : Rat) / 286352430997075968) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((9719195013594023 : Rat) / 486993930267136) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((33258853752903365 : Rat) / 5965675645772416) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(9, 1), (13, 3), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-454519041116426430531 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-802906227816993 : Rat) / 213059844491872) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-129407727066099759 : Rat) / 5965675645772416) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-129407727066099759 : Rat) / 5965675645772416) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-802906227816993 : Rat) / 213059844491872) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((96659410250578601 : Rat) / 11931351291544832) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3565722424790453374967 : Rat) / 101082408141967816704) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-130975715831619055 : Rat) / 11931351291544832) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((3565722424790453374967 : Rat) / 101082408141967816704) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-130975715831619055 : Rat) / 11931351291544832) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((96659410250578601 : Rat) / 11931351291544832) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(11, 1), (13, 3), (16, 1)],
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-485206178528541194549 : Rat) / 8423534011830651392) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-24905459124066212725 : Rat) / 2406724003380186112) [(11, 2), (12, 2), (16, 1)],
  term ((-485206178528541194549 : Rat) / 8423534011830651392) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-24905459124066212725 : Rat) / 2406724003380186112) [(11, 2), (13, 2), (16, 1)],
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-669500262209960141 : Rat) / 71588107749268992) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1435530425385759329 : Rat) / 143176215498537984) [(12, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 60874241283392) [(12, 2), (16, 1)],
  term ((1435530425385759329 : Rat) / 143176215498537984) [(13, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 60874241283392) [(13, 2), (16, 1)],
  term ((-669500262209960141 : Rat) / 71588107749268992) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 131. -/
theorem rs_R010_ueqv_R010NYY_block_12_0100_0131_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_12_0100_0131
      rs_R010_ueqv_R010NYY_block_12_0100_0131 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
