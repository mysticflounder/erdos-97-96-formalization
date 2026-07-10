/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 4:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_04_0100_0199 : Poly :=
[
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0100 : Poly :=
[
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 4. -/
def ep_Q2_054_partial_04_0100 : Poly :=
[
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 4. -/
theorem ep_Q2_054_partial_04_0100_valid :
    mulPoly ep_Q2_054_coefficient_04_0100
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0101 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 101 for generator 4. -/
def ep_Q2_054_partial_04_0101 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 2), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 4. -/
theorem ep_Q2_054_partial_04_0101_valid :
    mulPoly ep_Q2_054_coefficient_04_0101
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0102 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 102 for generator 4. -/
def ep_Q2_054_partial_04_0102 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 4. -/
theorem ep_Q2_054_partial_04_0102_valid :
    mulPoly ep_Q2_054_coefficient_04_0102
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0103 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 103 for generator 4. -/
def ep_Q2_054_partial_04_0103 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (11, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (11, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 4. -/
theorem ep_Q2_054_partial_04_0103_valid :
    mulPoly ep_Q2_054_coefficient_04_0103
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0104 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 104 for generator 4. -/
def ep_Q2_054_partial_04_0104 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (11, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 4. -/
theorem ep_Q2_054_partial_04_0104_valid :
    mulPoly ep_Q2_054_coefficient_04_0104
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0105 : Poly :=
[
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 105 for generator 4. -/
def ep_Q2_054_partial_04_0105 : Poly :=
[
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (12, 1), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 4. -/
theorem ep_Q2_054_partial_04_0105_valid :
    mulPoly ep_Q2_054_coefficient_04_0105
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0106 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 106 for generator 4. -/
def ep_Q2_054_partial_04_0106 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 4. -/
theorem ep_Q2_054_partial_04_0106_valid :
    mulPoly ep_Q2_054_coefficient_04_0106
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0107 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 107 for generator 4. -/
def ep_Q2_054_partial_04_0107 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 4. -/
theorem ep_Q2_054_partial_04_0107_valid :
    mulPoly ep_Q2_054_coefficient_04_0107
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0108 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 108 for generator 4. -/
def ep_Q2_054_partial_04_0108 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 4. -/
theorem ep_Q2_054_partial_04_0108_valid :
    mulPoly ep_Q2_054_coefficient_04_0108
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0109 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 109 for generator 4. -/
def ep_Q2_054_partial_04_0109 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (9, 1), (11, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 4. -/
theorem ep_Q2_054_partial_04_0109_valid :
    mulPoly ep_Q2_054_coefficient_04_0109
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0110 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 110 for generator 4. -/
def ep_Q2_054_partial_04_0110 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (9, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (9, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 4. -/
theorem ep_Q2_054_partial_04_0110_valid :
    mulPoly ep_Q2_054_coefficient_04_0110
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0111 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 111 for generator 4. -/
def ep_Q2_054_partial_04_0111 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 3), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 4. -/
theorem ep_Q2_054_partial_04_0111_valid :
    mulPoly ep_Q2_054_coefficient_04_0111
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0112 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 112 for generator 4. -/
def ep_Q2_054_partial_04_0112 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 4. -/
theorem ep_Q2_054_partial_04_0112_valid :
    mulPoly ep_Q2_054_coefficient_04_0112
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0113 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 4. -/
def ep_Q2_054_partial_04_0113 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 4. -/
theorem ep_Q2_054_partial_04_0113_valid :
    mulPoly ep_Q2_054_coefficient_04_0113
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0114 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 114 for generator 4. -/
def ep_Q2_054_partial_04_0114 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 4. -/
theorem ep_Q2_054_partial_04_0114_valid :
    mulPoly ep_Q2_054_coefficient_04_0114
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0115 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 115 for generator 4. -/
def ep_Q2_054_partial_04_0115 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 4. -/
theorem ep_Q2_054_partial_04_0115_valid :
    mulPoly ep_Q2_054_coefficient_04_0115
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0116 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 116 for generator 4. -/
def ep_Q2_054_partial_04_0116 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 4. -/
theorem ep_Q2_054_partial_04_0116_valid :
    mulPoly ep_Q2_054_coefficient_04_0116
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0117 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 4. -/
def ep_Q2_054_partial_04_0117 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 4. -/
theorem ep_Q2_054_partial_04_0117_valid :
    mulPoly ep_Q2_054_coefficient_04_0117
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0118 : Poly :=
[
  term ((-7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 118 for generator 4. -/
def ep_Q2_054_partial_04_0118 : Poly :=
[
  term ((-7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((-7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 4. -/
theorem ep_Q2_054_partial_04_0118_valid :
    mulPoly ep_Q2_054_coefficient_04_0118
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0119 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)]
]

/-- Partial product 119 for generator 4. -/
def ep_Q2_054_partial_04_0119 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 4. -/
theorem ep_Q2_054_partial_04_0119_valid :
    mulPoly ep_Q2_054_coefficient_04_0119
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0120 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 4. -/
def ep_Q2_054_partial_04_0120 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 4. -/
theorem ep_Q2_054_partial_04_0120_valid :
    mulPoly ep_Q2_054_coefficient_04_0120
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0121 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 121 for generator 4. -/
def ep_Q2_054_partial_04_0121 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 4. -/
theorem ep_Q2_054_partial_04_0121_valid :
    mulPoly ep_Q2_054_coefficient_04_0121
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0122 : Poly :=
[
  term ((-1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 122 for generator 4. -/
def ep_Q2_054_partial_04_0122 : Poly :=
[
  term ((-1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (12, 1), (15, 1)],
  term ((-1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (12, 1), (15, 1)],
  term ((1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 4. -/
theorem ep_Q2_054_partial_04_0122_valid :
    mulPoly ep_Q2_054_coefficient_04_0122
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0123 : Poly :=
[
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 4. -/
def ep_Q2_054_partial_04_0123 : Poly :=
[
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 4. -/
theorem ep_Q2_054_partial_04_0123_valid :
    mulPoly ep_Q2_054_coefficient_04_0123
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0124 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)]
]

/-- Partial product 124 for generator 4. -/
def ep_Q2_054_partial_04_0124 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 4. -/
theorem ep_Q2_054_partial_04_0124_valid :
    mulPoly ep_Q2_054_coefficient_04_0124
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0125 : Poly :=
[
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 4. -/
def ep_Q2_054_partial_04_0125 : Poly :=
[
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 4. -/
theorem ep_Q2_054_partial_04_0125_valid :
    mulPoly ep_Q2_054_coefficient_04_0125
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0126 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 126 for generator 4. -/
def ep_Q2_054_partial_04_0126 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 4. -/
theorem ep_Q2_054_partial_04_0126_valid :
    mulPoly ep_Q2_054_coefficient_04_0126
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0127 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 4. -/
def ep_Q2_054_partial_04_0127 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 4. -/
theorem ep_Q2_054_partial_04_0127_valid :
    mulPoly ep_Q2_054_coefficient_04_0127
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0128 : Poly :=
[
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1)]
]

/-- Partial product 128 for generator 4. -/
def ep_Q2_054_partial_04_0128 : Poly :=
[
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (4, 2)],
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (5, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 4. -/
theorem ep_Q2_054_partial_04_0128_valid :
    mulPoly ep_Q2_054_coefficient_04_0128
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0129 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 129 for generator 4. -/
def ep_Q2_054_partial_04_0129 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (4, 2), (5, 1), (7, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 2), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (11, 2), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 4. -/
theorem ep_Q2_054_partial_04_0129_valid :
    mulPoly ep_Q2_054_coefficient_04_0129
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0130 : Poly :=
[
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 130 for generator 4. -/
def ep_Q2_054_partial_04_0130 : Poly :=
[
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (4, 2), (6, 1), (7, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (5, 2), (6, 1), (7, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 2)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 4. -/
theorem ep_Q2_054_partial_04_0130_valid :
    mulPoly ep_Q2_054_coefficient_04_0130
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0131 : Poly :=
[
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)]
]

/-- Partial product 131 for generator 4. -/
def ep_Q2_054_partial_04_0131 : Poly :=
[
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (4, 2), (6, 1), (7, 1), (10, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (5, 2), (6, 1), (7, 1), (10, 1)],
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 2)],
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 4. -/
theorem ep_Q2_054_partial_04_0131_valid :
    mulPoly ep_Q2_054_coefficient_04_0131
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0132 : Poly :=
[
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 132 for generator 4. -/
def ep_Q2_054_partial_04_0132 : Poly :=
[
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (4, 2), (6, 1), (10, 1), (15, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (5, 2), (6, 1), (10, 1), (15, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 4. -/
theorem ep_Q2_054_partial_04_0132_valid :
    mulPoly ep_Q2_054_coefficient_04_0132
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0133 : Poly :=
[
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 133 for generator 4. -/
def ep_Q2_054_partial_04_0133 : Poly :=
[
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (4, 2), (6, 1), (11, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (5, 2), (6, 1), (11, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (10, 2), (11, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 4. -/
theorem ep_Q2_054_partial_04_0133_valid :
    mulPoly ep_Q2_054_coefficient_04_0133
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0134 : Poly :=
[
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 134 for generator 4. -/
def ep_Q2_054_partial_04_0134 : Poly :=
[
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (4, 2), (6, 1), (13, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (5, 2), (6, 1), (13, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 4. -/
theorem ep_Q2_054_partial_04_0134_valid :
    mulPoly ep_Q2_054_coefficient_04_0134
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0135 : Poly :=
[
  term ((-6630106352850 : Rat) / 45033486517) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 135 for generator 4. -/
def ep_Q2_054_partial_04_0135 : Poly :=
[
  term ((-6630106352850 : Rat) / 45033486517) [(1, 1), (4, 2), (6, 1), (15, 1)],
  term ((-6630106352850 : Rat) / 45033486517) [(1, 1), (5, 2), (6, 1), (15, 1)],
  term ((6630106352850 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((6630106352850 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 4. -/
theorem ep_Q2_054_partial_04_0135_valid :
    mulPoly ep_Q2_054_coefficient_04_0135
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0136 : Poly :=
[
  term ((-3232059182640 : Rat) / 45033486517) [(1, 1), (7, 1)]
]

/-- Partial product 136 for generator 4. -/
def ep_Q2_054_partial_04_0136 : Poly :=
[
  term ((-3232059182640 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1)],
  term ((-3232059182640 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1)],
  term ((3232059182640 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2)],
  term ((3232059182640 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 4. -/
theorem ep_Q2_054_partial_04_0136_valid :
    mulPoly ep_Q2_054_coefficient_04_0136
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0137 : Poly :=
[
  term ((984442986432 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 137 for generator 4. -/
def ep_Q2_054_partial_04_0137 : Poly :=
[
  term ((984442986432 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1)],
  term ((984442986432 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1)],
  term ((-984442986432 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term ((-984442986432 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 4. -/
theorem ep_Q2_054_partial_04_0137_valid :
    mulPoly ep_Q2_054_coefficient_04_0137
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0138 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 138 for generator 4. -/
def ep_Q2_054_partial_04_0138 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 4. -/
theorem ep_Q2_054_partial_04_0138_valid :
    mulPoly ep_Q2_054_coefficient_04_0138
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0139 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 139 for generator 4. -/
def ep_Q2_054_partial_04_0139 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 4. -/
theorem ep_Q2_054_partial_04_0139_valid :
    mulPoly ep_Q2_054_coefficient_04_0139
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0140 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 140 for generator 4. -/
def ep_Q2_054_partial_04_0140 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (11, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (11, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (11, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 4. -/
theorem ep_Q2_054_partial_04_0140_valid :
    mulPoly ep_Q2_054_coefficient_04_0140
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0141 : Poly :=
[
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 141 for generator 4. -/
def ep_Q2_054_partial_04_0141 : Poly :=
[
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (12, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (12, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (12, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 4. -/
theorem ep_Q2_054_partial_04_0141_valid :
    mulPoly ep_Q2_054_coefficient_04_0141
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0142 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 142 for generator 4. -/
def ep_Q2_054_partial_04_0142 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 4. -/
theorem ep_Q2_054_partial_04_0142_valid :
    mulPoly ep_Q2_054_coefficient_04_0142
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0143 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 143 for generator 4. -/
def ep_Q2_054_partial_04_0143 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 3)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 4. -/
theorem ep_Q2_054_partial_04_0143_valid :
    mulPoly ep_Q2_054_coefficient_04_0143
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0144 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 144 for generator 4. -/
def ep_Q2_054_partial_04_0144 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 4. -/
theorem ep_Q2_054_partial_04_0144_valid :
    mulPoly ep_Q2_054_coefficient_04_0144
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0145 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 145 for generator 4. -/
def ep_Q2_054_partial_04_0145 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (9, 1), (11, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 4. -/
theorem ep_Q2_054_partial_04_0145_valid :
    mulPoly ep_Q2_054_coefficient_04_0145
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0146 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 146 for generator 4. -/
def ep_Q2_054_partial_04_0146 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (9, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 4. -/
theorem ep_Q2_054_partial_04_0146_valid :
    mulPoly ep_Q2_054_coefficient_04_0146
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0147 : Poly :=
[
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 147 for generator 4. -/
def ep_Q2_054_partial_04_0147 : Poly :=
[
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (4, 2), (7, 1), (10, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (5, 2), (7, 1), (10, 1)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 4. -/
theorem ep_Q2_054_partial_04_0147_valid :
    mulPoly ep_Q2_054_coefficient_04_0147
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0148 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 148 for generator 4. -/
def ep_Q2_054_partial_04_0148 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 3), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 4. -/
theorem ep_Q2_054_partial_04_0148_valid :
    mulPoly ep_Q2_054_coefficient_04_0148
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0149 : Poly :=
[
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 149 for generator 4. -/
def ep_Q2_054_partial_04_0149 : Poly :=
[
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (12, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (12, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (12, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 4. -/
theorem ep_Q2_054_partial_04_0149_valid :
    mulPoly ep_Q2_054_coefficient_04_0149
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0150 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 150 for generator 4. -/
def ep_Q2_054_partial_04_0150 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 4. -/
theorem ep_Q2_054_partial_04_0150_valid :
    mulPoly ep_Q2_054_coefficient_04_0150
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0151 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 151 for generator 4. -/
def ep_Q2_054_partial_04_0151 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 4. -/
theorem ep_Q2_054_partial_04_0151_valid :
    mulPoly ep_Q2_054_coefficient_04_0151
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0152 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 4. -/
def ep_Q2_054_partial_04_0152 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 4. -/
theorem ep_Q2_054_partial_04_0152_valid :
    mulPoly ep_Q2_054_coefficient_04_0152
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0153 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 153 for generator 4. -/
def ep_Q2_054_partial_04_0153 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 4. -/
theorem ep_Q2_054_partial_04_0153_valid :
    mulPoly ep_Q2_054_coefficient_04_0153
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0154 : Poly :=
[
  term ((-2125519719525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 154 for generator 4. -/
def ep_Q2_054_partial_04_0154 : Poly :=
[
  term ((-2125519719525 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (11, 1), (13, 1)],
  term ((-2125519719525 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (11, 1), (13, 1)],
  term ((2125519719525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((2125519719525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 4. -/
theorem ep_Q2_054_partial_04_0154_valid :
    mulPoly ep_Q2_054_coefficient_04_0154
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0155 : Poly :=
[
  term ((1320144819525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 155 for generator 4. -/
def ep_Q2_054_partial_04_0155 : Poly :=
[
  term ((1320144819525 : Rat) / 90066973034) [(1, 1), (4, 2), (7, 1), (11, 1), (15, 1)],
  term ((1320144819525 : Rat) / 90066973034) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1)],
  term ((-1320144819525 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1320144819525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 4. -/
theorem ep_Q2_054_partial_04_0155_valid :
    mulPoly ep_Q2_054_coefficient_04_0155
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0156 : Poly :=
[
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 4. -/
def ep_Q2_054_partial_04_0156 : Poly :=
[
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 4. -/
theorem ep_Q2_054_partial_04_0156_valid :
    mulPoly ep_Q2_054_coefficient_04_0156
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0157 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)]
]

/-- Partial product 157 for generator 4. -/
def ep_Q2_054_partial_04_0157 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (11, 2)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (11, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (11, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 4. -/
theorem ep_Q2_054_partial_04_0157_valid :
    mulPoly ep_Q2_054_coefficient_04_0157
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0158 : Poly :=
[
  term ((5903647716375 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 158 for generator 4. -/
def ep_Q2_054_partial_04_0158 : Poly :=
[
  term ((5903647716375 : Rat) / 180133946068) [(1, 1), (4, 2), (7, 1), (12, 1)],
  term ((5903647716375 : Rat) / 180133946068) [(1, 1), (5, 2), (7, 1), (12, 1)],
  term ((-5903647716375 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 2), (12, 1)],
  term ((-5903647716375 : Rat) / 180133946068) [(1, 1), (7, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 4. -/
theorem ep_Q2_054_partial_04_0158_valid :
    mulPoly ep_Q2_054_coefficient_04_0158
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0159 : Poly :=
[
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 159 for generator 4. -/
def ep_Q2_054_partial_04_0159 : Poly :=
[
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (12, 1), (16, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 4. -/
theorem ep_Q2_054_partial_04_0159_valid :
    mulPoly ep_Q2_054_coefficient_04_0159
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0160 : Poly :=
[
  term ((60895923876 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 160 for generator 4. -/
def ep_Q2_054_partial_04_0160 : Poly :=
[
  term ((60895923876 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1)],
  term ((60895923876 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((-60895923876 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-60895923876 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 4. -/
theorem ep_Q2_054_partial_04_0160_valid :
    mulPoly ep_Q2_054_coefficient_04_0160
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0161 : Poly :=
[
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 4. -/
def ep_Q2_054_partial_04_0161 : Poly :=
[
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 4. -/
theorem ep_Q2_054_partial_04_0161_valid :
    mulPoly ep_Q2_054_coefficient_04_0161
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0162 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 162 for generator 4. -/
def ep_Q2_054_partial_04_0162 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 4. -/
theorem ep_Q2_054_partial_04_0162_valid :
    mulPoly ep_Q2_054_coefficient_04_0162
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0163 : Poly :=
[
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 163 for generator 4. -/
def ep_Q2_054_partial_04_0163 : Poly :=
[
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (9, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (9, 1)],
  term ((784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 4. -/
theorem ep_Q2_054_partial_04_0163_valid :
    mulPoly ep_Q2_054_coefficient_04_0163
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0164 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 164 for generator 4. -/
def ep_Q2_054_partial_04_0164 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (10, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 4. -/
theorem ep_Q2_054_partial_04_0164_valid :
    mulPoly ep_Q2_054_coefficient_04_0164
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0165 : Poly :=
[
  term ((2707525550673 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 165 for generator 4. -/
def ep_Q2_054_partial_04_0165 : Poly :=
[
  term ((2707525550673 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (11, 1)],
  term ((2707525550673 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (11, 1)],
  term ((-2707525550673 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((-2707525550673 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 4. -/
theorem ep_Q2_054_partial_04_0165_valid :
    mulPoly ep_Q2_054_coefficient_04_0165
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0166 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 166 for generator 4. -/
def ep_Q2_054_partial_04_0166 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 4. -/
theorem ep_Q2_054_partial_04_0166_valid :
    mulPoly ep_Q2_054_coefficient_04_0166
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0167 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 167 for generator 4. -/
def ep_Q2_054_partial_04_0167 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 4. -/
theorem ep_Q2_054_partial_04_0167_valid :
    mulPoly ep_Q2_054_coefficient_04_0167
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0168 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 168 for generator 4. -/
def ep_Q2_054_partial_04_0168 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (11, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (11, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 4. -/
theorem ep_Q2_054_partial_04_0168_valid :
    mulPoly ep_Q2_054_coefficient_04_0168
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0169 : Poly :=
[
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 169 for generator 4. -/
def ep_Q2_054_partial_04_0169 : Poly :=
[
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (12, 1), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 4. -/
theorem ep_Q2_054_partial_04_0169_valid :
    mulPoly ep_Q2_054_coefficient_04_0169
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0170 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 170 for generator 4. -/
def ep_Q2_054_partial_04_0170 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 4. -/
theorem ep_Q2_054_partial_04_0170_valid :
    mulPoly ep_Q2_054_coefficient_04_0170
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0171 : Poly :=
[
  term ((6496485066000 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 171 for generator 4. -/
def ep_Q2_054_partial_04_0171 : Poly :=
[
  term ((6496485066000 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (15, 1)],
  term ((6496485066000 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((-6496485066000 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-6496485066000 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 4. -/
theorem ep_Q2_054_partial_04_0171_valid :
    mulPoly ep_Q2_054_coefficient_04_0171
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0172 : Poly :=
[
  term ((2329271748027 : Rat) / 45033486517) [(1, 1), (9, 1)]
]

/-- Partial product 172 for generator 4. -/
def ep_Q2_054_partial_04_0172 : Poly :=
[
  term ((2329271748027 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1)],
  term ((2329271748027 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1)],
  term ((-2329271748027 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2)],
  term ((-2329271748027 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 4. -/
theorem ep_Q2_054_partial_04_0172_valid :
    mulPoly ep_Q2_054_coefficient_04_0172
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0173 : Poly :=
[
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 173 for generator 4. -/
def ep_Q2_054_partial_04_0173 : Poly :=
[
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (10, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (10, 1)],
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 4. -/
theorem ep_Q2_054_partial_04_0173_valid :
    mulPoly ep_Q2_054_coefficient_04_0173
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0174 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 174 for generator 4. -/
def ep_Q2_054_partial_04_0174 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 4. -/
theorem ep_Q2_054_partial_04_0174_valid :
    mulPoly ep_Q2_054_coefficient_04_0174
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0175 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 175 for generator 4. -/
def ep_Q2_054_partial_04_0175 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 4. -/
theorem ep_Q2_054_partial_04_0175_valid :
    mulPoly ep_Q2_054_coefficient_04_0175
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0176 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 176 for generator 4. -/
def ep_Q2_054_partial_04_0176 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (11, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 4. -/
theorem ep_Q2_054_partial_04_0176_valid :
    mulPoly ep_Q2_054_coefficient_04_0176
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0177 : Poly :=
[
  term ((555631216434 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 177 for generator 4. -/
def ep_Q2_054_partial_04_0177 : Poly :=
[
  term ((555631216434 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (12, 1)],
  term ((555631216434 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (12, 1)],
  term ((-555631216434 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((-555631216434 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 4. -/
theorem ep_Q2_054_partial_04_0177_valid :
    mulPoly ep_Q2_054_coefficient_04_0177
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0178 : Poly :=
[
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 178 for generator 4. -/
def ep_Q2_054_partial_04_0178 : Poly :=
[
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (13, 1), (15, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 4. -/
theorem ep_Q2_054_partial_04_0178_valid :
    mulPoly ep_Q2_054_coefficient_04_0178
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0179 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 179 for generator 4. -/
def ep_Q2_054_partial_04_0179 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (11, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (11, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 4. -/
theorem ep_Q2_054_partial_04_0179_valid :
    mulPoly ep_Q2_054_coefficient_04_0179
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0180 : Poly :=
[
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 180 for generator 4. -/
def ep_Q2_054_partial_04_0180 : Poly :=
[
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (12, 1), (15, 1)],
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (12, 1), (15, 1)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 4. -/
theorem ep_Q2_054_partial_04_0180_valid :
    mulPoly ep_Q2_054_coefficient_04_0180
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0181 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 4. -/
def ep_Q2_054_partial_04_0181 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 4. -/
theorem ep_Q2_054_partial_04_0181_valid :
    mulPoly ep_Q2_054_coefficient_04_0181
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0182 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 182 for generator 4. -/
def ep_Q2_054_partial_04_0182 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 4. -/
theorem ep_Q2_054_partial_04_0182_valid :
    mulPoly ep_Q2_054_coefficient_04_0182
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0183 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 183 for generator 4. -/
def ep_Q2_054_partial_04_0183 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 4. -/
theorem ep_Q2_054_partial_04_0183_valid :
    mulPoly ep_Q2_054_coefficient_04_0183
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0184 : Poly :=
[
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 184 for generator 4. -/
def ep_Q2_054_partial_04_0184 : Poly :=
[
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (4, 2), (10, 1), (15, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (5, 2), (10, 1), (15, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 4. -/
theorem ep_Q2_054_partial_04_0184_valid :
    mulPoly ep_Q2_054_coefficient_04_0184
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0185 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 4. -/
def ep_Q2_054_partial_04_0185 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 4. -/
theorem ep_Q2_054_partial_04_0185_valid :
    mulPoly ep_Q2_054_coefficient_04_0185
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0186 : Poly :=
[
  term ((-1706219567313 : Rat) / 45033486517) [(1, 1), (11, 1)]
]

/-- Partial product 186 for generator 4. -/
def ep_Q2_054_partial_04_0186 : Poly :=
[
  term ((-1706219567313 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 1)],
  term ((-1706219567313 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 1)],
  term ((1706219567313 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1)],
  term ((1706219567313 : Rat) / 45033486517) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 4. -/
theorem ep_Q2_054_partial_04_0186_valid :
    mulPoly ep_Q2_054_coefficient_04_0186
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0187 : Poly :=
[
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 187 for generator 4. -/
def ep_Q2_054_partial_04_0187 : Poly :=
[
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 4. -/
theorem ep_Q2_054_partial_04_0187_valid :
    mulPoly ep_Q2_054_coefficient_04_0187
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0188 : Poly :=
[
  term ((15759265210314 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 188 for generator 4. -/
def ep_Q2_054_partial_04_0188 : Poly :=
[
  term ((15759265210314 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((15759265210314 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((-15759265210314 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-15759265210314 : Rat) / 45033486517) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 4. -/
theorem ep_Q2_054_partial_04_0188_valid :
    mulPoly ep_Q2_054_coefficient_04_0188
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0189 : Poly :=
[
  term ((-4139021676927 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 189 for generator 4. -/
def ep_Q2_054_partial_04_0189 : Poly :=
[
  term ((-4139021676927 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 1), (15, 2)],
  term ((-4139021676927 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 1), (15, 2)],
  term ((4139021676927 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((4139021676927 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 4. -/
theorem ep_Q2_054_partial_04_0189_valid :
    mulPoly ep_Q2_054_coefficient_04_0189
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0190 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 190 for generator 4. -/
def ep_Q2_054_partial_04_0190 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 4. -/
theorem ep_Q2_054_partial_04_0190_valid :
    mulPoly ep_Q2_054_coefficient_04_0190
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0191 : Poly :=
[
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 191 for generator 4. -/
def ep_Q2_054_partial_04_0191 : Poly :=
[
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 4. -/
theorem ep_Q2_054_partial_04_0191_valid :
    mulPoly ep_Q2_054_coefficient_04_0191
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0192 : Poly :=
[
  term ((-23224122397341 : Rat) / 180133946068) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 192 for generator 4. -/
def ep_Q2_054_partial_04_0192 : Poly :=
[
  term ((-23224122397341 : Rat) / 180133946068) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((-23224122397341 : Rat) / 180133946068) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((23224122397341 : Rat) / 180133946068) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((23224122397341 : Rat) / 180133946068) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 4. -/
theorem ep_Q2_054_partial_04_0192_valid :
    mulPoly ep_Q2_054_coefficient_04_0192
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0193 : Poly :=
[
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 4. -/
def ep_Q2_054_partial_04_0193 : Poly :=
[
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 4. -/
theorem ep_Q2_054_partial_04_0193_valid :
    mulPoly ep_Q2_054_coefficient_04_0193
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0194 : Poly :=
[
  term ((17337360283323 : Rat) / 360267892136) [(1, 1), (13, 1)]
]

/-- Partial product 194 for generator 4. -/
def ep_Q2_054_partial_04_0194 : Poly :=
[
  term ((17337360283323 : Rat) / 360267892136) [(1, 1), (4, 2), (13, 1)],
  term ((17337360283323 : Rat) / 360267892136) [(1, 1), (5, 2), (13, 1)],
  term ((-17337360283323 : Rat) / 360267892136) [(1, 1), (10, 2), (13, 1)],
  term ((-17337360283323 : Rat) / 360267892136) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 4. -/
theorem ep_Q2_054_partial_04_0194_valid :
    mulPoly ep_Q2_054_coefficient_04_0194
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0195 : Poly :=
[
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 195 for generator 4. -/
def ep_Q2_054_partial_04_0195 : Poly :=
[
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (4, 2), (13, 1), (15, 2)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (5, 2), (13, 1), (15, 2)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 4. -/
theorem ep_Q2_054_partial_04_0195_valid :
    mulPoly ep_Q2_054_coefficient_04_0195
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0196 : Poly :=
[
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 196 for generator 4. -/
def ep_Q2_054_partial_04_0196 : Poly :=
[
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 4. -/
theorem ep_Q2_054_partial_04_0196_valid :
    mulPoly ep_Q2_054_coefficient_04_0196
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0197 : Poly :=
[
  term ((2115901131120 : Rat) / 45033486517) [(1, 1), (15, 1)]
]

/-- Partial product 197 for generator 4. -/
def ep_Q2_054_partial_04_0197 : Poly :=
[
  term ((2115901131120 : Rat) / 45033486517) [(1, 1), (4, 2), (15, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(1, 1), (5, 2), (15, 1)],
  term ((-2115901131120 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1)],
  term ((-2115901131120 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 4. -/
theorem ep_Q2_054_partial_04_0197_valid :
    mulPoly ep_Q2_054_coefficient_04_0197
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0198 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 4. -/
def ep_Q2_054_partial_04_0198 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 4. -/
theorem ep_Q2_054_partial_04_0198_valid :
    mulPoly ep_Q2_054_coefficient_04_0198
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0199 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 2)]
]

/-- Partial product 199 for generator 4. -/
def ep_Q2_054_partial_04_0199 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (4, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (5, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (10, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 4. -/
theorem ep_Q2_054_partial_04_0199_valid :
    mulPoly ep_Q2_054_coefficient_04_0199
        ep_Q2_054_generator_04_0100_0199 =
      ep_Q2_054_partial_04_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_04_0100_0199 : List Poly :=
[
  ep_Q2_054_partial_04_0100,
  ep_Q2_054_partial_04_0101,
  ep_Q2_054_partial_04_0102,
  ep_Q2_054_partial_04_0103,
  ep_Q2_054_partial_04_0104,
  ep_Q2_054_partial_04_0105,
  ep_Q2_054_partial_04_0106,
  ep_Q2_054_partial_04_0107,
  ep_Q2_054_partial_04_0108,
  ep_Q2_054_partial_04_0109,
  ep_Q2_054_partial_04_0110,
  ep_Q2_054_partial_04_0111,
  ep_Q2_054_partial_04_0112,
  ep_Q2_054_partial_04_0113,
  ep_Q2_054_partial_04_0114,
  ep_Q2_054_partial_04_0115,
  ep_Q2_054_partial_04_0116,
  ep_Q2_054_partial_04_0117,
  ep_Q2_054_partial_04_0118,
  ep_Q2_054_partial_04_0119,
  ep_Q2_054_partial_04_0120,
  ep_Q2_054_partial_04_0121,
  ep_Q2_054_partial_04_0122,
  ep_Q2_054_partial_04_0123,
  ep_Q2_054_partial_04_0124,
  ep_Q2_054_partial_04_0125,
  ep_Q2_054_partial_04_0126,
  ep_Q2_054_partial_04_0127,
  ep_Q2_054_partial_04_0128,
  ep_Q2_054_partial_04_0129,
  ep_Q2_054_partial_04_0130,
  ep_Q2_054_partial_04_0131,
  ep_Q2_054_partial_04_0132,
  ep_Q2_054_partial_04_0133,
  ep_Q2_054_partial_04_0134,
  ep_Q2_054_partial_04_0135,
  ep_Q2_054_partial_04_0136,
  ep_Q2_054_partial_04_0137,
  ep_Q2_054_partial_04_0138,
  ep_Q2_054_partial_04_0139,
  ep_Q2_054_partial_04_0140,
  ep_Q2_054_partial_04_0141,
  ep_Q2_054_partial_04_0142,
  ep_Q2_054_partial_04_0143,
  ep_Q2_054_partial_04_0144,
  ep_Q2_054_partial_04_0145,
  ep_Q2_054_partial_04_0146,
  ep_Q2_054_partial_04_0147,
  ep_Q2_054_partial_04_0148,
  ep_Q2_054_partial_04_0149,
  ep_Q2_054_partial_04_0150,
  ep_Q2_054_partial_04_0151,
  ep_Q2_054_partial_04_0152,
  ep_Q2_054_partial_04_0153,
  ep_Q2_054_partial_04_0154,
  ep_Q2_054_partial_04_0155,
  ep_Q2_054_partial_04_0156,
  ep_Q2_054_partial_04_0157,
  ep_Q2_054_partial_04_0158,
  ep_Q2_054_partial_04_0159,
  ep_Q2_054_partial_04_0160,
  ep_Q2_054_partial_04_0161,
  ep_Q2_054_partial_04_0162,
  ep_Q2_054_partial_04_0163,
  ep_Q2_054_partial_04_0164,
  ep_Q2_054_partial_04_0165,
  ep_Q2_054_partial_04_0166,
  ep_Q2_054_partial_04_0167,
  ep_Q2_054_partial_04_0168,
  ep_Q2_054_partial_04_0169,
  ep_Q2_054_partial_04_0170,
  ep_Q2_054_partial_04_0171,
  ep_Q2_054_partial_04_0172,
  ep_Q2_054_partial_04_0173,
  ep_Q2_054_partial_04_0174,
  ep_Q2_054_partial_04_0175,
  ep_Q2_054_partial_04_0176,
  ep_Q2_054_partial_04_0177,
  ep_Q2_054_partial_04_0178,
  ep_Q2_054_partial_04_0179,
  ep_Q2_054_partial_04_0180,
  ep_Q2_054_partial_04_0181,
  ep_Q2_054_partial_04_0182,
  ep_Q2_054_partial_04_0183,
  ep_Q2_054_partial_04_0184,
  ep_Q2_054_partial_04_0185,
  ep_Q2_054_partial_04_0186,
  ep_Q2_054_partial_04_0187,
  ep_Q2_054_partial_04_0188,
  ep_Q2_054_partial_04_0189,
  ep_Q2_054_partial_04_0190,
  ep_Q2_054_partial_04_0191,
  ep_Q2_054_partial_04_0192,
  ep_Q2_054_partial_04_0193,
  ep_Q2_054_partial_04_0194,
  ep_Q2_054_partial_04_0195,
  ep_Q2_054_partial_04_0196,
  ep_Q2_054_partial_04_0197,
  ep_Q2_054_partial_04_0198,
  ep_Q2_054_partial_04_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_04_0100_0199 : Poly :=
[
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (11, 2), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (12, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (8, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (9, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (9, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (13, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (11, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((-1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (12, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (13, 1), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (11, 2), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (8, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (9, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (13, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (11, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((-1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (12, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (13, 1), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 2), (16, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 3), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 4), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 3), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 3), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 3), (15, 2)],
  term ((7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 2), (15, 1)],
  term ((1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (13, 1), (15, 2)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (12, 1), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (13, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 3), (15, 1), (16, 1)],
  term ((1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((7707925549080 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 3), (13, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 3), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 3), (15, 2), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 4), (15, 1)],
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (4, 2)],
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (5, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (4, 2), (5, 1), (7, 1), (13, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (4, 2), (6, 1), (7, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (4, 2), (6, 1), (7, 1), (10, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (4, 2), (6, 1), (10, 1), (15, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (4, 2), (6, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (4, 2), (6, 1), (13, 1)],
  term ((-6630106352850 : Rat) / 45033486517) [(1, 1), (4, 2), (6, 1), (15, 1)],
  term ((-3232059182640 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1)],
  term ((984442986432 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (11, 2)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (12, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (9, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (9, 1), (13, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (4, 2), (7, 1), (10, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (12, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term ((-2125519719525 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (11, 1), (13, 1)],
  term ((1320144819525 : Rat) / 90066973034) [(1, 1), (4, 2), (7, 1), (11, 1), (15, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (11, 2)],
  term ((5903647716375 : Rat) / 180133946068) [(1, 1), (4, 2), (7, 1), (12, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (12, 1), (16, 1)],
  term ((60895923876 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (10, 1), (15, 1)],
  term ((2707525550673 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (11, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (11, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (11, 2), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (12, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (13, 1), (15, 2)],
  term ((6496485066000 : Rat) / 45033486517) [(1, 1), (4, 2), (8, 1), (15, 1)],
  term ((2329271748027 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (10, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (11, 1), (15, 1)],
  term ((555631216434 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (12, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (4, 2), (9, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (11, 1), (15, 2)],
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (12, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (13, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (4, 2), (10, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1706219567313 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((15759265210314 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((-4139021676927 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((-23224122397341 : Rat) / 180133946068) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((17337360283323 : Rat) / 360267892136) [(1, 1), (4, 2), (13, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (4, 2), (13, 1), (15, 2)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(1, 1), (4, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 2), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (11, 2), (13, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (5, 2), (6, 1), (7, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (5, 2), (6, 1), (7, 1), (10, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (5, 2), (6, 1), (10, 1), (15, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (5, 2), (6, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (5, 2), (6, 1), (13, 1)],
  term ((-6630106352850 : Rat) / 45033486517) [(1, 1), (5, 2), (6, 1), (15, 1)],
  term ((-3232059182640 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1)],
  term ((984442986432 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (11, 2)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (12, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (5, 2), (7, 1), (10, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (12, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-2125519719525 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (11, 1), (13, 1)],
  term ((1320144819525 : Rat) / 90066973034) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (11, 2)],
  term ((5903647716375 : Rat) / 180133946068) [(1, 1), (5, 2), (7, 1), (12, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((60895923876 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1)],
  term ((2707525550673 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (11, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (11, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (11, 2), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (13, 1), (15, 2)],
  term ((6496485066000 : Rat) / 45033486517) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((2329271748027 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (10, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1)],
  term ((555631216434 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (12, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (11, 1), (15, 2)],
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (12, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (13, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (5, 2), (10, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1706219567313 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((15759265210314 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((-4139021676927 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((-23224122397341 : Rat) / 180133946068) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((17337360283323 : Rat) / 360267892136) [(1, 1), (5, 2), (13, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (5, 2), (13, 1), (15, 2)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(1, 1), (5, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 3), (7, 1), (13, 1)],
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 2)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 2)],
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 3)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (10, 2), (11, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((6630106352850 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 3), (15, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((6630106352850 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 3)],
  term ((-984442986432 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (11, 2)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (12, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-984442986432 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 3), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 3), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 4)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 3)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 3), (11, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 3), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 3)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (12, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 3), (15, 1)],
  term ((3232059182640 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2)],
  term ((2125519719525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((-1320144819525 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (11, 2)],
  term ((-5903647716375 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 2), (12, 1)],
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((-60895923876 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 3)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (11, 1), (15, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (12, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (12, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (13, 1), (15, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 3), (16, 1)],
  term ((3232059182640 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)],
  term ((-5903647716375 : Rat) / 180133946068) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-60895923876 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((2125519719525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 3), (13, 1)],
  term ((-1320144819525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 3), (15, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 4)],
  term ((784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2707525550673 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-6496485066000 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 3), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-6496485066000 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-2707525550673 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 4), (15, 1)],
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-2329271748027 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-555631216434 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 3)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 3), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 3), (13, 1), (15, 1)],
  term ((-2329271748027 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2)],
  term ((-555631216434 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((1706219567313 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-15759265210314 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((4139021676927 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((23224122397341 : Rat) / 180133946068) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-17337360283323 : Rat) / 360267892136) [(1, 1), (10, 2), (13, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2115901131120 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 3), (11, 1), (15, 2)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 3), (12, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 3), (12, 1), (15, 1), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 3), (13, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 3), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (10, 3), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((23224122397341 : Rat) / 180133946068) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-17337360283323 : Rat) / 360267892136) [(1, 1), (11, 2), (13, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2115901131120 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((1706219567313 : Rat) / 45033486517) [(1, 1), (11, 3)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (11, 3), (12, 1)],
  term ((-15759265210314 : Rat) / 45033486517) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((4139021676927 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (11, 4), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (4, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (5, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (10, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 100 through 199. -/
theorem ep_Q2_054_block_04_0100_0199_valid :
    checkProductSumEq ep_Q2_054_partials_04_0100_0199
      ep_Q2_054_block_04_0100_0199 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
