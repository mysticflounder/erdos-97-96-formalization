/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 2:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 2 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_02_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0100 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 100 for generator 2. -/
def ep_Q2_054_partial_02_0100 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 3), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 2. -/
theorem ep_Q2_054_partial_02_0100_valid :
    mulPoly ep_Q2_054_coefficient_02_0100
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0101 : Poly :=
[
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 101 for generator 2. -/
def ep_Q2_054_partial_02_0101 : Poly :=
[
  term ((-988414650000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((988414650000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 3), (15, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 2. -/
theorem ep_Q2_054_partial_02_0101_valid :
    mulPoly ep_Q2_054_coefficient_02_0101
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0102 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 2. -/
def ep_Q2_054_partial_02_0102 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 2. -/
theorem ep_Q2_054_partial_02_0102_valid :
    mulPoly ep_Q2_054_coefficient_02_0102
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0103 : Poly :=
[
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 103 for generator 2. -/
def ep_Q2_054_partial_02_0103 : Poly :=
[
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (10, 1), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 2. -/
theorem ep_Q2_054_partial_02_0103_valid :
    mulPoly ep_Q2_054_coefficient_02_0103
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0104 : Poly :=
[
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 104 for generator 2. -/
def ep_Q2_054_partial_02_0104 : Poly :=
[
  term ((-274559625000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((274559625000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (11, 1), (13, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (11, 1), (13, 1)],
  term ((137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 3)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (11, 1), (13, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 2. -/
theorem ep_Q2_054_partial_02_0104_valid :
    mulPoly ep_Q2_054_coefficient_02_0104
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0105 : Poly :=
[
  term ((1592445825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 105 for generator 2. -/
def ep_Q2_054_partial_02_0105 : Poly :=
[
  term ((3184891650000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3184891650000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((1592445825000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((-1592445825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1592445825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((1592445825000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (11, 1), (15, 1)],
  term ((-3184891650000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((3184891650000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 2. -/
theorem ep_Q2_054_partial_02_0105_valid :
    mulPoly ep_Q2_054_coefficient_02_0105
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0106 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 2. -/
def ep_Q2_054_partial_02_0106 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 2. -/
theorem ep_Q2_054_partial_02_0106_valid :
    mulPoly ep_Q2_054_coefficient_02_0106
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0107 : Poly :=
[
  term ((-741310987500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2)]
]

/-- Partial product 107 for generator 2. -/
def ep_Q2_054_partial_02_0107 : Poly :=
[
  term ((-1482621975000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 2), (12, 1)],
  term ((1482621975000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (11, 2)],
  term ((-741310987500 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (11, 2)],
  term ((741310987500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 2)],
  term ((741310987500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 2)],
  term ((-741310987500 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (11, 2)],
  term ((1482621975000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (11, 2)],
  term ((-1482621975000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 2. -/
theorem ep_Q2_054_partial_02_0107_valid :
    mulPoly ep_Q2_054_coefficient_02_0107
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0108 : Poly :=
[
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1)]
]

/-- Partial product 108 for generator 2. -/
def ep_Q2_054_partial_02_0108 : Poly :=
[
  term ((1015870612500 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 2)],
  term ((-1015870612500 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (12, 1)],
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (12, 1)],
  term ((-507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2)],
  term ((-507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 3)],
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (12, 1)],
  term ((-1015870612500 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (12, 1)],
  term ((1015870612500 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 2. -/
theorem ep_Q2_054_partial_02_0108_valid :
    mulPoly ep_Q2_054_coefficient_02_0108
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0109 : Poly :=
[
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 109 for generator 2. -/
def ep_Q2_054_partial_02_0109 : Poly :=
[
  term ((549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 2), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 3), (16, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (12, 1), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 2. -/
theorem ep_Q2_054_partial_02_0109_valid :
    mulPoly ep_Q2_054_coefficient_02_0109
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0110 : Poly :=
[
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 110 for generator 2. -/
def ep_Q2_054_partial_02_0110 : Poly :=
[
  term ((-2471036625000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((2471036625000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 3), (15, 1)],
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (13, 1), (15, 1)],
  term ((2471036625000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2471036625000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 2. -/
theorem ep_Q2_054_partial_02_0110_valid :
    mulPoly ep_Q2_054_coefficient_02_0110
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0111 : Poly :=
[
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 2. -/
def ep_Q2_054_partial_02_0111 : Poly :=
[
  term ((-1098238500000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1098238500000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 2. -/
theorem ep_Q2_054_partial_02_0111_valid :
    mulPoly ep_Q2_054_coefficient_02_0111
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0112 : Poly :=
[
  term ((-183039750000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 112 for generator 2. -/
def ep_Q2_054_partial_02_0112 : Poly :=
[
  term ((-366079500000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((366079500000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((183039750000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (16, 1)],
  term ((183039750000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 2), (16, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (16, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 2. -/
theorem ep_Q2_054_partial_02_0112_valid :
    mulPoly ep_Q2_054_coefficient_02_0112
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0113 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 113 for generator 2. -/
def ep_Q2_054_partial_02_0113 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 2. -/
theorem ep_Q2_054_partial_02_0113_valid :
    mulPoly ep_Q2_054_coefficient_02_0113
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0114 : Poly :=
[
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 114 for generator 2. -/
def ep_Q2_054_partial_02_0114 : Poly :=
[
  term ((43527108983040 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-43527108983040 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (11, 1), (15, 2)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (11, 1), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (11, 1), (15, 2)],
  term ((-43527108983040 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((43527108983040 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 2. -/
theorem ep_Q2_054_partial_02_0114_valid :
    mulPoly ep_Q2_054_coefficient_02_0114
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0115 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 115 for generator 2. -/
def ep_Q2_054_partial_02_0115 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (11, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (11, 2), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 2. -/
theorem ep_Q2_054_partial_02_0115_valid :
    mulPoly ep_Q2_054_coefficient_02_0115
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0116 : Poly :=
[
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 116 for generator 2. -/
def ep_Q2_054_partial_02_0116 : Poly :=
[
  term ((13602221557200 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 2), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (12, 1), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 3), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (12, 1), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 2. -/
theorem ep_Q2_054_partial_02_0116_valid :
    mulPoly ep_Q2_054_coefficient_02_0116
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0117 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 117 for generator 2. -/
def ep_Q2_054_partial_02_0117 : Poly :=
[
  term ((-32645331737280 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((32645331737280 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 3), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (13, 1), (15, 2)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-32645331737280 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 2. -/
theorem ep_Q2_054_partial_02_0117_valid :
    mulPoly ep_Q2_054_coefficient_02_0117
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0118 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 118 for generator 2. -/
def ep_Q2_054_partial_02_0118 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 2. -/
theorem ep_Q2_054_partial_02_0118_valid :
    mulPoly ep_Q2_054_coefficient_02_0118
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0119 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 119 for generator 2. -/
def ep_Q2_054_partial_02_0119 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 2. -/
theorem ep_Q2_054_partial_02_0119_valid :
    mulPoly ep_Q2_054_coefficient_02_0119
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0120 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 120 for generator 2. -/
def ep_Q2_054_partial_02_0120 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 2. -/
theorem ep_Q2_054_partial_02_0120_valid :
    mulPoly ep_Q2_054_coefficient_02_0120
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0121 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 121 for generator 2. -/
def ep_Q2_054_partial_02_0121 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 3), (9, 1), (11, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 2. -/
theorem ep_Q2_054_partial_02_0121_valid :
    mulPoly ep_Q2_054_coefficient_02_0121
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0122 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 122 for generator 2. -/
def ep_Q2_054_partial_02_0122 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 3), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 3), (9, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 2. -/
theorem ep_Q2_054_partial_02_0122_valid :
    mulPoly ep_Q2_054_coefficient_02_0122
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0123 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 123 for generator 2. -/
def ep_Q2_054_partial_02_0123 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (11, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 2. -/
theorem ep_Q2_054_partial_02_0123_valid :
    mulPoly ep_Q2_054_coefficient_02_0123
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0124 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 124 for generator 2. -/
def ep_Q2_054_partial_02_0124 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 3), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (12, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 2. -/
theorem ep_Q2_054_partial_02_0124_valid :
    mulPoly ep_Q2_054_coefficient_02_0124
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0125 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 2. -/
def ep_Q2_054_partial_02_0125 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 2. -/
theorem ep_Q2_054_partial_02_0125_valid :
    mulPoly ep_Q2_054_coefficient_02_0125
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0126 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 126 for generator 2. -/
def ep_Q2_054_partial_02_0126 : Poly :=
[
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 3), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (13, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 2. -/
theorem ep_Q2_054_partial_02_0126_valid :
    mulPoly ep_Q2_054_coefficient_02_0126
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0127 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 2. -/
def ep_Q2_054_partial_02_0127 : Poly :=
[
  term ((-14509036327680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14509036327680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 2. -/
theorem ep_Q2_054_partial_02_0127_valid :
    mulPoly ep_Q2_054_coefficient_02_0127
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0128 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 128 for generator 2. -/
def ep_Q2_054_partial_02_0128 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 2. -/
theorem ep_Q2_054_partial_02_0128_valid :
    mulPoly ep_Q2_054_coefficient_02_0128
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0129 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 2. -/
def ep_Q2_054_partial_02_0129 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 2. -/
theorem ep_Q2_054_partial_02_0129_valid :
    mulPoly ep_Q2_054_coefficient_02_0129
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0130 : Poly :=
[
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 130 for generator 2. -/
def ep_Q2_054_partial_02_0130 : Poly :=
[
  term ((4534073852400 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 3), (15, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 3), (11, 1), (13, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 2. -/
theorem ep_Q2_054_partial_02_0130_valid :
    mulPoly ep_Q2_054_coefficient_02_0130
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0131 : Poly :=
[
  term ((-26297628343920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)]
]

/-- Partial product 131 for generator 2. -/
def ep_Q2_054_partial_02_0131 : Poly :=
[
  term ((-52595256687840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((52595256687840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (11, 1), (15, 2)],
  term ((-26297628343920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (11, 1), (15, 2)],
  term ((26297628343920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2)],
  term ((26297628343920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2)],
  term ((-26297628343920 : Rat) / 45033486517) [(1, 1), (2, 3), (11, 1), (15, 2)],
  term ((52595256687840 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-52595256687840 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 2. -/
theorem ep_Q2_054_partial_02_0131_valid :
    mulPoly ep_Q2_054_coefficient_02_0131
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0132 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 132 for generator 2. -/
def ep_Q2_054_partial_02_0132 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 3), (11, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 2. -/
theorem ep_Q2_054_partial_02_0132_valid :
    mulPoly ep_Q2_054_coefficient_02_0132
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0133 : Poly :=
[
  term ((12241999401480 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 133 for generator 2. -/
def ep_Q2_054_partial_02_0133 : Poly :=
[
  term ((24483998802960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-24483998802960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (11, 2), (15, 1)],
  term ((12241999401480 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((-12241999401480 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-12241999401480 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((12241999401480 : Rat) / 45033486517) [(1, 1), (2, 3), (11, 2), (15, 1)],
  term ((-24483998802960 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((24483998802960 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 2. -/
theorem ep_Q2_054_partial_02_0133_valid :
    mulPoly ep_Q2_054_coefficient_02_0133
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0134 : Poly :=
[
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 134 for generator 2. -/
def ep_Q2_054_partial_02_0134 : Poly :=
[
  term ((-16776073253880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 2), (15, 1)],
  term ((16776073253880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1)],
  term ((8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 2), (15, 1)],
  term ((8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 3), (15, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 3), (12, 1), (15, 1)],
  term ((16776073253880 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-16776073253880 : Rat) / 45033486517) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 2. -/
theorem ep_Q2_054_partial_02_0134_valid :
    mulPoly ep_Q2_054_coefficient_02_0134
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0135 : Poly :=
[
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 2. -/
def ep_Q2_054_partial_02_0135 : Poly :=
[
  term ((-9068147704800 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 3), (15, 1), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 2. -/
theorem ep_Q2_054_partial_02_0135_valid :
    mulPoly ep_Q2_054_coefficient_02_0135
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0136 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 136 for generator 2. -/
def ep_Q2_054_partial_02_0136 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 3), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 2. -/
theorem ep_Q2_054_partial_02_0136_valid :
    mulPoly ep_Q2_054_coefficient_02_0136
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0137 : Poly :=
[
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)]
]

/-- Partial product 137 for generator 2. -/
def ep_Q2_054_partial_02_0137 : Poly :=
[
  term ((40806664671600 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((-40806664671600 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (13, 1), (15, 2)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (13, 1), (15, 2)],
  term ((-20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1), (15, 2)],
  term ((-20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3), (15, 2)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 3), (13, 1), (15, 2)],
  term ((-40806664671600 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (13, 1), (15, 2)],
  term ((40806664671600 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 2. -/
theorem ep_Q2_054_partial_02_0137_valid :
    mulPoly ep_Q2_054_coefficient_02_0137
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0138 : Poly :=
[
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 138 for generator 2. -/
def ep_Q2_054_partial_02_0138 : Poly :=
[
  term ((18136295409600 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18136295409600 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3), (15, 2), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 3), (13, 1), (15, 2), (16, 1)],
  term ((-18136295409600 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((18136295409600 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 2. -/
theorem ep_Q2_054_partial_02_0138_valid :
    mulPoly ep_Q2_054_coefficient_02_0138
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0139 : Poly :=
[
  term ((1219381223346 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 139 for generator 2. -/
def ep_Q2_054_partial_02_0139 : Poly :=
[
  term ((2438762446692 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-2438762446692 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((1219381223346 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-1219381223346 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-1219381223346 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((1219381223346 : Rat) / 45033486517) [(1, 1), (2, 3), (15, 1)],
  term ((-2438762446692 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((2438762446692 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 2. -/
theorem ep_Q2_054_partial_02_0139_valid :
    mulPoly ep_Q2_054_coefficient_02_0139
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0140 : Poly :=
[
  term ((2241299769435 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 2. -/
def ep_Q2_054_partial_02_0140 : Poly :=
[
  term ((4482599538870 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4482599538870 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((2241299769435 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-2241299769435 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2241299769435 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((2241299769435 : Rat) / 45033486517) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-4482599538870 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((4482599538870 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 2. -/
theorem ep_Q2_054_partial_02_0140_valid :
    mulPoly ep_Q2_054_coefficient_02_0140
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0141 : Poly :=
[
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 1)]
]

/-- Partial product 141 for generator 2. -/
def ep_Q2_054_partial_02_0141 : Poly :=
[
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (2, 2), (3, 1)],
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 2)],
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 3)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1)],
  term ((312566452866 : Rat) / 45033486517) [(1, 2), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 2. -/
theorem ep_Q2_054_partial_02_0141_valid :
    mulPoly ep_Q2_054_coefficient_02_0141
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0142 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 142 for generator 2. -/
def ep_Q2_054_partial_02_0142 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (5, 1), (7, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (2, 2), (5, 1), (7, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 3)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 2. -/
theorem ep_Q2_054_partial_02_0142_valid :
    mulPoly ep_Q2_054_coefficient_02_0142
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0143 : Poly :=
[
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 143 for generator 2. -/
def ep_Q2_054_partial_02_0143 : Poly :=
[
  term ((-549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 2)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 2. -/
theorem ep_Q2_054_partial_02_0143_valid :
    mulPoly ep_Q2_054_coefficient_02_0143
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0144 : Poly :=
[
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1)]
]

/-- Partial product 144 for generator 2. -/
def ep_Q2_054_partial_02_0144 : Poly :=
[
  term ((1208062350000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1), (10, 1)],
  term ((-1208062350000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1), (12, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1), (10, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1), (10, 1)],
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (12, 2)],
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 2)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-1208062350000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 2. -/
theorem ep_Q2_054_partial_02_0144_valid :
    mulPoly ep_Q2_054_coefficient_02_0144
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0145 : Poly :=
[
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 145 for generator 2. -/
def ep_Q2_054_partial_02_0145 : Poly :=
[
  term ((1428765985116 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (9, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 2. -/
theorem ep_Q2_054_partial_02_0145_valid :
    mulPoly ep_Q2_054_coefficient_02_0145
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0146 : Poly :=
[
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 146 for generator 2. -/
def ep_Q2_054_partial_02_0146 : Poly :=
[
  term ((-33371207766675 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (10, 1), (15, 1)],
  term ((33371207766675 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (2, 2), (6, 1), (10, 1), (15, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (3, 2), (6, 1), (10, 1), (15, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (12, 2), (15, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 2), (15, 1)],
  term ((-33371207766675 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((33371207766675 : Rat) / 45033486517) [(1, 2), (6, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 2. -/
theorem ep_Q2_054_partial_02_0146_valid :
    mulPoly ep_Q2_054_coefficient_02_0146
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0147 : Poly :=
[
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 147 for generator 2. -/
def ep_Q2_054_partial_02_0147 : Poly :=
[
  term ((-3929106459069 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((3929106459069 : Rat) / 90066973034) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-3929106459069 : Rat) / 90066973034) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((3929106459069 : Rat) / 90066973034) [(1, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 2. -/
theorem ep_Q2_054_partial_02_0147_valid :
    mulPoly ep_Q2_054_coefficient_02_0147
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0148 : Poly :=
[
  term ((1627205705271 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 148 for generator 2. -/
def ep_Q2_054_partial_02_0148 : Poly :=
[
  term ((-1627205705271 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term ((1627205705271 : Rat) / 90066973034) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((1627205705271 : Rat) / 180133946068) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((1627205705271 : Rat) / 180133946068) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-1627205705271 : Rat) / 180133946068) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-1627205705271 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 3)],
  term ((-1627205705271 : Rat) / 90066973034) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((1627205705271 : Rat) / 90066973034) [(1, 2), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 2. -/
theorem ep_Q2_054_partial_02_0148_valid :
    mulPoly ep_Q2_054_coefficient_02_0148
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0149 : Poly :=
[
  term ((-20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 149 for generator 2. -/
def ep_Q2_054_partial_02_0149 : Poly :=
[
  term ((20110995060975 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-20110995060975 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-20110995060975 : Rat) / 90066973034) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((-20110995060975 : Rat) / 90066973034) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((20110995060975 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-20110995060975 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 2. -/
theorem ep_Q2_054_partial_02_0149_valid :
    mulPoly ep_Q2_054_coefficient_02_0149
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0150 : Poly :=
[
  term ((13084358068125 : Rat) / 180133946068) [(1, 1), (7, 1)]
]

/-- Partial product 150 for generator 2. -/
def ep_Q2_054_partial_02_0150 : Poly :=
[
  term ((-13084358068125 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term ((13084358068125 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((13084358068125 : Rat) / 180133946068) [(1, 1), (2, 2), (7, 1)],
  term ((13084358068125 : Rat) / 180133946068) [(1, 1), (3, 2), (7, 1)],
  term ((-13084358068125 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 2)],
  term ((-13084358068125 : Rat) / 180133946068) [(1, 1), (7, 1), (13, 2)],
  term ((-13084358068125 : Rat) / 90066973034) [(1, 2), (3, 1), (7, 1)],
  term ((13084358068125 : Rat) / 90066973034) [(1, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 2. -/
theorem ep_Q2_054_partial_02_0150_valid :
    mulPoly ep_Q2_054_coefficient_02_0150
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0151 : Poly :=
[
  term ((-3938724387369 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 151 for generator 2. -/
def ep_Q2_054_partial_02_0151 : Poly :=
[
  term ((7877448774738 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1)],
  term ((-7877448774738 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-3938724387369 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1)],
  term ((-3938724387369 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1)],
  term ((3938724387369 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2)],
  term ((3938724387369 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((7877448774738 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1)],
  term ((-7877448774738 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 2. -/
theorem ep_Q2_054_partial_02_0151_valid :
    mulPoly ep_Q2_054_coefficient_02_0151
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0152 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 152 for generator 2. -/
def ep_Q2_054_partial_02_0152 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 3)],
  term ((292863600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 2. -/
theorem ep_Q2_054_partial_02_0152_valid :
    mulPoly ep_Q2_054_coefficient_02_0152
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0153 : Poly :=
[
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 153 for generator 2. -/
def ep_Q2_054_partial_02_0153 : Poly :=
[
  term ((-2342908800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((2342908800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2342908800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((2342908800000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 2. -/
theorem ep_Q2_054_partial_02_0153_valid :
    mulPoly ep_Q2_054_coefficient_02_0153
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0154 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 154 for generator 2. -/
def ep_Q2_054_partial_02_0154 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (11, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (11, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 2)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (11, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 2. -/
theorem ep_Q2_054_partial_02_0154_valid :
    mulPoly ep_Q2_054_coefficient_02_0154
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0155 : Poly :=
[
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 155 for generator 2. -/
def ep_Q2_054_partial_02_0155 : Poly :=
[
  term ((-732159000000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (12, 1)],
  term ((732159000000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 2)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (12, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (12, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 2)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 3)],
  term ((-732159000000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (12, 1)],
  term ((732159000000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 2. -/
theorem ep_Q2_054_partial_02_0155_valid :
    mulPoly ep_Q2_054_coefficient_02_0155
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0156 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 156 for generator 2. -/
def ep_Q2_054_partial_02_0156 : Poly :=
[
  term ((1757181600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 3), (15, 1)],
  term ((1757181600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 2. -/
theorem ep_Q2_054_partial_02_0156_valid :
    mulPoly ep_Q2_054_coefficient_02_0156
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0157 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 157 for generator 2. -/
def ep_Q2_054_partial_02_0157 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 2. -/
theorem ep_Q2_054_partial_02_0157_valid :
    mulPoly ep_Q2_054_coefficient_02_0157
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0158 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 158 for generator 2. -/
def ep_Q2_054_partial_02_0158 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 2. -/
theorem ep_Q2_054_partial_02_0158_valid :
    mulPoly ep_Q2_054_coefficient_02_0158
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0159 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 159 for generator 2. -/
def ep_Q2_054_partial_02_0159 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 3)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 2. -/
theorem ep_Q2_054_partial_02_0159_valid :
    mulPoly ep_Q2_054_coefficient_02_0159
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0160 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 160 for generator 2. -/
def ep_Q2_054_partial_02_0160 : Poly :=
[
  term ((585727200000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (9, 1), (11, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (11, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 2)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((585727200000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 2. -/
theorem ep_Q2_054_partial_02_0160_valid :
    mulPoly ep_Q2_054_coefficient_02_0160
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0161 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 161 for generator 2. -/
def ep_Q2_054_partial_02_0161 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (9, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 3)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 2. -/
theorem ep_Q2_054_partial_02_0161_valid :
    mulPoly ep_Q2_054_coefficient_02_0161
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0162 : Poly :=
[
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 162 for generator 2. -/
def ep_Q2_054_partial_02_0162 : Poly :=
[
  term ((-3946797998145 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((3946797998145 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((-3946797998145 : Rat) / 90066973034) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((3946797998145 : Rat) / 90066973034) [(1, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 2. -/
theorem ep_Q2_054_partial_02_0162_valid :
    mulPoly ep_Q2_054_coefficient_02_0162
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0163 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 163 for generator 2. -/
def ep_Q2_054_partial_02_0163 : Poly :=
[
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 2. -/
theorem ep_Q2_054_partial_02_0163_valid :
    mulPoly ep_Q2_054_coefficient_02_0163
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0164 : Poly :=
[
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 164 for generator 2. -/
def ep_Q2_054_partial_02_0164 : Poly :=
[
  term ((3811744039050 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1)],
  term ((-3811744039050 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 2)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (12, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (12, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 2)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 3)],
  term ((3811744039050 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-3811744039050 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 2. -/
theorem ep_Q2_054_partial_02_0164_valid :
    mulPoly ep_Q2_054_coefficient_02_0164
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0165 : Poly :=
[
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 165 for generator 2. -/
def ep_Q2_054_partial_02_0165 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 3), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 2. -/
theorem ep_Q2_054_partial_02_0165_valid :
    mulPoly ep_Q2_054_coefficient_02_0165
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0166 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 166 for generator 2. -/
def ep_Q2_054_partial_02_0166 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 3), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 2. -/
theorem ep_Q2_054_partial_02_0166_valid :
    mulPoly ep_Q2_054_coefficient_02_0166
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0167 : Poly :=
[
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 2. -/
def ep_Q2_054_partial_02_0167 : Poly :=
[
  term ((780969600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 2. -/
theorem ep_Q2_054_partial_02_0167_valid :
    mulPoly ep_Q2_054_coefficient_02_0167
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0168 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 168 for generator 2. -/
def ep_Q2_054_partial_02_0168 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 2. -/
theorem ep_Q2_054_partial_02_0168_valid :
    mulPoly ep_Q2_054_coefficient_02_0168
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0169 : Poly :=
[
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 169 for generator 2. -/
def ep_Q2_054_partial_02_0169 : Poly :=
[
  term ((-3030305134554 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((3030305134554 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (11, 1), (13, 1)],
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (13, 1)],
  term ((-1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 3)],
  term ((-3030305134554 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((3030305134554 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 2. -/
theorem ep_Q2_054_partial_02_0169_valid :
    mulPoly ep_Q2_054_coefficient_02_0169
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0170 : Poly :=
[
  term ((-4541644419525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 170 for generator 2. -/
def ep_Q2_054_partial_02_0170 : Poly :=
[
  term ((4541644419525 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4541644419525 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4541644419525 : Rat) / 90066973034) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((-4541644419525 : Rat) / 90066973034) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((4541644419525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((4541644419525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((4541644419525 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4541644419525 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 2. -/
theorem ep_Q2_054_partial_02_0170_valid :
    mulPoly ep_Q2_054_coefficient_02_0170
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0171 : Poly :=
[
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 2. -/
def ep_Q2_054_partial_02_0171 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 2. -/
theorem ep_Q2_054_partial_02_0171_valid :
    mulPoly ep_Q2_054_coefficient_02_0171
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0172 : Poly :=
[
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)]
]

/-- Partial product 172 for generator 2. -/
def ep_Q2_054_partial_02_0172 : Poly :=
[
  term ((-1317886200000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 2)],
  term ((1317886200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 2), (12, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (11, 2)],
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 2)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 2)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 2)],
  term ((-1317886200000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 2)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 2. -/
theorem ep_Q2_054_partial_02_0172_valid :
    mulPoly ep_Q2_054_coefficient_02_0172
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0173 : Poly :=
[
  term ((-1666227914739 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 173 for generator 2. -/
def ep_Q2_054_partial_02_0173 : Poly :=
[
  term ((1666227914739 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term ((-1666227914739 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-1666227914739 : Rat) / 180133946068) [(1, 1), (2, 2), (7, 1), (12, 1)],
  term ((-1666227914739 : Rat) / 180133946068) [(1, 1), (3, 2), (7, 1), (12, 1)],
  term ((1666227914739 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((1666227914739 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 3)],
  term ((1666227914739 : Rat) / 90066973034) [(1, 2), (3, 1), (7, 1), (12, 1)],
  term ((-1666227914739 : Rat) / 90066973034) [(1, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 2. -/
theorem ep_Q2_054_partial_02_0173_valid :
    mulPoly ep_Q2_054_coefficient_02_0173
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0174 : Poly :=
[
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 174 for generator 2. -/
def ep_Q2_054_partial_02_0174 : Poly :=
[
  term ((488106000000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 3), (16, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 2. -/
theorem ep_Q2_054_partial_02_0174_valid :
    mulPoly ep_Q2_054_coefficient_02_0174
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0175 : Poly :=
[
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 175 for generator 2. -/
def ep_Q2_054_partial_02_0175 : Poly :=
[
  term ((-2831484104496 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((2831484104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((-1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 3), (15, 1)],
  term ((-2831484104496 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((2831484104496 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 2. -/
theorem ep_Q2_054_partial_02_0175_valid :
    mulPoly ep_Q2_054_coefficient_02_0175
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0176 : Poly :=
[
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 2. -/
def ep_Q2_054_partial_02_0176 : Poly :=
[
  term ((-976212000000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((976212000000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-976212000000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((976212000000 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 2. -/
theorem ep_Q2_054_partial_02_0176_valid :
    mulPoly ep_Q2_054_coefficient_02_0176
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0177 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 177 for generator 2. -/
def ep_Q2_054_partial_02_0177 : Poly :=
[
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 2. -/
theorem ep_Q2_054_partial_02_0177_valid :
    mulPoly ep_Q2_054_coefficient_02_0177
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0178 : Poly :=
[
  term ((-1110721221504 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 178 for generator 2. -/
def ep_Q2_054_partial_02_0178 : Poly :=
[
  term ((2221442443008 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (9, 1)],
  term ((-2221442443008 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-1110721221504 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (9, 1)],
  term ((-1110721221504 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (9, 1)],
  term ((1110721221504 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((1110721221504 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((2221442443008 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (9, 1)],
  term ((-2221442443008 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 2. -/
theorem ep_Q2_054_partial_02_0178_valid :
    mulPoly ep_Q2_054_coefficient_02_0178
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0179 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 179 for generator 2. -/
def ep_Q2_054_partial_02_0179 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (10, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (10, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 2. -/
theorem ep_Q2_054_partial_02_0179_valid :
    mulPoly ep_Q2_054_coefficient_02_0179
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0180 : Poly :=
[
  term ((2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 180 for generator 2. -/
def ep_Q2_054_partial_02_0180 : Poly :=
[
  term ((-4780043996850 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1)],
  term ((4780043996850 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1)],
  term ((2390021998425 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (11, 1)],
  term ((2390021998425 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1)],
  term ((-2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-4780043996850 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((4780043996850 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 2. -/
theorem ep_Q2_054_partial_02_0180_valid :
    mulPoly ep_Q2_054_coefficient_02_0180
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0181 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 181 for generator 2. -/
def ep_Q2_054_partial_02_0181 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 2. -/
theorem ep_Q2_054_partial_02_0181_valid :
    mulPoly ep_Q2_054_coefficient_02_0181
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0182 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 182 for generator 2. -/
def ep_Q2_054_partial_02_0182 : Poly :=
[
  term ((21763554491520 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (11, 1), (15, 2)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1), (15, 2)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 2. -/
theorem ep_Q2_054_partial_02_0182_valid :
    mulPoly ep_Q2_054_coefficient_02_0182
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0183 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 183 for generator 2. -/
def ep_Q2_054_partial_02_0183 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (11, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 2. -/
theorem ep_Q2_054_partial_02_0183_valid :
    mulPoly ep_Q2_054_coefficient_02_0183
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0184 : Poly :=
[
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 184 for generator 2. -/
def ep_Q2_054_partial_02_0184 : Poly :=
[
  term ((4578585912864 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4578585912864 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 3), (15, 1)],
  term ((4578585912864 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4578585912864 : Rat) / 45033486517) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 2. -/
theorem ep_Q2_054_partial_02_0184_valid :
    mulPoly ep_Q2_054_coefficient_02_0184
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0185 : Poly :=
[
  term ((5703429753468 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 185 for generator 2. -/
def ep_Q2_054_partial_02_0185 : Poly :=
[
  term ((-11406859506936 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1)],
  term ((11406859506936 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1)],
  term ((5703429753468 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (13, 1)],
  term ((5703429753468 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((-5703429753468 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((-5703429753468 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 3)],
  term ((-11406859506936 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (13, 1)],
  term ((11406859506936 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 2. -/
theorem ep_Q2_054_partial_02_0185_valid :
    mulPoly ep_Q2_054_coefficient_02_0185
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0186 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 186 for generator 2. -/
def ep_Q2_054_partial_02_0186 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 3), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 2. -/
theorem ep_Q2_054_partial_02_0186_valid :
    mulPoly ep_Q2_054_coefficient_02_0186
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0187 : Poly :=
[
  term ((4256884154352 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 187 for generator 2. -/
def ep_Q2_054_partial_02_0187 : Poly :=
[
  term ((-8513768308704 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1)],
  term ((8513768308704 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((4256884154352 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((4256884154352 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((-4256884154352 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-4256884154352 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-8513768308704 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((8513768308704 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 2. -/
theorem ep_Q2_054_partial_02_0187_valid :
    mulPoly ep_Q2_054_coefficient_02_0187
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0188 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 2. -/
def ep_Q2_054_partial_02_0188 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 2. -/
theorem ep_Q2_054_partial_02_0188_valid :
    mulPoly ep_Q2_054_coefficient_02_0188
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0189 : Poly :=
[
  term ((549659032794 : Rat) / 45033486517) [(1, 1), (9, 1)]
]

/-- Partial product 189 for generator 2. -/
def ep_Q2_054_partial_02_0189 : Poly :=
[
  term ((-1099318065588 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((1099318065588 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((549659032794 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1)],
  term ((549659032794 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1)],
  term ((-549659032794 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 2)],
  term ((-549659032794 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 2)],
  term ((-1099318065588 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1)],
  term ((1099318065588 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 2. -/
theorem ep_Q2_054_partial_02_0189_valid :
    mulPoly ep_Q2_054_coefficient_02_0189
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0190 : Poly :=
[
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 190 for generator 2. -/
def ep_Q2_054_partial_02_0190 : Poly :=
[
  term ((1430769186504 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-1430769186504 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((1430769186504 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-1430769186504 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 2. -/
theorem ep_Q2_054_partial_02_0190_valid :
    mulPoly ep_Q2_054_coefficient_02_0190
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0191 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 191 for generator 2. -/
def ep_Q2_054_partial_02_0191 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 2. -/
theorem ep_Q2_054_partial_02_0191_valid :
    mulPoly ep_Q2_054_coefficient_02_0191
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0192 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 192 for generator 2. -/
def ep_Q2_054_partial_02_0192 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 2. -/
theorem ep_Q2_054_partial_02_0192_valid :
    mulPoly ep_Q2_054_coefficient_02_0192
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0193 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 193 for generator 2. -/
def ep_Q2_054_partial_02_0193 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 2. -/
theorem ep_Q2_054_partial_02_0193_valid :
    mulPoly ep_Q2_054_coefficient_02_0193
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0194 : Poly :=
[
  term ((1036438622658 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 194 for generator 2. -/
def ep_Q2_054_partial_02_0194 : Poly :=
[
  term ((-2072877245316 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1)],
  term ((2072877245316 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((1036438622658 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((1036438622658 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((-1036438622658 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-1036438622658 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 3)],
  term ((-2072877245316 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (12, 1)],
  term ((2072877245316 : Rat) / 45033486517) [(1, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 2. -/
theorem ep_Q2_054_partial_02_0194_valid :
    mulPoly ep_Q2_054_coefficient_02_0194
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0195 : Poly :=
[
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 195 for generator 2. -/
def ep_Q2_054_partial_02_0195 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 3), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 2. -/
theorem ep_Q2_054_partial_02_0195_valid :
    mulPoly ep_Q2_054_coefficient_02_0195
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0196 : Poly :=
[
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 196 for generator 2. -/
def ep_Q2_054_partial_02_0196 : Poly :=
[
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (11, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (11, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 2. -/
theorem ep_Q2_054_partial_02_0196_valid :
    mulPoly ep_Q2_054_coefficient_02_0196
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0197 : Poly :=
[
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 197 for generator 2. -/
def ep_Q2_054_partial_02_0197 : Poly :=
[
  term ((-28469750498274 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((28469750498274 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1)],
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 3), (15, 1)],
  term ((-28469750498274 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((28469750498274 : Rat) / 45033486517) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 2. -/
theorem ep_Q2_054_partial_02_0197_valid :
    mulPoly ep_Q2_054_coefficient_02_0197
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0198 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 2. -/
def ep_Q2_054_partial_02_0198 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 2. -/
theorem ep_Q2_054_partial_02_0198_valid :
    mulPoly ep_Q2_054_coefficient_02_0198
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 2. -/
def ep_Q2_054_coefficient_02_0199 : Poly :=
[
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 199 for generator 2. -/
def ep_Q2_054_partial_02_0199 : Poly :=
[
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (13, 1), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 3), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 2. -/
theorem ep_Q2_054_partial_02_0199_valid :
    mulPoly ep_Q2_054_coefficient_02_0199
        ep_Q2_054_generator_02_0100_0199 =
      ep_Q2_054_partial_02_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_02_0100_0199 : List Poly :=
[
  ep_Q2_054_partial_02_0100,
  ep_Q2_054_partial_02_0101,
  ep_Q2_054_partial_02_0102,
  ep_Q2_054_partial_02_0103,
  ep_Q2_054_partial_02_0104,
  ep_Q2_054_partial_02_0105,
  ep_Q2_054_partial_02_0106,
  ep_Q2_054_partial_02_0107,
  ep_Q2_054_partial_02_0108,
  ep_Q2_054_partial_02_0109,
  ep_Q2_054_partial_02_0110,
  ep_Q2_054_partial_02_0111,
  ep_Q2_054_partial_02_0112,
  ep_Q2_054_partial_02_0113,
  ep_Q2_054_partial_02_0114,
  ep_Q2_054_partial_02_0115,
  ep_Q2_054_partial_02_0116,
  ep_Q2_054_partial_02_0117,
  ep_Q2_054_partial_02_0118,
  ep_Q2_054_partial_02_0119,
  ep_Q2_054_partial_02_0120,
  ep_Q2_054_partial_02_0121,
  ep_Q2_054_partial_02_0122,
  ep_Q2_054_partial_02_0123,
  ep_Q2_054_partial_02_0124,
  ep_Q2_054_partial_02_0125,
  ep_Q2_054_partial_02_0126,
  ep_Q2_054_partial_02_0127,
  ep_Q2_054_partial_02_0128,
  ep_Q2_054_partial_02_0129,
  ep_Q2_054_partial_02_0130,
  ep_Q2_054_partial_02_0131,
  ep_Q2_054_partial_02_0132,
  ep_Q2_054_partial_02_0133,
  ep_Q2_054_partial_02_0134,
  ep_Q2_054_partial_02_0135,
  ep_Q2_054_partial_02_0136,
  ep_Q2_054_partial_02_0137,
  ep_Q2_054_partial_02_0138,
  ep_Q2_054_partial_02_0139,
  ep_Q2_054_partial_02_0140,
  ep_Q2_054_partial_02_0141,
  ep_Q2_054_partial_02_0142,
  ep_Q2_054_partial_02_0143,
  ep_Q2_054_partial_02_0144,
  ep_Q2_054_partial_02_0145,
  ep_Q2_054_partial_02_0146,
  ep_Q2_054_partial_02_0147,
  ep_Q2_054_partial_02_0148,
  ep_Q2_054_partial_02_0149,
  ep_Q2_054_partial_02_0150,
  ep_Q2_054_partial_02_0151,
  ep_Q2_054_partial_02_0152,
  ep_Q2_054_partial_02_0153,
  ep_Q2_054_partial_02_0154,
  ep_Q2_054_partial_02_0155,
  ep_Q2_054_partial_02_0156,
  ep_Q2_054_partial_02_0157,
  ep_Q2_054_partial_02_0158,
  ep_Q2_054_partial_02_0159,
  ep_Q2_054_partial_02_0160,
  ep_Q2_054_partial_02_0161,
  ep_Q2_054_partial_02_0162,
  ep_Q2_054_partial_02_0163,
  ep_Q2_054_partial_02_0164,
  ep_Q2_054_partial_02_0165,
  ep_Q2_054_partial_02_0166,
  ep_Q2_054_partial_02_0167,
  ep_Q2_054_partial_02_0168,
  ep_Q2_054_partial_02_0169,
  ep_Q2_054_partial_02_0170,
  ep_Q2_054_partial_02_0171,
  ep_Q2_054_partial_02_0172,
  ep_Q2_054_partial_02_0173,
  ep_Q2_054_partial_02_0174,
  ep_Q2_054_partial_02_0175,
  ep_Q2_054_partial_02_0176,
  ep_Q2_054_partial_02_0177,
  ep_Q2_054_partial_02_0178,
  ep_Q2_054_partial_02_0179,
  ep_Q2_054_partial_02_0180,
  ep_Q2_054_partial_02_0181,
  ep_Q2_054_partial_02_0182,
  ep_Q2_054_partial_02_0183,
  ep_Q2_054_partial_02_0184,
  ep_Q2_054_partial_02_0185,
  ep_Q2_054_partial_02_0186,
  ep_Q2_054_partial_02_0187,
  ep_Q2_054_partial_02_0188,
  ep_Q2_054_partial_02_0189,
  ep_Q2_054_partial_02_0190,
  ep_Q2_054_partial_02_0191,
  ep_Q2_054_partial_02_0192,
  ep_Q2_054_partial_02_0193,
  ep_Q2_054_partial_02_0194,
  ep_Q2_054_partial_02_0195,
  ep_Q2_054_partial_02_0196,
  ep_Q2_054_partial_02_0197,
  ep_Q2_054_partial_02_0198,
  ep_Q2_054_partial_02_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_02_0100_0199 : Poly :=
[
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (5, 1), (7, 1), (13, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((1208062350000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1), (10, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (9, 1)],
  term ((-33371207766675 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (10, 1), (15, 1)],
  term ((-3929106459069 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-1627205705271 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term ((20110995060975 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-13084358068125 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term ((7877448774738 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2342908800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (11, 2)],
  term ((-732159000000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (12, 1)],
  term ((1757181600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((585727200000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((-3946797998145 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((3811744039050 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61013250000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((780969600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (16, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((3184891650000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3030305134554 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((4541644419525 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1317886200000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-1482621975000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 2), (12, 1)],
  term ((1666227914739 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term ((-2471036625000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1098238500000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((122026500000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((1015870612500 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 2)],
  term ((549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 2), (16, 1)],
  term ((-2831484104496 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-976212000000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((2221442443008 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (9, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((-4780043996850 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((43527108983040 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((-32645331737280 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11744079955776 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 2), (15, 1)],
  term ((-11406859506936 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((-8513768308704 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1099318065588 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((1430769186504 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2072877245316 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-14509036327680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24842491416354 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2)],
  term ((4534073852400 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-52595256687840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((24483998802960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((40806664671600 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((18136295409600 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2438762446692 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((4482599538870 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16776073253880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((988414650000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((274559625000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (11, 1), (13, 1)],
  term ((-3184891650000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1482621975000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (11, 2)],
  term ((-1015870612500 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (12, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((2471036625000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((366079500000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-43527108983040 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (11, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (11, 2), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (12, 1), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (8, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (11, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (12, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (13, 1), (15, 2)],
  term ((14509036327680 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((52595256687840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((-24483998802960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (11, 2), (15, 1)],
  term ((16776073253880 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-40806664671600 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-18136295409600 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2438762446692 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-4482599538870 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1208062350000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1), (12, 1)],
  term ((549119250000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((33371207766675 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((3929106459069 : Rat) / 90066973034) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((1627205705271 : Rat) / 90066973034) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-20110995060975 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((2342908800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((-7877448774738 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((732159000000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 2)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3946797998145 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-3811744039050 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 2)],
  term ((390484800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((3030305134554 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4541644419525 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((195242400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1317886200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 2), (12, 1)],
  term ((13084358068125 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((2831484104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((976212000000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1666227914739 : Rat) / 90066973034) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-488106000000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-2221442443008 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((4780043996850 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((11406859506936 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((8513768308704 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4578585912864 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1430769186504 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1099318065588 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((2072877245316 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((28469750498274 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (11, 1), (13, 1)],
  term ((1592445825000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-741310987500 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (11, 2)],
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (12, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (11, 2), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (8, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (13, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-26297628343920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((12241999401480 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (13, 1), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((1219381223346 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((2241299769435 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 3), (16, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 3), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1592445825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1592445825000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((137279812500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 3)],
  term ((741310987500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (12, 2)],
  term ((741310987500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 2)],
  term ((-507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((183039750000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 2), (16, 1)],
  term ((-507935306250 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 3)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 3), (16, 1)],
  term ((183039750000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 2), (16, 1)],
  term ((1235518312500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 3), (15, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 2), (15, 1)],
  term ((-6801110778600 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (12, 3), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 2), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (13, 3), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 3), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 3), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 3), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((26297628343920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((26297628343920 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 3), (15, 1)],
  term ((-12241999401480 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-12241999401480 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 2), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((-20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1), (15, 2)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1219381223346 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-2241299769435 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((8388036626940 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 3), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1219381223346 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-2241299769435 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3)],
  term ((-20403332335800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3), (15, 2)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 3), (15, 2), (16, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (2, 2), (3, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (2, 2), (5, 1), (7, 1), (13, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1), (10, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (2, 2), (6, 1), (10, 1), (15, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((1627205705271 : Rat) / 180133946068) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-20110995060975 : Rat) / 90066973034) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((13084358068125 : Rat) / 180133946068) [(1, 1), (2, 2), (7, 1)],
  term ((-3938724387369 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (11, 2)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (12, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (8, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (9, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (9, 1), (13, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (12, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (11, 1), (13, 1)],
  term ((-4541644419525 : Rat) / 90066973034) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (11, 2)],
  term ((-1666227914739 : Rat) / 180133946068) [(1, 1), (2, 2), (7, 1), (12, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-1110721221504 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (10, 1), (15, 1)],
  term ((2390021998425 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (11, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (11, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (11, 2), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1)],
  term ((5703429753468 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (13, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (13, 1), (15, 2)],
  term ((4256884154352 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((549659032794 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((1036438622658 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (11, 1), (15, 2)],
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (13, 1), (15, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (10, 1), (16, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (11, 1), (13, 1)],
  term ((1592445825000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (11, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-741310987500 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (11, 2)],
  term ((507935306250 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (12, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (12, 1), (16, 1)],
  term ((-1235518312500 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (13, 1), (15, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(1, 1), (2, 3), (7, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (11, 2), (15, 1)],
  term ((6801110778600 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (12, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (13, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (8, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 3), (9, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (2, 3), (9, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (13, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (2, 3), (10, 1), (15, 1), (16, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (2, 3), (11, 1), (13, 1), (15, 1)],
  term ((-26297628343920 : Rat) / 45033486517) [(1, 1), (2, 3), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 3), (11, 1), (15, 2), (16, 1)],
  term ((12241999401480 : Rat) / 45033486517) [(1, 1), (2, 3), (11, 2), (15, 1)],
  term ((-8388036626940 : Rat) / 45033486517) [(1, 1), (2, 3), (12, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 3), (13, 1)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 1), (2, 3), (13, 1), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 3), (13, 1), (15, 2), (16, 1)],
  term ((1219381223346 : Rat) / 45033486517) [(1, 1), (2, 3), (15, 1)],
  term ((2241299769435 : Rat) / 45033486517) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 2)],
  term ((156283226433 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1), (10, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((33371207766675 : Rat) / 90066973034) [(1, 1), (3, 2), (6, 1), (10, 1), (15, 1)],
  term ((3929106459069 : Rat) / 180133946068) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((1627205705271 : Rat) / 180133946068) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-20110995060975 : Rat) / 90066973034) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((13084358068125 : Rat) / 180133946068) [(1, 1), (3, 2), (7, 1)],
  term ((-3938724387369 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 2)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (12, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1)],
  term ((3946797998145 : Rat) / 180133946068) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1905872019525 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (12, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((1515152567277 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (13, 1)],
  term ((-4541644419525 : Rat) / 90066973034) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((97621200000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 2)],
  term ((-1666227914739 : Rat) / 180133946068) [(1, 1), (3, 2), (7, 1), (12, 1)],
  term ((-244053000000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((1415742052248 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-1110721221504 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (10, 1), (15, 1)],
  term ((2390021998425 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 2), (15, 1)],
  term ((-2289292956432 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((5703429753468 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (13, 1), (15, 2)],
  term ((4256884154352 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((549659032794 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1)],
  term ((-715384593252 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((1036438622658 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((-2040333233580 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (11, 1), (15, 2)],
  term ((14234875249137 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (13, 1), (15, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 1), (3, 3)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 1), (13, 3)],
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (12, 2)],
  term ((604031175000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 2)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 2)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (12, 2), (15, 1)],
  term ((-33371207766675 : Rat) / 90066973034) [(1, 1), (6, 1), (10, 1), (13, 2), (15, 1)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-3929106459069 : Rat) / 180133946068) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-1627205705271 : Rat) / 180133946068) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((20110995060975 : Rat) / 90066973034) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-1627205705271 : Rat) / 180133946068) [(1, 1), (6, 1), (13, 3)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 3)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (12, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 2)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 2)],
  term ((3938724387369 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (12, 3)],
  term ((3938724387369 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 3), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 3)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 2)],
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 3)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 2)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((1905872019525 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 3)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (12, 3), (16, 1)],
  term ((-3946797998145 : Rat) / 180133946068) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 3), (15, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((4541644419525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4541644419525 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-97621200000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1515152567277 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 3)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 2)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 2)],
  term ((1666227914739 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-13084358068125 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 2)],
  term ((-1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((1666227914739 : Rat) / 180133946068) [(1, 1), (7, 1), (12, 3)],
  term ((244053000000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 3), (16, 1)],
  term ((-13084358068125 : Rat) / 180133946068) [(1, 1), (7, 1), (13, 2)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1415742052248 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 3), (15, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1110721221504 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((1110721221504 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-2390021998425 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5703429753468 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-4256884154352 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((2289292956432 : Rat) / 45033486517) [(1, 1), (8, 1), (12, 3), (15, 1)],
  term ((-4256884154352 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5703429753468 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 3)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 3), (15, 2)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((715384593252 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1036438622658 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-549659032794 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 2)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1036438622658 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 3)],
  term ((-549659032794 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 2)],
  term ((2040333233580 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 3), (15, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((-14234875249137 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 3), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 3), (15, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((274559625000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-3184891650000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1482621975000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (11, 2)],
  term ((-1015870612500 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((2471036625000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-43527108983040 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((32645331737280 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (13, 1), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (8, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((14509036327680 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((52595256687840 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-24483998802960 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((16776073253880 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-40806664671600 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-18136295409600 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2438762446692 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-4482599538870 : Rat) / 45033486517) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3184891650000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-274559625000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (13, 2)],
  term ((-1482621975000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 2), (13, 1)],
  term ((1015870612500 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2471036625000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 2), (15, 1)],
  term ((-1098238500000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((43527108983040 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-32645331737280 : Rat) / 45033486517) [(1, 2), (2, 1), (8, 1), (13, 2), (15, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (13, 2), (15, 2)],
  term ((-14509036327680 : Rat) / 45033486517) [(1, 2), (2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-52595256687840 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (13, 2), (15, 1)],
  term ((24483998802960 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-16776073253880 : Rat) / 45033486517) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2438762446692 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((4482599538870 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 2)],
  term ((40806664671600 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 2), (15, 2)],
  term ((18136295409600 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 2), (15, 2), (16, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-549119250000 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((1208062350000 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-33371207766675 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-3929106459069 : Rat) / 90066973034) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-1627205705271 : Rat) / 90066973034) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((20110995060975 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-13084358068125 : Rat) / 90066973034) [(1, 2), (3, 1), (7, 1)],
  term ((7877448774738 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2342908800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (11, 2)],
  term ((-732159000000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (12, 1)],
  term ((1757181600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-3946797998145 : Rat) / 90066973034) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((3811744039050 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((780969600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-3030305134554 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((4541644419525 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1317886200000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 2)],
  term ((1666227914739 : Rat) / 90066973034) [(1, 2), (3, 1), (7, 1), (12, 1)],
  term ((488106000000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2831484104496 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-976212000000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((2221442443008 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (9, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-4780043996850 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((4578585912864 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11406859506936 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (13, 1)],
  term ((-16322665868640 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-8513768308704 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1099318065588 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1)],
  term ((1430769186504 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2072877245316 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (12, 1)],
  term ((4080666467160 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-28469750498274 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1)],
  term ((312566452866 : Rat) / 45033486517) [(1, 2), (3, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (5, 1), (7, 1), (13, 2)],
  term ((-1208062350000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((549119250000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((33371207766675 : Rat) / 45033486517) [(1, 2), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((3929106459069 : Rat) / 90066973034) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-20110995060975 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((1627205705271 : Rat) / 90066973034) [(1, 2), (6, 1), (13, 2)],
  term ((2342908800000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((732159000000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-7877448774738 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1757181600000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (10, 1), (13, 2)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3811744039050 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3946797998145 : Rat) / 90066973034) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((878590800000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-780969600000 : Rat) / 45033486517) [(1, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4541644419525 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3030305134554 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 2)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 2), (13, 1)],
  term ((-1666227914739 : Rat) / 90066973034) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-488106000000 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((13084358068125 : Rat) / 90066973034) [(1, 2), (7, 1), (13, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((2831484104496 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((976212000000 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2221442443008 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((4780043996850 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4578585912864 : Rat) / 45033486517) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((8513768308704 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((11406859506936 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 2)],
  term ((16322665868640 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 2), (15, 2)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1430769186504 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2072877245316 : Rat) / 45033486517) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((1099318065588 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 1)],
  term ((-4080666467160 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 2), (15, 1)],
  term ((8161332934320 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((28469750498274 : Rat) / 45033486517) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8161332934320 : Rat) / 45033486517) [(1, 2), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 100 through 199. -/
theorem ep_Q2_054_block_02_0100_0199_valid :
    checkProductSumEq ep_Q2_054_partials_02_0100_0199
      ep_Q2_054_block_02_0100_0199 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
