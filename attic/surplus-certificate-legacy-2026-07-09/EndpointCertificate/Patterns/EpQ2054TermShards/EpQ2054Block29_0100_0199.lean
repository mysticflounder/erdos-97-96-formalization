/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 29:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_29_0100_0199 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0100 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1)]
]

/-- Partial product 100 for generator 29. -/
def ep_Q2_054_partial_29_0100 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 29. -/
theorem ep_Q2_054_partial_29_0100_valid :
    mulPoly ep_Q2_054_coefficient_29_0100
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0101 : Poly :=
[
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 101 for generator 29. -/
def ep_Q2_054_partial_29_0101 : Poly :=
[
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 29. -/
theorem ep_Q2_054_partial_29_0101_valid :
    mulPoly ep_Q2_054_coefficient_29_0101
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0102 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 102 for generator 29. -/
def ep_Q2_054_partial_29_0102 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (14, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 29. -/
theorem ep_Q2_054_partial_29_0102_valid :
    mulPoly ep_Q2_054_coefficient_29_0102
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0103 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 103 for generator 29. -/
def ep_Q2_054_partial_29_0103 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 29. -/
theorem ep_Q2_054_partial_29_0103_valid :
    mulPoly ep_Q2_054_coefficient_29_0103
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0104 : Poly :=
[
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 104 for generator 29. -/
def ep_Q2_054_partial_29_0104 : Poly :=
[
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2), (15, 2)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 29. -/
theorem ep_Q2_054_partial_29_0104_valid :
    mulPoly ep_Q2_054_coefficient_29_0104
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0105 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 29. -/
def ep_Q2_054_partial_29_0105 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 29. -/
theorem ep_Q2_054_partial_29_0105_valid :
    mulPoly ep_Q2_054_coefficient_29_0105
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0106 : Poly :=
[
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 106 for generator 29. -/
def ep_Q2_054_partial_29_0106 : Poly :=
[
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 29. -/
theorem ep_Q2_054_partial_29_0106_valid :
    mulPoly ep_Q2_054_coefficient_29_0106
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0107 : Poly :=
[
  term ((137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 107 for generator 29. -/
def ep_Q2_054_partial_29_0107 : Poly :=
[
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 29. -/
theorem ep_Q2_054_partial_29_0107_valid :
    mulPoly ep_Q2_054_coefficient_29_0107
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0108 : Poly :=
[
  term ((-1812093525000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 108 for generator 29. -/
def ep_Q2_054_partial_29_0108 : Poly :=
[
  term ((-3624187050000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1812093525000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3624187050000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((1812093525000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 29. -/
theorem ep_Q2_054_partial_29_0108_valid :
    mulPoly ep_Q2_054_coefficient_29_0108
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0109 : Poly :=
[
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 29. -/
def ep_Q2_054_partial_29_0109 : Poly :=
[
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 29. -/
theorem ep_Q2_054_partial_29_0109_valid :
    mulPoly ep_Q2_054_coefficient_29_0109
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0110 : Poly :=
[
  term ((1510077937500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2)]
]

/-- Partial product 110 for generator 29. -/
def ep_Q2_054_partial_29_0110 : Poly :=
[
  term ((3020155875000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 1), (14, 1)],
  term ((-1510077937500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 2)],
  term ((3020155875000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1510077937500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 29. -/
theorem ep_Q2_054_partial_29_0110_valid :
    mulPoly ep_Q2_054_coefficient_29_0110
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0111 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 111 for generator 29. -/
def ep_Q2_054_partial_29_0111 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 29. -/
theorem ep_Q2_054_partial_29_0111_valid :
    mulPoly ep_Q2_054_coefficient_29_0111
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0112 : Poly :=
[
  term ((-507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1)]
]

/-- Partial product 112 for generator 29. -/
def ep_Q2_054_partial_29_0112 : Poly :=
[
  term ((-1015870612500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2)],
  term ((-1015870612500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (14, 1)],
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 29. -/
theorem ep_Q2_054_partial_29_0112_valid :
    mulPoly ep_Q2_054_coefficient_29_0112
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0113 : Poly :=
[
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 113 for generator 29. -/
def ep_Q2_054_partial_29_0113 : Poly :=
[
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 29. -/
theorem ep_Q2_054_partial_29_0113_valid :
    mulPoly ep_Q2_054_coefficient_29_0113
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0114 : Poly :=
[
  term ((1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 114 for generator 29. -/
def ep_Q2_054_partial_29_0114 : Poly :=
[
  term ((2471036625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((2471036625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 2), (15, 2)],
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 29. -/
theorem ep_Q2_054_partial_29_0114_valid :
    mulPoly ep_Q2_054_coefficient_29_0114
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0115 : Poly :=
[
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 29. -/
def ep_Q2_054_partial_29_0115 : Poly :=
[
  term ((1098238500000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 29. -/
theorem ep_Q2_054_partial_29_0115_valid :
    mulPoly ep_Q2_054_coefficient_29_0115
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0116 : Poly :=
[
  term ((128127825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 116 for generator 29. -/
def ep_Q2_054_partial_29_0116 : Poly :=
[
  term ((256255650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (16, 1)],
  term ((256255650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 29. -/
theorem ep_Q2_054_partial_29_0116_valid :
    mulPoly ep_Q2_054_coefficient_29_0116
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0117 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 117 for generator 29. -/
def ep_Q2_054_partial_29_0117 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 29. -/
theorem ep_Q2_054_partial_29_0117_valid :
    mulPoly ep_Q2_054_coefficient_29_0117
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0118 : Poly :=
[
  term ((-27204443114400 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 118 for generator 29. -/
def ep_Q2_054_partial_29_0118 : Poly :=
[
  term ((-54408886228800 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-54408886228800 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 29. -/
theorem ep_Q2_054_partial_29_0118_valid :
    mulPoly ep_Q2_054_coefficient_29_0118
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0119 : Poly :=
[
  term ((19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 119 for generator 29. -/
def ep_Q2_054_partial_29_0119 : Poly :=
[
  term ((38086220360160 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((38086220360160 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 29. -/
theorem ep_Q2_054_partial_29_0119_valid :
    mulPoly ep_Q2_054_coefficient_29_0119
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0120 : Poly :=
[
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 120 for generator 29. -/
def ep_Q2_054_partial_29_0120 : Poly :=
[
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 29. -/
theorem ep_Q2_054_partial_29_0120_valid :
    mulPoly ep_Q2_054_coefficient_29_0120
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0121 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 121 for generator 29. -/
def ep_Q2_054_partial_29_0121 : Poly :=
[
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 2), (15, 3)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 29. -/
theorem ep_Q2_054_partial_29_0121_valid :
    mulPoly ep_Q2_054_coefficient_29_0121
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0122 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 122 for generator 29. -/
def ep_Q2_054_partial_29_0122 : Poly :=
[
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 29. -/
theorem ep_Q2_054_partial_29_0122_valid :
    mulPoly ep_Q2_054_coefficient_29_0122
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0123 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 123 for generator 29. -/
def ep_Q2_054_partial_29_0123 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 29. -/
theorem ep_Q2_054_partial_29_0123_valid :
    mulPoly ep_Q2_054_coefficient_29_0123
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0124 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 124 for generator 29. -/
def ep_Q2_054_partial_29_0124 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 29. -/
theorem ep_Q2_054_partial_29_0124_valid :
    mulPoly ep_Q2_054_coefficient_29_0124
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0125 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 125 for generator 29. -/
def ep_Q2_054_partial_29_0125 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 29. -/
theorem ep_Q2_054_partial_29_0125_valid :
    mulPoly ep_Q2_054_coefficient_29_0125
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0126 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 126 for generator 29. -/
def ep_Q2_054_partial_29_0126 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 2), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 29. -/
theorem ep_Q2_054_partial_29_0126_valid :
    mulPoly ep_Q2_054_coefficient_29_0126
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0127 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 127 for generator 29. -/
def ep_Q2_054_partial_29_0127 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 29. -/
theorem ep_Q2_054_partial_29_0127_valid :
    mulPoly ep_Q2_054_coefficient_29_0127
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0128 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 128 for generator 29. -/
def ep_Q2_054_partial_29_0128 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 29. -/
theorem ep_Q2_054_partial_29_0128_valid :
    mulPoly ep_Q2_054_coefficient_29_0128
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0129 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 29. -/
def ep_Q2_054_partial_29_0129 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 29. -/
theorem ep_Q2_054_partial_29_0129_valid :
    mulPoly ep_Q2_054_coefficient_29_0129
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0130 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 130 for generator 29. -/
def ep_Q2_054_partial_29_0130 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 3)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 29. -/
theorem ep_Q2_054_partial_29_0130_valid :
    mulPoly ep_Q2_054_coefficient_29_0130
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0131 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 131 for generator 29. -/
def ep_Q2_054_partial_29_0131 : Poly :=
[
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 29. -/
theorem ep_Q2_054_partial_29_0131_valid :
    mulPoly ep_Q2_054_coefficient_29_0131
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0132 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 132 for generator 29. -/
def ep_Q2_054_partial_29_0132 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 29. -/
theorem ep_Q2_054_partial_29_0132_valid :
    mulPoly ep_Q2_054_coefficient_29_0132
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0133 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 29. -/
def ep_Q2_054_partial_29_0133 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 29. -/
theorem ep_Q2_054_partial_29_0133_valid :
    mulPoly ep_Q2_054_coefficient_29_0133
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0134 : Poly :=
[
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 134 for generator 29. -/
def ep_Q2_054_partial_29_0134 : Poly :=
[
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 29. -/
theorem ep_Q2_054_partial_29_0134_valid :
    mulPoly ep_Q2_054_coefficient_29_0134
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0135 : Poly :=
[
  term ((29924887425840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)]
]

/-- Partial product 135 for generator 29. -/
def ep_Q2_054_partial_29_0135 : Poly :=
[
  term ((59849774851680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-29924887425840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2)],
  term ((59849774851680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 3)],
  term ((-29924887425840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 29. -/
theorem ep_Q2_054_partial_29_0135_valid :
    mulPoly ep_Q2_054_coefficient_29_0135
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0136 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 136 for generator 29. -/
def ep_Q2_054_partial_29_0136 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 29. -/
theorem ep_Q2_054_partial_29_0136_valid :
    mulPoly ep_Q2_054_coefficient_29_0136
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0137 : Poly :=
[
  term ((-24937406188200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 137 for generator 29. -/
def ep_Q2_054_partial_29_0137 : Poly :=
[
  term ((-49874812376400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((24937406188200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-49874812376400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((24937406188200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 29. -/
theorem ep_Q2_054_partial_29_0137_valid :
    mulPoly ep_Q2_054_coefficient_29_0137
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0138 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 29. -/
def ep_Q2_054_partial_29_0138 : Poly :=
[
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 29. -/
theorem ep_Q2_054_partial_29_0138_valid :
    mulPoly ep_Q2_054_coefficient_29_0138
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0139 : Poly :=
[
  term ((8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 139 for generator 29. -/
def ep_Q2_054_partial_29_0139 : Poly :=
[
  term ((16776073253880 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 2), (15, 1)],
  term ((16776073253880 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 29. -/
theorem ep_Q2_054_partial_29_0139_valid :
    mulPoly ep_Q2_054_coefficient_29_0139
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0140 : Poly :=
[
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 29. -/
def ep_Q2_054_partial_29_0140 : Poly :=
[
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 29. -/
theorem ep_Q2_054_partial_29_0140_valid :
    mulPoly ep_Q2_054_coefficient_29_0140
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0141 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 141 for generator 29. -/
def ep_Q2_054_partial_29_0141 : Poly :=
[
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 29. -/
theorem ep_Q2_054_partial_29_0141_valid :
    mulPoly ep_Q2_054_coefficient_29_0141
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0142 : Poly :=
[
  term ((-20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)]
]

/-- Partial product 142 for generator 29. -/
def ep_Q2_054_partial_29_0142 : Poly :=
[
  term ((-40806664671600 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1), (15, 2)],
  term ((-40806664671600 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 3)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 29. -/
theorem ep_Q2_054_partial_29_0142_valid :
    mulPoly ep_Q2_054_coefficient_29_0142
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0143 : Poly :=
[
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 143 for generator 29. -/
def ep_Q2_054_partial_29_0143 : Poly :=
[
  term ((-18136295409600 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-18136295409600 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 3), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 29. -/
theorem ep_Q2_054_partial_29_0143_valid :
    mulPoly ep_Q2_054_coefficient_29_0143
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0144 : Poly :=
[
  term ((-8020492001946 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 144 for generator 29. -/
def ep_Q2_054_partial_29_0144 : Poly :=
[
  term ((-16040984003892 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((8020492001946 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-16040984003892 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((8020492001946 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 29. -/
theorem ep_Q2_054_partial_29_0144_valid :
    mulPoly ep_Q2_054_coefficient_29_0144
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0145 : Poly :=
[
  term ((-1334484998955 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 29. -/
def ep_Q2_054_partial_29_0145 : Poly :=
[
  term ((-2668969997910 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1334484998955 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2668969997910 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((1334484998955 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 29. -/
theorem ep_Q2_054_partial_29_0145_valid :
    mulPoly ep_Q2_054_coefficient_29_0145
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0146 : Poly :=
[
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1)]
]

/-- Partial product 146 for generator 29. -/
def ep_Q2_054_partial_29_0146 : Poly :=
[
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 2)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 29. -/
theorem ep_Q2_054_partial_29_0146_valid :
    mulPoly ep_Q2_054_coefficient_29_0146
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0147 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 147 for generator 29. -/
def ep_Q2_054_partial_29_0147 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 29. -/
theorem ep_Q2_054_partial_29_0147_valid :
    mulPoly ep_Q2_054_coefficient_29_0147
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0148 : Poly :=
[
  term ((-448363838232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 148 for generator 29. -/
def ep_Q2_054_partial_29_0148 : Poly :=
[
  term ((-896727676464 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((448363838232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 2)],
  term ((-896727676464 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((448363838232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 29. -/
theorem ep_Q2_054_partial_29_0148_valid :
    mulPoly ep_Q2_054_coefficient_29_0148
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0149 : Poly :=
[
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)]
]

/-- Partial product 149 for generator 29. -/
def ep_Q2_054_partial_29_0149 : Poly :=
[
  term ((1208062350000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (12, 2)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 29. -/
theorem ep_Q2_054_partial_29_0149_valid :
    mulPoly ep_Q2_054_coefficient_29_0149
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0150 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 150 for generator 29. -/
def ep_Q2_054_partial_29_0150 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 29. -/
theorem ep_Q2_054_partial_29_0150_valid :
    mulPoly ep_Q2_054_coefficient_29_0150
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0151 : Poly :=
[
  term ((1040990700510 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 151 for generator 29. -/
def ep_Q2_054_partial_29_0151 : Poly :=
[
  term ((2081981401020 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1040990700510 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((2081981401020 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1040990700510 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 29. -/
theorem ep_Q2_054_partial_29_0151_valid :
    mulPoly ep_Q2_054_coefficient_29_0151
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0152 : Poly :=
[
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 152 for generator 29. -/
def ep_Q2_054_partial_29_0152 : Poly :=
[
  term ((-33371207766675 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (12, 2), (15, 1)],
  term ((-33371207766675 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 29. -/
theorem ep_Q2_054_partial_29_0152_valid :
    mulPoly ep_Q2_054_coefficient_29_0152
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0153 : Poly :=
[
  term ((-6548510765115 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 153 for generator 29. -/
def ep_Q2_054_partial_29_0153 : Poly :=
[
  term ((-6548510765115 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((6548510765115 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-6548510765115 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((6548510765115 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 29. -/
theorem ep_Q2_054_partial_29_0153_valid :
    mulPoly ep_Q2_054_coefficient_29_0153
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0154 : Poly :=
[
  term ((-10437929280153 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 154 for generator 29. -/
def ep_Q2_054_partial_29_0154 : Poly :=
[
  term ((-10437929280153 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((10437929280153 : Rat) / 180133946068) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-10437929280153 : Rat) / 90066973034) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((10437929280153 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 29. -/
theorem ep_Q2_054_partial_29_0154_valid :
    mulPoly ep_Q2_054_coefficient_29_0154
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0155 : Poly :=
[
  term ((24397721622702 : Rat) / 45033486517) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 155 for generator 29. -/
def ep_Q2_054_partial_29_0155 : Poly :=
[
  term ((48795443245404 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24397721622702 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((48795443245404 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-24397721622702 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 29. -/
theorem ep_Q2_054_partial_29_0155_valid :
    mulPoly ep_Q2_054_coefficient_29_0155
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0156 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 29. -/
def ep_Q2_054_partial_29_0156 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 29. -/
theorem ep_Q2_054_partial_29_0156_valid :
    mulPoly ep_Q2_054_coefficient_29_0156
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0157 : Poly :=
[
  term ((-3400309586853 : Rat) / 90066973034) [(1, 1), (7, 1)]
]

/-- Partial product 157 for generator 29. -/
def ep_Q2_054_partial_29_0157 : Poly :=
[
  term ((-3400309586853 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((3400309586853 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 2)],
  term ((-3400309586853 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((3400309586853 : Rat) / 90066973034) [(1, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 29. -/
theorem ep_Q2_054_partial_29_0157_valid :
    mulPoly ep_Q2_054_coefficient_29_0157
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0158 : Poly :=
[
  term ((4057616675601 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 158 for generator 29. -/
def ep_Q2_054_partial_29_0158 : Poly :=
[
  term ((8115233351202 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((-4057616675601 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2)],
  term ((8115233351202 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-4057616675601 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 29. -/
theorem ep_Q2_054_partial_29_0158_valid :
    mulPoly ep_Q2_054_coefficient_29_0158
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0159 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 159 for generator 29. -/
def ep_Q2_054_partial_29_0159 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 29. -/
theorem ep_Q2_054_partial_29_0159_valid :
    mulPoly ep_Q2_054_coefficient_29_0159
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0160 : Poly :=
[
  term ((-1464318000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 160 for generator 29. -/
def ep_Q2_054_partial_29_0160 : Poly :=
[
  term ((-2928636000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1464318000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2928636000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1464318000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 29. -/
theorem ep_Q2_054_partial_29_0160_valid :
    mulPoly ep_Q2_054_coefficient_29_0160
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0161 : Poly :=
[
  term ((1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 161 for generator 29. -/
def ep_Q2_054_partial_29_0161 : Poly :=
[
  term ((2050045200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 2)],
  term ((2050045200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 29. -/
theorem ep_Q2_054_partial_29_0161_valid :
    mulPoly ep_Q2_054_coefficient_29_0161
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0162 : Poly :=
[
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 162 for generator 29. -/
def ep_Q2_054_partial_29_0162 : Poly :=
[
  term ((-732159000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 2)],
  term ((-732159000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2), (14, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 29. -/
theorem ep_Q2_054_partial_29_0162_valid :
    mulPoly ep_Q2_054_coefficient_29_0162
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0163 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 163 for generator 29. -/
def ep_Q2_054_partial_29_0163 : Poly :=
[
  term ((1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 2), (15, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 29. -/
theorem ep_Q2_054_partial_29_0163_valid :
    mulPoly ep_Q2_054_coefficient_29_0163
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0164 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 164 for generator 29. -/
def ep_Q2_054_partial_29_0164 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 29. -/
theorem ep_Q2_054_partial_29_0164_valid :
    mulPoly ep_Q2_054_coefficient_29_0164
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0165 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 165 for generator 29. -/
def ep_Q2_054_partial_29_0165 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 29. -/
theorem ep_Q2_054_partial_29_0165_valid :
    mulPoly ep_Q2_054_coefficient_29_0165
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0166 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 166 for generator 29. -/
def ep_Q2_054_partial_29_0166 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 2)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 29. -/
theorem ep_Q2_054_partial_29_0166_valid :
    mulPoly ep_Q2_054_coefficient_29_0166
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0167 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 167 for generator 29. -/
def ep_Q2_054_partial_29_0167 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 29. -/
theorem ep_Q2_054_partial_29_0167_valid :
    mulPoly ep_Q2_054_coefficient_29_0167
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0168 : Poly :=
[
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 168 for generator 29. -/
def ep_Q2_054_partial_29_0168 : Poly :=
[
  term ((-3946797998145 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((-3946797998145 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 29. -/
theorem ep_Q2_054_partial_29_0168_valid :
    mulPoly ep_Q2_054_coefficient_29_0168
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0169 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 169 for generator 29. -/
def ep_Q2_054_partial_29_0169 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 29. -/
theorem ep_Q2_054_partial_29_0169_valid :
    mulPoly ep_Q2_054_coefficient_29_0169
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0170 : Poly :=
[
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 170 for generator 29. -/
def ep_Q2_054_partial_29_0170 : Poly :=
[
  term ((3811744039050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 2)],
  term ((3811744039050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (14, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 29. -/
theorem ep_Q2_054_partial_29_0170_valid :
    mulPoly ep_Q2_054_coefficient_29_0170
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0171 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 171 for generator 29. -/
def ep_Q2_054_partial_29_0171 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 29. -/
theorem ep_Q2_054_partial_29_0171_valid :
    mulPoly ep_Q2_054_coefficient_29_0171
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0172 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 172 for generator 29. -/
def ep_Q2_054_partial_29_0172 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 2), (15, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 29. -/
theorem ep_Q2_054_partial_29_0172_valid :
    mulPoly ep_Q2_054_coefficient_29_0172
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0173 : Poly :=
[
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 29. -/
def ep_Q2_054_partial_29_0173 : Poly :=
[
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 29. -/
theorem ep_Q2_054_partial_29_0173_valid :
    mulPoly ep_Q2_054_coefficient_29_0173
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0174 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 174 for generator 29. -/
def ep_Q2_054_partial_29_0174 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 29. -/
theorem ep_Q2_054_partial_29_0174_valid :
    mulPoly ep_Q2_054_coefficient_29_0174
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0175 : Poly :=
[
  term ((-1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 175 for generator 29. -/
def ep_Q2_054_partial_29_0175 : Poly :=
[
  term ((-3030305134554 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3030305134554 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 29. -/
theorem ep_Q2_054_partial_29_0175_valid :
    mulPoly ep_Q2_054_coefficient_29_0175
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0176 : Poly :=
[
  term ((8353388458575 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 176 for generator 29. -/
def ep_Q2_054_partial_29_0176 : Poly :=
[
  term ((8353388458575 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8353388458575 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((8353388458575 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8353388458575 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 29. -/
theorem ep_Q2_054_partial_29_0176_valid :
    mulPoly ep_Q2_054_coefficient_29_0176
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0177 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 29. -/
def ep_Q2_054_partial_29_0177 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 29. -/
theorem ep_Q2_054_partial_29_0177_valid :
    mulPoly ep_Q2_054_coefficient_29_0177
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0178 : Poly :=
[
  term ((-4763550739050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)]
]

/-- Partial product 178 for generator 29. -/
def ep_Q2_054_partial_29_0178 : Poly :=
[
  term ((-9527101478100 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (14, 1)],
  term ((4763550739050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 2)],
  term ((-9527101478100 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((4763550739050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 29. -/
theorem ep_Q2_054_partial_29_0178_valid :
    mulPoly ep_Q2_054_coefficient_29_0178
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0179 : Poly :=
[
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 179 for generator 29. -/
def ep_Q2_054_partial_29_0179 : Poly :=
[
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 29. -/
theorem ep_Q2_054_partial_29_0179_valid :
    mulPoly ep_Q2_054_coefficient_29_0179
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0180 : Poly :=
[
  term ((5052331608597 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 180 for generator 29. -/
def ep_Q2_054_partial_29_0180 : Poly :=
[
  term ((5052331608597 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5052331608597 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((5052331608597 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 2), (14, 1)],
  term ((-5052331608597 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 29. -/
theorem ep_Q2_054_partial_29_0180_valid :
    mulPoly ep_Q2_054_coefficient_29_0180
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0181 : Poly :=
[
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 181 for generator 29. -/
def ep_Q2_054_partial_29_0181 : Poly :=
[
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 29. -/
theorem ep_Q2_054_partial_29_0181_valid :
    mulPoly ep_Q2_054_coefficient_29_0181
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0182 : Poly :=
[
  term ((-1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 182 for generator 29. -/
def ep_Q2_054_partial_29_0182 : Poly :=
[
  term ((-2831484104496 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2831484104496 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 29. -/
theorem ep_Q2_054_partial_29_0182_valid :
    mulPoly ep_Q2_054_coefficient_29_0182
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0183 : Poly :=
[
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 29. -/
def ep_Q2_054_partial_29_0183 : Poly :=
[
  term ((-976212000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-976212000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 29. -/
theorem ep_Q2_054_partial_29_0183_valid :
    mulPoly ep_Q2_054_coefficient_29_0183
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0184 : Poly :=
[
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 184 for generator 29. -/
def ep_Q2_054_partial_29_0184 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 29. -/
theorem ep_Q2_054_partial_29_0184_valid :
    mulPoly ep_Q2_054_coefficient_29_0184
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0185 : Poly :=
[
  term ((784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 185 for generator 29. -/
def ep_Q2_054_partial_29_0185 : Poly :=
[
  term ((1568227027104 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((1568227027104 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 29. -/
theorem ep_Q2_054_partial_29_0185_valid :
    mulPoly ep_Q2_054_coefficient_29_0185
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0186 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 186 for generator 29. -/
def ep_Q2_054_partial_29_0186 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 29. -/
theorem ep_Q2_054_partial_29_0186_valid :
    mulPoly ep_Q2_054_coefficient_29_0186
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0187 : Poly :=
[
  term ((-5682552513741 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 187 for generator 29. -/
def ep_Q2_054_partial_29_0187 : Poly :=
[
  term ((-11365105027482 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((5682552513741 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-11365105027482 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((5682552513741 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 29. -/
theorem ep_Q2_054_partial_29_0187_valid :
    mulPoly ep_Q2_054_coefficient_29_0187
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0188 : Poly :=
[
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 188 for generator 29. -/
def ep_Q2_054_partial_29_0188 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 29. -/
theorem ep_Q2_054_partial_29_0188_valid :
    mulPoly ep_Q2_054_coefficient_29_0188
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0189 : Poly :=
[
  term ((13602221557200 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 189 for generator 29. -/
def ep_Q2_054_partial_29_0189 : Poly :=
[
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 29. -/
theorem ep_Q2_054_partial_29_0189_valid :
    mulPoly ep_Q2_054_coefficient_29_0189
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0190 : Poly :=
[
  term ((-9521555090040 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 190 for generator 29. -/
def ep_Q2_054_partial_29_0190 : Poly :=
[
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((9521555090040 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((9521555090040 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 29. -/
theorem ep_Q2_054_partial_29_0190_valid :
    mulPoly ep_Q2_054_coefficient_29_0190
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0191 : Poly :=
[
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 191 for generator 29. -/
def ep_Q2_054_partial_29_0191 : Poly :=
[
  term ((4578585912864 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((4578585912864 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 29. -/
theorem ep_Q2_054_partial_29_0191_valid :
    mulPoly ep_Q2_054_coefficient_29_0191
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0192 : Poly :=
[
  term ((-5385926201220 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 192 for generator 29. -/
def ep_Q2_054_partial_29_0192 : Poly :=
[
  term ((-10771852402440 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((5385926201220 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((-10771852402440 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((5385926201220 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 29. -/
theorem ep_Q2_054_partial_29_0192_valid :
    mulPoly ep_Q2_054_coefficient_29_0192
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0193 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 193 for generator 29. -/
def ep_Q2_054_partial_29_0193 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 3)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 29. -/
theorem ep_Q2_054_partial_29_0193_valid :
    mulPoly ep_Q2_054_coefficient_29_0193
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0194 : Poly :=
[
  term ((-3053435381796 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 194 for generator 29. -/
def ep_Q2_054_partial_29_0194 : Poly :=
[
  term ((-6106870763592 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((3053435381796 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-6106870763592 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((3053435381796 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 29. -/
theorem ep_Q2_054_partial_29_0194_valid :
    mulPoly ep_Q2_054_coefficient_29_0194
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0195 : Poly :=
[
  term ((857476959984 : Rat) / 45033486517) [(1, 1), (9, 1)]
]

/-- Partial product 195 for generator 29. -/
def ep_Q2_054_partial_29_0195 : Poly :=
[
  term ((1714953919968 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-857476959984 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 2)],
  term ((1714953919968 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-857476959984 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 29. -/
theorem ep_Q2_054_partial_29_0195_valid :
    mulPoly ep_Q2_054_coefficient_29_0195
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0196 : Poly :=
[
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 196 for generator 29. -/
def ep_Q2_054_partial_29_0196 : Poly :=
[
  term ((1430769186504 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((1430769186504 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 29. -/
theorem ep_Q2_054_partial_29_0196_valid :
    mulPoly ep_Q2_054_coefficient_29_0196
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0197 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 197 for generator 29. -/
def ep_Q2_054_partial_29_0197 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 29. -/
theorem ep_Q2_054_partial_29_0197_valid :
    mulPoly ep_Q2_054_coefficient_29_0197
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0198 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 198 for generator 29. -/
def ep_Q2_054_partial_29_0198 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 29. -/
theorem ep_Q2_054_partial_29_0198_valid :
    mulPoly ep_Q2_054_coefficient_29_0198
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0199 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 199 for generator 29. -/
def ep_Q2_054_partial_29_0199 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 29. -/
theorem ep_Q2_054_partial_29_0199_valid :
    mulPoly ep_Q2_054_coefficient_29_0199
        ep_Q2_054_generator_29_0100_0199 =
      ep_Q2_054_partial_29_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_29_0100_0199 : List Poly :=
[
  ep_Q2_054_partial_29_0100,
  ep_Q2_054_partial_29_0101,
  ep_Q2_054_partial_29_0102,
  ep_Q2_054_partial_29_0103,
  ep_Q2_054_partial_29_0104,
  ep_Q2_054_partial_29_0105,
  ep_Q2_054_partial_29_0106,
  ep_Q2_054_partial_29_0107,
  ep_Q2_054_partial_29_0108,
  ep_Q2_054_partial_29_0109,
  ep_Q2_054_partial_29_0110,
  ep_Q2_054_partial_29_0111,
  ep_Q2_054_partial_29_0112,
  ep_Q2_054_partial_29_0113,
  ep_Q2_054_partial_29_0114,
  ep_Q2_054_partial_29_0115,
  ep_Q2_054_partial_29_0116,
  ep_Q2_054_partial_29_0117,
  ep_Q2_054_partial_29_0118,
  ep_Q2_054_partial_29_0119,
  ep_Q2_054_partial_29_0120,
  ep_Q2_054_partial_29_0121,
  ep_Q2_054_partial_29_0122,
  ep_Q2_054_partial_29_0123,
  ep_Q2_054_partial_29_0124,
  ep_Q2_054_partial_29_0125,
  ep_Q2_054_partial_29_0126,
  ep_Q2_054_partial_29_0127,
  ep_Q2_054_partial_29_0128,
  ep_Q2_054_partial_29_0129,
  ep_Q2_054_partial_29_0130,
  ep_Q2_054_partial_29_0131,
  ep_Q2_054_partial_29_0132,
  ep_Q2_054_partial_29_0133,
  ep_Q2_054_partial_29_0134,
  ep_Q2_054_partial_29_0135,
  ep_Q2_054_partial_29_0136,
  ep_Q2_054_partial_29_0137,
  ep_Q2_054_partial_29_0138,
  ep_Q2_054_partial_29_0139,
  ep_Q2_054_partial_29_0140,
  ep_Q2_054_partial_29_0141,
  ep_Q2_054_partial_29_0142,
  ep_Q2_054_partial_29_0143,
  ep_Q2_054_partial_29_0144,
  ep_Q2_054_partial_29_0145,
  ep_Q2_054_partial_29_0146,
  ep_Q2_054_partial_29_0147,
  ep_Q2_054_partial_29_0148,
  ep_Q2_054_partial_29_0149,
  ep_Q2_054_partial_29_0150,
  ep_Q2_054_partial_29_0151,
  ep_Q2_054_partial_29_0152,
  ep_Q2_054_partial_29_0153,
  ep_Q2_054_partial_29_0154,
  ep_Q2_054_partial_29_0155,
  ep_Q2_054_partial_29_0156,
  ep_Q2_054_partial_29_0157,
  ep_Q2_054_partial_29_0158,
  ep_Q2_054_partial_29_0159,
  ep_Q2_054_partial_29_0160,
  ep_Q2_054_partial_29_0161,
  ep_Q2_054_partial_29_0162,
  ep_Q2_054_partial_29_0163,
  ep_Q2_054_partial_29_0164,
  ep_Q2_054_partial_29_0165,
  ep_Q2_054_partial_29_0166,
  ep_Q2_054_partial_29_0167,
  ep_Q2_054_partial_29_0168,
  ep_Q2_054_partial_29_0169,
  ep_Q2_054_partial_29_0170,
  ep_Q2_054_partial_29_0171,
  ep_Q2_054_partial_29_0172,
  ep_Q2_054_partial_29_0173,
  ep_Q2_054_partial_29_0174,
  ep_Q2_054_partial_29_0175,
  ep_Q2_054_partial_29_0176,
  ep_Q2_054_partial_29_0177,
  ep_Q2_054_partial_29_0178,
  ep_Q2_054_partial_29_0179,
  ep_Q2_054_partial_29_0180,
  ep_Q2_054_partial_29_0181,
  ep_Q2_054_partial_29_0182,
  ep_Q2_054_partial_29_0183,
  ep_Q2_054_partial_29_0184,
  ep_Q2_054_partial_29_0185,
  ep_Q2_054_partial_29_0186,
  ep_Q2_054_partial_29_0187,
  ep_Q2_054_partial_29_0188,
  ep_Q2_054_partial_29_0189,
  ep_Q2_054_partial_29_0190,
  ep_Q2_054_partial_29_0191,
  ep_Q2_054_partial_29_0192,
  ep_Q2_054_partial_29_0193,
  ep_Q2_054_partial_29_0194,
  ep_Q2_054_partial_29_0195,
  ep_Q2_054_partial_29_0196,
  ep_Q2_054_partial_29_0197,
  ep_Q2_054_partial_29_0198,
  ep_Q2_054_partial_29_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_29_0100_0199 : Poly :=
[
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (14, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 3)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 3), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2), (15, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 3), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3624187050000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((1812093525000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3624187050000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2086653150000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 3)],
  term ((3020155875000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 1), (14, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1510077937500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((3020155875000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1510077937500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 2), (16, 1)],
  term ((2471036625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1015870612500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((256255650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1015870612500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (14, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (16, 1)],
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 3)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 3), (16, 1)],
  term ((256255650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2471036625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 2), (15, 2)],
  term ((1098238500000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 3), (15, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-54408886228800 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-54408886228800 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((38086220360160 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((38086220360160 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 3), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 2), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 2), (15, 3)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 3), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 2), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 3), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 3), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 3)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 3), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((59849774851680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-29924887425840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((59849774851680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 3)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-34458961278240 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 3), (15, 1)],
  term ((-49874812376400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24937406188200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-49874812376400 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((24937406188200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((-40806664671600 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-18136295409600 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((16776073253880 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16040984003892 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2668969997910 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((16776073253880 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((8020492001946 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((1334484998955 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 3), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 3), (15, 1), (16, 1)],
  term ((-16040984003892 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-2668969997910 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((23379152895018 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((1334484998955 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-40806664671600 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 3)],
  term ((-18136295409600 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 3), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3), (15, 2), (16, 1)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 2)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 2)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 3)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (12, 2)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 2)],
  term ((-896727676464 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((448363838232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 2)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((-896727676464 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((448363838232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((2081981401020 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1040990700510 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((2081981401020 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1040990700510 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((-33371207766675 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (12, 2), (15, 1)],
  term ((-33371207766675 : Rat) / 45033486517) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 2), (15, 1)],
  term ((-6548510765115 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((6548510765115 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-6548510765115 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((6548510765115 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-10437929280153 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((48795443245404 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10437929280153 : Rat) / 180133946068) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-24397721622702 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((48795443245404 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-59233372525557 : Rat) / 90066973034) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((10437929280153 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 3)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2928636000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((1464318000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2928636000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 3)],
  term ((2050045200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 2)],
  term ((2050045200000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1025022600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 2)],
  term ((1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-732159000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 2)],
  term ((8115233351202 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((-4057616675601 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-732159000000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2), (14, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 3)],
  term ((8115233351202 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-4057616675601 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((1757181600000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 2), (15, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 3), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 3)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 2)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 3)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3811744039050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 2)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3946797998145 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3811744039050 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (14, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 3)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 3), (16, 1)],
  term ((-3946797998145 : Rat) / 90066973034) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 2), (15, 2)],
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 3), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3030305134554 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((8353388458575 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((-8353388458575 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8353388458575 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14413998727683 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 3)],
  term ((-9527101478100 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (14, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((4763550739050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 2)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((-9527101478100 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((4763550739050 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 2)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 2), (16, 1)],
  term ((-2831484104496 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-976212000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5052331608597 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5052331608597 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3400309586853 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((3400309586853 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 2)],
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5052331608597 : Rat) / 90066973034) [(1, 1), (7, 1), (12, 2), (14, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-5052331608597 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 3)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 3), (16, 1)],
  term ((-3400309586853 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3400309586853 : Rat) / 90066973034) [(1, 1), (7, 1), (13, 2)],
  term ((-2831484104496 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((-976212000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 3), (15, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1568227027104 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((1568227027104 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11365105027482 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((5682552513741 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-11365105027482 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((5682552513741 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((9521555090040 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((-19043110180080 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((9521555090040 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((-10771852402440 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4578585912864 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6106870763592 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((5385926201220 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((4578585912864 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((3053435381796 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 3), (15, 1)],
  term ((-6106870763592 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-7718417020644 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 3)],
  term ((5385926201220 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 3)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 3), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1430769186504 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((1430769186504 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((1714953919968 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-857476959984 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 2)],
  term ((1714953919968 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-857476959984 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 100 through 199. -/
theorem ep_Q2_054_block_29_0100_0199_valid :
    checkProductSumEq ep_Q2_054_partials_29_0100_0199
      ep_Q2_054_block_29_0100_0199 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
