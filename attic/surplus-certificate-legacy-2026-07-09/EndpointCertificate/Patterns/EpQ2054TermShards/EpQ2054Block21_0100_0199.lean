/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 21:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_21_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0100 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def ep_Q2_054_partial_21_0100 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem ep_Q2_054_partial_21_0100_valid :
    mulPoly ep_Q2_054_coefficient_21_0100
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0101 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 101 for generator 21. -/
def ep_Q2_054_partial_21_0101 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem ep_Q2_054_partial_21_0101_valid :
    mulPoly ep_Q2_054_coefficient_21_0101
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0102 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 102 for generator 21. -/
def ep_Q2_054_partial_21_0102 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem ep_Q2_054_partial_21_0102_valid :
    mulPoly ep_Q2_054_coefficient_21_0102
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0103 : Poly :=
[
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 103 for generator 21. -/
def ep_Q2_054_partial_21_0103 : Poly :=
[
  term ((43527108983040 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((-43527108983040 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((43527108983040 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem ep_Q2_054_partial_21_0103_valid :
    mulPoly ep_Q2_054_coefficient_21_0103
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0104 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 104 for generator 21. -/
def ep_Q2_054_partial_21_0104 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 3), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem ep_Q2_054_partial_21_0104_valid :
    mulPoly ep_Q2_054_coefficient_21_0104
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0105 : Poly :=
[
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 105 for generator 21. -/
def ep_Q2_054_partial_21_0105 : Poly :=
[
  term ((13602221557200 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem ep_Q2_054_partial_21_0105_valid :
    mulPoly ep_Q2_054_coefficient_21_0105
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0106 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 106 for generator 21. -/
def ep_Q2_054_partial_21_0106 : Poly :=
[
  term ((-32645331737280 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((-32645331737280 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem ep_Q2_054_partial_21_0106_valid :
    mulPoly ep_Q2_054_coefficient_21_0106
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0107 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 107 for generator 21. -/
def ep_Q2_054_partial_21_0107 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem ep_Q2_054_partial_21_0107_valid :
    mulPoly ep_Q2_054_coefficient_21_0107
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0108 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 108 for generator 21. -/
def ep_Q2_054_partial_21_0108 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem ep_Q2_054_partial_21_0108_valid :
    mulPoly ep_Q2_054_coefficient_21_0108
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0109 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 109 for generator 21. -/
def ep_Q2_054_partial_21_0109 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem ep_Q2_054_partial_21_0109_valid :
    mulPoly ep_Q2_054_coefficient_21_0109
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0110 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 110 for generator 21. -/
def ep_Q2_054_partial_21_0110 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 3), (2, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem ep_Q2_054_partial_21_0110_valid :
    mulPoly ep_Q2_054_coefficient_21_0110
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0111 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 111 for generator 21. -/
def ep_Q2_054_partial_21_0111 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (2, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem ep_Q2_054_partial_21_0111_valid :
    mulPoly ep_Q2_054_coefficient_21_0111
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0112 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 112 for generator 21. -/
def ep_Q2_054_partial_21_0112 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 2), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem ep_Q2_054_partial_21_0112_valid :
    mulPoly ep_Q2_054_coefficient_21_0112
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0113 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 113 for generator 21. -/
def ep_Q2_054_partial_21_0113 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem ep_Q2_054_partial_21_0113_valid :
    mulPoly ep_Q2_054_coefficient_21_0113
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0114 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 21. -/
def ep_Q2_054_partial_21_0114 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem ep_Q2_054_partial_21_0114_valid :
    mulPoly ep_Q2_054_coefficient_21_0114
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0115 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 115 for generator 21. -/
def ep_Q2_054_partial_21_0115 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 21. -/
theorem ep_Q2_054_partial_21_0115_valid :
    mulPoly ep_Q2_054_coefficient_21_0115
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0116 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 21. -/
def ep_Q2_054_partial_21_0116 : Poly :=
[
  term ((-14509036327680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 21. -/
theorem ep_Q2_054_partial_21_0116_valid :
    mulPoly ep_Q2_054_coefficient_21_0116
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0117 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 117 for generator 21. -/
def ep_Q2_054_partial_21_0117 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 21. -/
theorem ep_Q2_054_partial_21_0117_valid :
    mulPoly ep_Q2_054_coefficient_21_0117
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0118 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 21. -/
def ep_Q2_054_partial_21_0118 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 21. -/
theorem ep_Q2_054_partial_21_0118_valid :
    mulPoly ep_Q2_054_coefficient_21_0118
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0119 : Poly :=
[
  term ((-4987481237640 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 119 for generator 21. -/
def ep_Q2_054_partial_21_0119 : Poly :=
[
  term ((9974962475280 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4987481237640 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9974962475280 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((4987481237640 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((9974962475280 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4987481237640 : Rat) / 45033486517) [(1, 3), (2, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 21. -/
theorem ep_Q2_054_partial_21_0119_valid :
    mulPoly ep_Q2_054_coefficient_21_0119
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0120 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)]
]

/-- Partial product 120 for generator 21. -/
def ep_Q2_054_partial_21_0120 : Poly :=
[
  term ((-14509036327680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (11, 1), (15, 2)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-14509036327680 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 2), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 3), (2, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 21. -/
theorem ep_Q2_054_partial_21_0120_valid :
    mulPoly ep_Q2_054_coefficient_21_0120
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0121 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 21. -/
def ep_Q2_054_partial_21_0121 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 3), (2, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 21. -/
theorem ep_Q2_054_partial_21_0121_valid :
    mulPoly ep_Q2_054_coefficient_21_0121
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0122 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 122 for generator 21. -/
def ep_Q2_054_partial_21_0122 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 3), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (2, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 21. -/
theorem ep_Q2_054_partial_21_0122_valid :
    mulPoly ep_Q2_054_coefficient_21_0122
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0123 : Poly :=
[
  term ((1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 123 for generator 21. -/
def ep_Q2_054_partial_21_0123 : Poly :=
[
  term ((-3173851696680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((1586925848340 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((3173851696680 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-3173851696680 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((1586925848340 : Rat) / 45033486517) [(1, 3), (2, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 21. -/
theorem ep_Q2_054_partial_21_0123_valid :
    mulPoly ep_Q2_054_coefficient_21_0123
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0124 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 21. -/
def ep_Q2_054_partial_21_0124 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 3), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 21. -/
theorem ep_Q2_054_partial_21_0124_valid :
    mulPoly ep_Q2_054_coefficient_21_0124
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0125 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 125 for generator 21. -/
def ep_Q2_054_partial_21_0125 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 3), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 21. -/
theorem ep_Q2_054_partial_21_0125_valid :
    mulPoly ep_Q2_054_coefficient_21_0125
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0126 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)]
]

/-- Partial product 126 for generator 21. -/
def ep_Q2_054_partial_21_0126 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (2, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 21. -/
theorem ep_Q2_054_partial_21_0126_valid :
    mulPoly ep_Q2_054_coefficient_21_0126
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0127 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 21. -/
def ep_Q2_054_partial_21_0127 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 3), (2, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 21. -/
theorem ep_Q2_054_partial_21_0127_valid :
    mulPoly ep_Q2_054_coefficient_21_0127
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0128 : Poly :=
[
  term ((-3486418149546 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 128 for generator 21. -/
def ep_Q2_054_partial_21_0128 : Poly :=
[
  term ((6972836299092 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-3486418149546 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-6972836299092 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((3486418149546 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)],
  term ((6972836299092 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-3486418149546 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 21. -/
theorem ep_Q2_054_partial_21_0128_valid :
    mulPoly ep_Q2_054_coefficient_21_0128
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0129 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 21. -/
def ep_Q2_054_partial_21_0129 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 21. -/
theorem ep_Q2_054_partial_21_0129_valid :
    mulPoly ep_Q2_054_coefficient_21_0129
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0130 : Poly :=
[
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1)]
]

/-- Partial product 130 for generator 21. -/
def ep_Q2_054_partial_21_0130 : Poly :=
[
  term ((-312566452866 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((156283226433 : Rat) / 45033486517) [(0, 2), (1, 1), (3, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1)],
  term ((156283226433 : Rat) / 45033486517) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 21. -/
theorem ep_Q2_054_partial_21_0130_valid :
    mulPoly ep_Q2_054_coefficient_21_0130
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0131 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 131 for generator 21. -/
def ep_Q2_054_partial_21_0131 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (1, 1), (5, 1), (7, 1), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 3), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 21. -/
theorem ep_Q2_054_partial_21_0131_valid :
    mulPoly ep_Q2_054_coefficient_21_0131
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0132 : Poly :=
[
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 132 for generator 21. -/
def ep_Q2_054_partial_21_0132 : Poly :=
[
  term ((549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 21. -/
theorem ep_Q2_054_partial_21_0132_valid :
    mulPoly ep_Q2_054_coefficient_21_0132
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0133 : Poly :=
[
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)]
]

/-- Partial product 133 for generator 21. -/
def ep_Q2_054_partial_21_0133 : Poly :=
[
  term ((-1208062350000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 2)],
  term ((604031175000 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 2)],
  term ((-1208062350000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((604031175000 : Rat) / 45033486517) [(1, 3), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 21. -/
theorem ep_Q2_054_partial_21_0133_valid :
    mulPoly ep_Q2_054_coefficient_21_0133
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0134 : Poly :=
[
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 134 for generator 21. -/
def ep_Q2_054_partial_21_0134 : Poly :=
[
  term ((33371207766675 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (10, 2), (15, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(0, 2), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-33371207766675 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((33371207766675 : Rat) / 45033486517) [(1, 2), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 3), (6, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 21. -/
theorem ep_Q2_054_partial_21_0134_valid :
    mulPoly ep_Q2_054_coefficient_21_0134
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0135 : Poly :=
[
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 135 for generator 21. -/
def ep_Q2_054_partial_21_0135 : Poly :=
[
  term ((3929106459069 : Rat) / 90066973034) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-3929106459069 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)],
  term ((3929106459069 : Rat) / 90066973034) [(1, 2), (6, 1), (11, 2)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 21. -/
theorem ep_Q2_054_partial_21_0135_valid :
    mulPoly ep_Q2_054_coefficient_21_0135
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0136 : Poly :=
[
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 136 for generator 21. -/
def ep_Q2_054_partial_21_0136 : Poly :=
[
  term ((1309702153023 : Rat) / 90066973034) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 21. -/
theorem ep_Q2_054_partial_21_0136_valid :
    mulPoly ep_Q2_054_coefficient_21_0136
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0137 : Poly :=
[
  term ((20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 137 for generator 21. -/
def ep_Q2_054_partial_21_0137 : Poly :=
[
  term ((-20110995060975 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((20110995060975 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (15, 1)],
  term ((-20110995060975 : Rat) / 45033486517) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(1, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 21. -/
theorem ep_Q2_054_partial_21_0137_valid :
    mulPoly ep_Q2_054_coefficient_21_0137
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0138 : Poly :=
[
  term ((-4689789936687 : Rat) / 180133946068) [(1, 1), (7, 1)]
]

/-- Partial product 138 for generator 21. -/
def ep_Q2_054_partial_21_0138 : Poly :=
[
  term ((4689789936687 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((-4689789936687 : Rat) / 180133946068) [(0, 2), (1, 1), (7, 1)],
  term ((4689789936687 : Rat) / 180133946068) [(1, 1), (7, 1)],
  term ((-4689789936687 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1)],
  term ((4689789936687 : Rat) / 90066973034) [(1, 2), (7, 1), (11, 1)],
  term ((-4689789936687 : Rat) / 180133946068) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 21. -/
theorem ep_Q2_054_partial_21_0138_valid :
    mulPoly ep_Q2_054_coefficient_21_0138
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0139 : Poly :=
[
  term ((3966624768159 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 139 for generator 21. -/
def ep_Q2_054_partial_21_0139 : Poly :=
[
  term ((-7933249536318 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1)],
  term ((3966624768159 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((-3966624768159 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)],
  term ((7933249536318 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((-7933249536318 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((3966624768159 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 21. -/
theorem ep_Q2_054_partial_21_0139_valid :
    mulPoly ep_Q2_054_coefficient_21_0139
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0140 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 140 for generator 21. -/
def ep_Q2_054_partial_21_0140 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 21. -/
theorem ep_Q2_054_partial_21_0140_valid :
    mulPoly ep_Q2_054_coefficient_21_0140
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0141 : Poly :=
[
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 141 for generator 21. -/
def ep_Q2_054_partial_21_0141 : Poly :=
[
  term ((2342908800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-2342908800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((2342908800000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 21. -/
theorem ep_Q2_054_partial_21_0141_valid :
    mulPoly ep_Q2_054_coefficient_21_0141
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0142 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 142 for generator 21. -/
def ep_Q2_054_partial_21_0142 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (11, 2)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 3)],
  term ((439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 21. -/
theorem ep_Q2_054_partial_21_0142_valid :
    mulPoly ep_Q2_054_coefficient_21_0142
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0143 : Poly :=
[
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 143 for generator 21. -/
def ep_Q2_054_partial_21_0143 : Poly :=
[
  term ((732159000000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-732159000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((732159000000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 21. -/
theorem ep_Q2_054_partial_21_0143_valid :
    mulPoly ep_Q2_054_coefficient_21_0143
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0144 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 144 for generator 21. -/
def ep_Q2_054_partial_21_0144 : Poly :=
[
  term ((-1757181600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 21. -/
theorem ep_Q2_054_partial_21_0144_valid :
    mulPoly ep_Q2_054_coefficient_21_0144
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0145 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 145 for generator 21. -/
def ep_Q2_054_partial_21_0145 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (10, 1), (11, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 21. -/
theorem ep_Q2_054_partial_21_0145_valid :
    mulPoly ep_Q2_054_coefficient_21_0145
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0146 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 146 for generator 21. -/
def ep_Q2_054_partial_21_0146 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 21. -/
theorem ep_Q2_054_partial_21_0146_valid :
    mulPoly ep_Q2_054_coefficient_21_0146
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0147 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 147 for generator 21. -/
def ep_Q2_054_partial_21_0147 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 2)],
  term ((292863600000 : Rat) / 45033486517) [(1, 3), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 21. -/
theorem ep_Q2_054_partial_21_0147_valid :
    mulPoly ep_Q2_054_coefficient_21_0147
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0148 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 148 for generator 21. -/
def ep_Q2_054_partial_21_0148 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 3), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 21. -/
theorem ep_Q2_054_partial_21_0148_valid :
    mulPoly ep_Q2_054_coefficient_21_0148
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0149 : Poly :=
[
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 149 for generator 21. -/
def ep_Q2_054_partial_21_0149 : Poly :=
[
  term ((3946797998145 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((-3946797998145 : Rat) / 180133946068) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)],
  term ((-3946797998145 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 2)],
  term ((3946797998145 : Rat) / 90066973034) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 21. -/
theorem ep_Q2_054_partial_21_0149_valid :
    mulPoly ep_Q2_054_coefficient_21_0149
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0150 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 150 for generator 21. -/
def ep_Q2_054_partial_21_0150 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 21. -/
theorem ep_Q2_054_partial_21_0150_valid :
    mulPoly ep_Q2_054_coefficient_21_0150
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0151 : Poly :=
[
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 151 for generator 21. -/
def ep_Q2_054_partial_21_0151 : Poly :=
[
  term ((-3811744039050 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (12, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((3811744039050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (12, 1)],
  term ((-3811744039050 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 21. -/
theorem ep_Q2_054_partial_21_0151_valid :
    mulPoly ep_Q2_054_coefficient_21_0151
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0152 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 152 for generator 21. -/
def ep_Q2_054_partial_21_0152 : Poly :=
[
  term ((390484800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 21. -/
theorem ep_Q2_054_partial_21_0152_valid :
    mulPoly ep_Q2_054_coefficient_21_0152
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0153 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 153 for generator 21. -/
def ep_Q2_054_partial_21_0153 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 21. -/
theorem ep_Q2_054_partial_21_0153_valid :
    mulPoly ep_Q2_054_coefficient_21_0153
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0154 : Poly :=
[
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 21. -/
def ep_Q2_054_partial_21_0154 : Poly :=
[
  term ((-780969600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 21. -/
theorem ep_Q2_054_partial_21_0154_valid :
    mulPoly ep_Q2_054_coefficient_21_0154
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0155 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 155 for generator 21. -/
def ep_Q2_054_partial_21_0155 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 21. -/
theorem ep_Q2_054_partial_21_0155_valid :
    mulPoly ep_Q2_054_coefficient_21_0155
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0156 : Poly :=
[
  term ((-1979087919525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 156 for generator 21. -/
def ep_Q2_054_partial_21_0156 : Poly :=
[
  term ((3958175839050 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1979087919525 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-3958175839050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((1979087919525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((3958175839050 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 2), (13, 1)],
  term ((-1979087919525 : Rat) / 45033486517) [(1, 3), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 21. -/
theorem ep_Q2_054_partial_21_0156_valid :
    mulPoly ep_Q2_054_coefficient_21_0156
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0157 : Poly :=
[
  term ((2491599219525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 157 for generator 21. -/
def ep_Q2_054_partial_21_0157 : Poly :=
[
  term ((-2491599219525 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((2491599219525 : Rat) / 90066973034) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((2491599219525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2491599219525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2491599219525 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((2491599219525 : Rat) / 90066973034) [(1, 3), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 21. -/
theorem ep_Q2_054_partial_21_0157_valid :
    mulPoly ep_Q2_054_coefficient_21_0157
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0158 : Poly :=
[
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 21. -/
def ep_Q2_054_partial_21_0158 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 21. -/
theorem ep_Q2_054_partial_21_0158_valid :
    mulPoly ep_Q2_054_coefficient_21_0158
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0159 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)]
]

/-- Partial product 159 for generator 21. -/
def ep_Q2_054_partial_21_0159 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (11, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 3)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 3), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 21. -/
theorem ep_Q2_054_partial_21_0159_valid :
    mulPoly ep_Q2_054_coefficient_21_0159
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0160 : Poly :=
[
  term ((-255522361725 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 160 for generator 21. -/
def ep_Q2_054_partial_21_0160 : Poly :=
[
  term ((255522361725 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-255522361725 : Rat) / 180133946068) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((-255522361725 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((255522361725 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)],
  term ((255522361725 : Rat) / 90066973034) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((-255522361725 : Rat) / 180133946068) [(1, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 21. -/
theorem ep_Q2_054_partial_21_0160_valid :
    mulPoly ep_Q2_054_coefficient_21_0160
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0161 : Poly :=
[
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 161 for generator 21. -/
def ep_Q2_054_partial_21_0161 : Poly :=
[
  term ((97621200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 21. -/
theorem ep_Q2_054_partial_21_0161_valid :
    mulPoly ep_Q2_054_coefficient_21_0161
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0162 : Poly :=
[
  term ((-378399476124 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 162 for generator 21. -/
def ep_Q2_054_partial_21_0162 : Poly :=
[
  term ((756798952248 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-378399476124 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-756798952248 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((378399476124 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((756798952248 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-378399476124 : Rat) / 45033486517) [(1, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 21. -/
theorem ep_Q2_054_partial_21_0162_valid :
    mulPoly ep_Q2_054_coefficient_21_0162
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0163 : Poly :=
[
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 21. -/
def ep_Q2_054_partial_21_0163 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 21. -/
theorem ep_Q2_054_partial_21_0163_valid :
    mulPoly ep_Q2_054_coefficient_21_0163
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0164 : Poly :=
[
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 164 for generator 21. -/
def ep_Q2_054_partial_21_0164 : Poly :=
[
  term ((-97621200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 21. -/
theorem ep_Q2_054_partial_21_0164_valid :
    mulPoly ep_Q2_054_coefficient_21_0164
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0165 : Poly :=
[
  term ((784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 165 for generator 21. -/
def ep_Q2_054_partial_21_0165 : Poly :=
[
  term ((-1568227027104 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1)],
  term ((784113513552 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (9, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)],
  term ((1568227027104 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1568227027104 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((784113513552 : Rat) / 45033486517) [(1, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 21. -/
theorem ep_Q2_054_partial_21_0165_valid :
    mulPoly ep_Q2_054_coefficient_21_0165
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0166 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 166 for generator 21. -/
def ep_Q2_054_partial_21_0166 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 3), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 21. -/
theorem ep_Q2_054_partial_21_0166_valid :
    mulPoly ep_Q2_054_coefficient_21_0166
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0167 : Poly :=
[
  term ((-2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 167 for generator 21. -/
def ep_Q2_054_partial_21_0167 : Poly :=
[
  term ((4780043996850 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2390021998425 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((-4780043996850 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)],
  term ((4780043996850 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((-2390021998425 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 21. -/
theorem ep_Q2_054_partial_21_0167_valid :
    mulPoly ep_Q2_054_coefficient_21_0167
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0168 : Poly :=
[
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 168 for generator 21. -/
def ep_Q2_054_partial_21_0168 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 21. -/
theorem ep_Q2_054_partial_21_0168_valid :
    mulPoly ep_Q2_054_coefficient_21_0168
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0169 : Poly :=
[
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 169 for generator 21. -/
def ep_Q2_054_partial_21_0169 : Poly :=
[
  term ((-21763554491520 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((10881777245760 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (11, 1), (15, 2)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (15, 2)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 21. -/
theorem ep_Q2_054_partial_21_0169_valid :
    mulPoly ep_Q2_054_coefficient_21_0169
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0170 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 170 for generator 21. -/
def ep_Q2_054_partial_21_0170 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 3), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 21. -/
theorem ep_Q2_054_partial_21_0170_valid :
    mulPoly ep_Q2_054_coefficient_21_0170
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0171 : Poly :=
[
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 171 for generator 21. -/
def ep_Q2_054_partial_21_0171 : Poly :=
[
  term ((-4578585912864 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((4578585912864 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4578585912864 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 21. -/
theorem ep_Q2_054_partial_21_0171_valid :
    mulPoly ep_Q2_054_coefficient_21_0171
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0172 : Poly :=
[
  term ((-7132195738584 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 172 for generator 21. -/
def ep_Q2_054_partial_21_0172 : Poly :=
[
  term ((14264391477168 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-7132195738584 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((-14264391477168 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((7132195738584 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)],
  term ((14264391477168 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-7132195738584 : Rat) / 45033486517) [(1, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 21. -/
theorem ep_Q2_054_partial_21_0172_valid :
    mulPoly ep_Q2_054_coefficient_21_0172
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0173 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 173 for generator 21. -/
def ep_Q2_054_partial_21_0173 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 3), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 21. -/
theorem ep_Q2_054_partial_21_0173_valid :
    mulPoly ep_Q2_054_coefficient_21_0173
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0174 : Poly :=
[
  term ((4380020623680 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 174 for generator 21. -/
def ep_Q2_054_partial_21_0174 : Poly :=
[
  term ((-8760041247360 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((4380020623680 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((8760041247360 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-4380020623680 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)],
  term ((-8760041247360 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((4380020623680 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 21. -/
theorem ep_Q2_054_partial_21_0174_valid :
    mulPoly ep_Q2_054_coefficient_21_0174
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0175 : Poly :=
[
  term ((512270088975 : Rat) / 45033486517) [(1, 1), (9, 1)]
]

/-- Partial product 175 for generator 21. -/
def ep_Q2_054_partial_21_0175 : Poly :=
[
  term ((-1024540177950 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((512270088975 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1)],
  term ((-512270088975 : Rat) / 45033486517) [(1, 1), (9, 1)],
  term ((1024540177950 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)],
  term ((-1024540177950 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1)],
  term ((512270088975 : Rat) / 45033486517) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 21. -/
theorem ep_Q2_054_partial_21_0175_valid :
    mulPoly ep_Q2_054_coefficient_21_0175
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0176 : Poly :=
[
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 176 for generator 21. -/
def ep_Q2_054_partial_21_0176 : Poly :=
[
  term ((-1430769186504 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((715384593252 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)],
  term ((1430769186504 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2)],
  term ((-1430769186504 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((715384593252 : Rat) / 45033486517) [(1, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 21. -/
theorem ep_Q2_054_partial_21_0176_valid :
    mulPoly ep_Q2_054_coefficient_21_0176
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0177 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 177 for generator 21. -/
def ep_Q2_054_partial_21_0177 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 3), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 21. -/
theorem ep_Q2_054_partial_21_0177_valid :
    mulPoly ep_Q2_054_coefficient_21_0177
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0178 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 178 for generator 21. -/
def ep_Q2_054_partial_21_0178 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 21. -/
theorem ep_Q2_054_partial_21_0178_valid :
    mulPoly ep_Q2_054_coefficient_21_0178
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0179 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 179 for generator 21. -/
def ep_Q2_054_partial_21_0179 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 3), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 21. -/
theorem ep_Q2_054_partial_21_0179_valid :
    mulPoly ep_Q2_054_coefficient_21_0179
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0180 : Poly :=
[
  term ((555631216434 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 180 for generator 21. -/
def ep_Q2_054_partial_21_0180 : Poly :=
[
  term ((-1111262432868 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((555631216434 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-555631216434 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)],
  term ((-1111262432868 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((555631216434 : Rat) / 45033486517) [(1, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 21. -/
theorem ep_Q2_054_partial_21_0180_valid :
    mulPoly ep_Q2_054_coefficient_21_0180
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0181 : Poly :=
[
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 181 for generator 21. -/
def ep_Q2_054_partial_21_0181 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 21. -/
theorem ep_Q2_054_partial_21_0181_valid :
    mulPoly ep_Q2_054_coefficient_21_0181
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0182 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 182 for generator 21. -/
def ep_Q2_054_partial_21_0182 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (11, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 21. -/
theorem ep_Q2_054_partial_21_0182_valid :
    mulPoly ep_Q2_054_coefficient_21_0182
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0183 : Poly :=
[
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 183 for generator 21. -/
def ep_Q2_054_partial_21_0183 : Poly :=
[
  term ((28469750498274 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-14234875249137 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-28469750498274 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((28469750498274 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 3), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 21. -/
theorem ep_Q2_054_partial_21_0183_valid :
    mulPoly ep_Q2_054_coefficient_21_0183
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0184 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 21. -/
def ep_Q2_054_partial_21_0184 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 3), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 21. -/
theorem ep_Q2_054_partial_21_0184_valid :
    mulPoly ep_Q2_054_coefficient_21_0184
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0185 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 185 for generator 21. -/
def ep_Q2_054_partial_21_0185 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 3), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 21. -/
theorem ep_Q2_054_partial_21_0185_valid :
    mulPoly ep_Q2_054_coefficient_21_0185
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0186 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 186 for generator 21. -/
def ep_Q2_054_partial_21_0186 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 3), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 21. -/
theorem ep_Q2_054_partial_21_0186_valid :
    mulPoly ep_Q2_054_coefficient_21_0186
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0187 : Poly :=
[
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 187 for generator 21. -/
def ep_Q2_054_partial_21_0187 : Poly :=
[
  term ((-31891289877147 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (15, 1)],
  term ((31891289877147 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1)],
  term ((-31891289877147 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 21. -/
theorem ep_Q2_054_partial_21_0187_valid :
    mulPoly ep_Q2_054_coefficient_21_0187
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0188 : Poly :=
[
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 21. -/
def ep_Q2_054_partial_21_0188 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 21. -/
theorem ep_Q2_054_partial_21_0188_valid :
    mulPoly ep_Q2_054_coefficient_21_0188
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0189 : Poly :=
[
  term ((842554207236 : Rat) / 45033486517) [(1, 1), (11, 1)]
]

/-- Partial product 189 for generator 21. -/
def ep_Q2_054_partial_21_0189 : Poly :=
[
  term ((-1685108414472 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((842554207236 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 1)],
  term ((1685108414472 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1)],
  term ((-842554207236 : Rat) / 45033486517) [(1, 1), (11, 1)],
  term ((-1685108414472 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((842554207236 : Rat) / 45033486517) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 21. -/
theorem ep_Q2_054_partial_21_0189_valid :
    mulPoly ep_Q2_054_coefficient_21_0189
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0190 : Poly :=
[
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 190 for generator 21. -/
def ep_Q2_054_partial_21_0190 : Poly :=
[
  term ((-515943272403 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((515943272403 : Rat) / 90066973034) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((515943272403 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1)],
  term ((-515943272403 : Rat) / 45033486517) [(1, 2), (11, 2), (12, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 21. -/
theorem ep_Q2_054_partial_21_0190_valid :
    mulPoly ep_Q2_054_coefficient_21_0190
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0191 : Poly :=
[
  term ((14399043054594 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 191 for generator 21. -/
def ep_Q2_054_partial_21_0191 : Poly :=
[
  term ((-28798086109188 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((14399043054594 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((28798086109188 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14399043054594 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-28798086109188 : Rat) / 45033486517) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((14399043054594 : Rat) / 45033486517) [(1, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 21. -/
theorem ep_Q2_054_partial_21_0191_valid :
    mulPoly ep_Q2_054_coefficient_21_0191
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0192 : Poly :=
[
  term ((-9579910299807 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 192 for generator 21. -/
def ep_Q2_054_partial_21_0192 : Poly :=
[
  term ((19159820599614 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-9579910299807 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((-19159820599614 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((9579910299807 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((19159820599614 : Rat) / 45033486517) [(1, 2), (11, 2), (15, 2)],
  term ((-9579910299807 : Rat) / 45033486517) [(1, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 21. -/
theorem ep_Q2_054_partial_21_0192_valid :
    mulPoly ep_Q2_054_coefficient_21_0192
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0193 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 193 for generator 21. -/
def ep_Q2_054_partial_21_0193 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 21. -/
theorem ep_Q2_054_partial_21_0193_valid :
    mulPoly ep_Q2_054_coefficient_21_0193
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0194 : Poly :=
[
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 194 for generator 21. -/
def ep_Q2_054_partial_21_0194 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 2), (11, 3), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 21. -/
theorem ep_Q2_054_partial_21_0194_valid :
    mulPoly ep_Q2_054_coefficient_21_0194
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0195 : Poly :=
[
  term ((24558206773479 : Rat) / 180133946068) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 195 for generator 21. -/
def ep_Q2_054_partial_21_0195 : Poly :=
[
  term ((-24558206773479 : Rat) / 90066973034) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((24558206773479 : Rat) / 180133946068) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((24558206773479 : Rat) / 90066973034) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-24558206773479 : Rat) / 180133946068) [(1, 1), (12, 1), (15, 1)],
  term ((-24558206773479 : Rat) / 90066973034) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((24558206773479 : Rat) / 180133946068) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 21. -/
theorem ep_Q2_054_partial_21_0195_valid :
    mulPoly ep_Q2_054_coefficient_21_0195
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0196 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 21. -/
def ep_Q2_054_partial_21_0196 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((453407385240 : Rat) / 45033486517) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((453407385240 : Rat) / 45033486517) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 21. -/
theorem ep_Q2_054_partial_21_0196_valid :
    mulPoly ep_Q2_054_coefficient_21_0196
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0197 : Poly :=
[
  term ((30507482344587 : Rat) / 360267892136) [(1, 1), (13, 1)]
]

/-- Partial product 197 for generator 21. -/
def ep_Q2_054_partial_21_0197 : Poly :=
[
  term ((-30507482344587 : Rat) / 180133946068) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((30507482344587 : Rat) / 360267892136) [(0, 2), (1, 1), (13, 1)],
  term ((30507482344587 : Rat) / 180133946068) [(1, 1), (10, 1), (13, 1)],
  term ((-30507482344587 : Rat) / 360267892136) [(1, 1), (13, 1)],
  term ((-30507482344587 : Rat) / 180133946068) [(1, 2), (11, 1), (13, 1)],
  term ((30507482344587 : Rat) / 360267892136) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 21. -/
theorem ep_Q2_054_partial_21_0197_valid :
    mulPoly ep_Q2_054_coefficient_21_0197
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0198 : Poly :=
[
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 198 for generator 21. -/
def ep_Q2_054_partial_21_0198 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2)],
  term ((2040333233580 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 21. -/
theorem ep_Q2_054_partial_21_0198_valid :
    mulPoly ep_Q2_054_coefficient_21_0198
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 21. -/
def ep_Q2_054_coefficient_21_0199 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 199 for generator 21. -/
def ep_Q2_054_partial_21_0199 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 21. -/
theorem ep_Q2_054_partial_21_0199_valid :
    mulPoly ep_Q2_054_coefficient_21_0199
        ep_Q2_054_generator_21_0100_0199 =
      ep_Q2_054_partial_21_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_21_0100_0199 : List Poly :=
[
  ep_Q2_054_partial_21_0100,
  ep_Q2_054_partial_21_0101,
  ep_Q2_054_partial_21_0102,
  ep_Q2_054_partial_21_0103,
  ep_Q2_054_partial_21_0104,
  ep_Q2_054_partial_21_0105,
  ep_Q2_054_partial_21_0106,
  ep_Q2_054_partial_21_0107,
  ep_Q2_054_partial_21_0108,
  ep_Q2_054_partial_21_0109,
  ep_Q2_054_partial_21_0110,
  ep_Q2_054_partial_21_0111,
  ep_Q2_054_partial_21_0112,
  ep_Q2_054_partial_21_0113,
  ep_Q2_054_partial_21_0114,
  ep_Q2_054_partial_21_0115,
  ep_Q2_054_partial_21_0116,
  ep_Q2_054_partial_21_0117,
  ep_Q2_054_partial_21_0118,
  ep_Q2_054_partial_21_0119,
  ep_Q2_054_partial_21_0120,
  ep_Q2_054_partial_21_0121,
  ep_Q2_054_partial_21_0122,
  ep_Q2_054_partial_21_0123,
  ep_Q2_054_partial_21_0124,
  ep_Q2_054_partial_21_0125,
  ep_Q2_054_partial_21_0126,
  ep_Q2_054_partial_21_0127,
  ep_Q2_054_partial_21_0128,
  ep_Q2_054_partial_21_0129,
  ep_Q2_054_partial_21_0130,
  ep_Q2_054_partial_21_0131,
  ep_Q2_054_partial_21_0132,
  ep_Q2_054_partial_21_0133,
  ep_Q2_054_partial_21_0134,
  ep_Q2_054_partial_21_0135,
  ep_Q2_054_partial_21_0136,
  ep_Q2_054_partial_21_0137,
  ep_Q2_054_partial_21_0138,
  ep_Q2_054_partial_21_0139,
  ep_Q2_054_partial_21_0140,
  ep_Q2_054_partial_21_0141,
  ep_Q2_054_partial_21_0142,
  ep_Q2_054_partial_21_0143,
  ep_Q2_054_partial_21_0144,
  ep_Q2_054_partial_21_0145,
  ep_Q2_054_partial_21_0146,
  ep_Q2_054_partial_21_0147,
  ep_Q2_054_partial_21_0148,
  ep_Q2_054_partial_21_0149,
  ep_Q2_054_partial_21_0150,
  ep_Q2_054_partial_21_0151,
  ep_Q2_054_partial_21_0152,
  ep_Q2_054_partial_21_0153,
  ep_Q2_054_partial_21_0154,
  ep_Q2_054_partial_21_0155,
  ep_Q2_054_partial_21_0156,
  ep_Q2_054_partial_21_0157,
  ep_Q2_054_partial_21_0158,
  ep_Q2_054_partial_21_0159,
  ep_Q2_054_partial_21_0160,
  ep_Q2_054_partial_21_0161,
  ep_Q2_054_partial_21_0162,
  ep_Q2_054_partial_21_0163,
  ep_Q2_054_partial_21_0164,
  ep_Q2_054_partial_21_0165,
  ep_Q2_054_partial_21_0166,
  ep_Q2_054_partial_21_0167,
  ep_Q2_054_partial_21_0168,
  ep_Q2_054_partial_21_0169,
  ep_Q2_054_partial_21_0170,
  ep_Q2_054_partial_21_0171,
  ep_Q2_054_partial_21_0172,
  ep_Q2_054_partial_21_0173,
  ep_Q2_054_partial_21_0174,
  ep_Q2_054_partial_21_0175,
  ep_Q2_054_partial_21_0176,
  ep_Q2_054_partial_21_0177,
  ep_Q2_054_partial_21_0178,
  ep_Q2_054_partial_21_0179,
  ep_Q2_054_partial_21_0180,
  ep_Q2_054_partial_21_0181,
  ep_Q2_054_partial_21_0182,
  ep_Q2_054_partial_21_0183,
  ep_Q2_054_partial_21_0184,
  ep_Q2_054_partial_21_0185,
  ep_Q2_054_partial_21_0186,
  ep_Q2_054_partial_21_0187,
  ep_Q2_054_partial_21_0188,
  ep_Q2_054_partial_21_0189,
  ep_Q2_054_partial_21_0190,
  ep_Q2_054_partial_21_0191,
  ep_Q2_054_partial_21_0192,
  ep_Q2_054_partial_21_0193,
  ep_Q2_054_partial_21_0194,
  ep_Q2_054_partial_21_0195,
  ep_Q2_054_partial_21_0196,
  ep_Q2_054_partial_21_0197,
  ep_Q2_054_partial_21_0198,
  ep_Q2_054_partial_21_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_21_0100_0199 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((43527108983040 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-32645331737280 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((9974962475280 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3173851696680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((6972836299092 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (11, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (13, 1), (15, 2)],
  term ((-14509036327680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-1208062350000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 2)],
  term ((3929106459069 : Rat) / 90066973034) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-20110995060975 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((33371207766675 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (10, 2), (15, 1)],
  term ((-7933249536318 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((2342908800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((732159000000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((4689789936687 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((3958175839050 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2491599219525 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((195242400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 2)],
  term ((255522361725 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((97621200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((756798952248 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((3946797998145 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-3811744039050 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (12, 1)],
  term ((390484800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-1568227027104 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1)],
  term ((4780043996850 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4578585912864 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((14264391477168 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-8760041247360 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-1024540177950 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1111262432868 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1430769186504 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1685108414472 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((-515943272403 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-28798086109188 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((19159820599614 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-24558206773479 : Rat) / 90066973034) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30507482344587 : Rat) / 180133946068) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (11, 1), (15, 2)],
  term ((28469750498274 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (13, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4987481237640 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((1586925848340 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3486418149546 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((156283226433 : Rat) / 45033486517) [(0, 2), (1, 1), (3, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((604031175000 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(0, 2), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((-4689789936687 : Rat) / 180133946068) [(0, 2), (1, 1), (7, 1)],
  term ((3966624768159 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((146431800000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (11, 2)],
  term ((-366079500000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (12, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-3946797998145 : Rat) / 180133946068) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((390484800000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1979087919525 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((2491599219525 : Rat) / 90066973034) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (11, 2)],
  term ((-255522361725 : Rat) / 180133946068) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-378399476124 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((97621200000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((784113513552 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2390021998425 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (11, 2), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-7132195738584 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (13, 1), (15, 2)],
  term ((4380020623680 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((512270088975 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1)],
  term ((715384593252 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((555631216434 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-14234875249137 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((842554207236 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 1)],
  term ((515943272403 : Rat) / 90066973034) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((14399043054594 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9579910299807 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((24558206773479 : Rat) / 180133946068) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((30507482344587 : Rat) / 360267892136) [(0, 2), (1, 1), (13, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-43527108983040 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-9974962475280 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5159206758132 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (11, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (13, 1), (15, 2)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((4987481237640 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-1586925848340 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((3486418149546 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)],
  term ((-1153150425000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 2)],
  term ((-3929106459069 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((73593197888625 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-33371207766675 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)],
  term ((-20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (15, 1)],
  term ((4689789936687 : Rat) / 180133946068) [(1, 1), (7, 1)],
  term ((-3966624768159 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)],
  term ((7933249536318 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2342908800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((-732159000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-5432781875229 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)],
  term ((-3958175839050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((2052303819525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-4067266400775 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-3946797998145 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 2)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((3811744039050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (12, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((1979087919525 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-2491599219525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)],
  term ((255522361725 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((378399476124 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)],
  term ((1568227027104 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((-4780043996850 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((4578585912864 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-14264391477168 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((9077544799608 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((7132195738584 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-4380020623680 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)],
  term ((-512270088975 : Rat) / 45033486517) [(1, 1), (9, 1)],
  term ((309155584698 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)],
  term ((-9521555090040 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((1111262432868 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((1430769186504 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-555631216434 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((1685108414472 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1)],
  term ((515943272403 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((28798086109188 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15079154132454 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((53027957271753 : Rat) / 90066973034) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((30507482344587 : Rat) / 180133946068) [(1, 1), (10, 1), (13, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-28469750498274 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-842554207236 : Rat) / 45033486517) [(1, 1), (11, 1)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1)],
  term ((-14399043054594 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((9579910299807 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((-24558206773479 : Rat) / 180133946068) [(1, 1), (12, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30507482344587 : Rat) / 360267892136) [(1, 1), (13, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32645331737280 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((43527108983040 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 3), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-14509036327680 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 2), (15, 2)],
  term ((-3173851696680 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6972836299092 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((9974962475280 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 2), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 3), (15, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1208062350000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((33371207766675 : Rat) / 45033486517) [(1, 2), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-20110995060975 : Rat) / 45033486517) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((3929106459069 : Rat) / 90066973034) [(1, 2), (6, 1), (11, 2)],
  term ((-7933249536318 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((732159000000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((2342908800000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 3)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (10, 1), (11, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 2)],
  term ((3946797998145 : Rat) / 90066973034) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-3811744039050 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((4689789936687 : Rat) / 90066973034) [(1, 2), (7, 1), (11, 1)],
  term ((255522361725 : Rat) / 90066973034) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((756798952248 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((3958175839050 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 2), (13, 1)],
  term ((-2491599219525 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 3)],
  term ((-1568227027104 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4578585912864 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((14264391477168 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8760041247360 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((4780043996850 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 3), (15, 1)],
  term ((-1430769186504 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1024540177950 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1)],
  term ((-1111262432868 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((28469750498274 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((-24558206773479 : Rat) / 90066973034) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30507482344587 : Rat) / 180133946068) [(1, 2), (11, 1), (13, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1685108414472 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((-515943272403 : Rat) / 45033486517) [(1, 2), (11, 2), (12, 1)],
  term ((-28798086109188 : Rat) / 45033486517) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((19159820599614 : Rat) / 45033486517) [(1, 2), (11, 2), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 2), (11, 3), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (8, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 3), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 3), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4987481237640 : Rat) / 45033486517) [(1, 3), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 3), (2, 1), (11, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 3), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (2, 1), (11, 2), (15, 1)],
  term ((1586925848340 : Rat) / 45033486517) [(1, 3), (2, 1), (12, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 3), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 3), (2, 1), (13, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (2, 1), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 3), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3486418149546 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((156283226433 : Rat) / 45033486517) [(1, 3), (3, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 3), (5, 1), (7, 1), (13, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 3), (6, 1), (7, 1)],
  term ((604031175000 : Rat) / 45033486517) [(1, 3), (6, 1), (7, 1), (10, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 3), (6, 1), (10, 1), (15, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 3), (6, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 3), (6, 1), (13, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(1, 3), (6, 1), (15, 1)],
  term ((-4689789936687 : Rat) / 180133946068) [(1, 3), (7, 1)],
  term ((3966624768159 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (11, 2)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (12, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 3), (7, 1), (9, 1), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 3), (7, 1), (9, 1), (13, 1)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 3), (7, 1), (10, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (12, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 3), (7, 1), (10, 1), (16, 1)],
  term ((-1979087919525 : Rat) / 45033486517) [(1, 3), (7, 1), (11, 1), (13, 1)],
  term ((2491599219525 : Rat) / 90066973034) [(1, 3), (7, 1), (11, 1), (15, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 3), (7, 1), (11, 2)],
  term ((-255522361725 : Rat) / 180133946068) [(1, 3), (7, 1), (12, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 3), (7, 1), (12, 1), (16, 1)],
  term ((-378399476124 : Rat) / 45033486517) [(1, 3), (7, 1), (13, 1), (15, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 3), (7, 1), (16, 1)],
  term ((784113513552 : Rat) / 45033486517) [(1, 3), (8, 1), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 3), (8, 1), (10, 1), (15, 1)],
  term ((-2390021998425 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 2), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 3), (8, 1), (12, 1), (15, 1)],
  term ((-7132195738584 : Rat) / 45033486517) [(1, 3), (8, 1), (13, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 3), (8, 1), (13, 1), (15, 2)],
  term ((4380020623680 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1)],
  term ((512270088975 : Rat) / 45033486517) [(1, 3), (9, 1)],
  term ((715384593252 : Rat) / 45033486517) [(1, 3), (9, 1), (10, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 3), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 3), (9, 1), (11, 1), (15, 1)],
  term ((555631216434 : Rat) / 45033486517) [(1, 3), (9, 1), (12, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 3), (9, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 3), (10, 1), (11, 1), (15, 2)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 3), (10, 1), (12, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 3), (10, 1), (13, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 3), (10, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((842554207236 : Rat) / 45033486517) [(1, 3), (11, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 3), (11, 1), (12, 1)],
  term ((14399043054594 : Rat) / 45033486517) [(1, 3), (11, 1), (13, 1), (15, 1)],
  term ((-9579910299807 : Rat) / 45033486517) [(1, 3), (11, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(1, 3), (11, 1), (15, 2), (16, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 3), (11, 2), (15, 1)],
  term ((24558206773479 : Rat) / 180133946068) [(1, 3), (12, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((30507482344587 : Rat) / 360267892136) [(1, 3), (13, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 3), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 199. -/
theorem ep_Q2_054_block_21_0100_0199_valid :
    checkProductSumEq ep_Q2_054_partials_21_0100_0199
      ep_Q2_054_block_21_0100_0199 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
