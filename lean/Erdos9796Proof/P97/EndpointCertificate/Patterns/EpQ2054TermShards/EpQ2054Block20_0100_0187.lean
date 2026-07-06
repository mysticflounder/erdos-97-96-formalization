/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 20:100-187

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 20 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_20_0100_0187 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0100 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 20. -/
def ep_Q2_054_partial_20_0100 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 20. -/
theorem ep_Q2_054_partial_20_0100_valid :
    mulPoly ep_Q2_054_coefficient_20_0100
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0101 : Poly :=
[
  term ((-4650703951725 : Rat) / 45033486517) [(3, 1), (13, 1)]
]

/-- Partial product 101 for generator 20. -/
def ep_Q2_054_partial_20_0101 : Poly :=
[
  term ((9301407903450 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (13, 1)],
  term ((-4650703951725 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1)],
  term ((9301407903450 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-4650703951725 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1)],
  term ((-9301407903450 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-9301407903450 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((4650703951725 : Rat) / 45033486517) [(3, 1), (10, 2), (13, 1)],
  term ((4650703951725 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 20. -/
theorem ep_Q2_054_partial_20_0101_valid :
    mulPoly ep_Q2_054_coefficient_20_0101
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0102 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 20. -/
def ep_Q2_054_partial_20_0102 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 20. -/
theorem ep_Q2_054_partial_20_0102_valid :
    mulPoly ep_Q2_054_coefficient_20_0102
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0103 : Poly :=
[
  term ((-13602221557200 : Rat) / 45033486517) [(3, 1), (15, 1)]
]

/-- Partial product 103 for generator 20. -/
def ep_Q2_054_partial_20_0103 : Poly :=
[
  term ((27204443114400 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(0, 2), (3, 1), (15, 1)],
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1)],
  term ((-27204443114400 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-27204443114400 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(3, 1), (10, 2), (15, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 20. -/
theorem ep_Q2_054_partial_20_0103_valid :
    mulPoly ep_Q2_054_coefficient_20_0103
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0104 : Poly :=
[
  term ((-916489537905 : Rat) / 45033486517) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 20. -/
def ep_Q2_054_partial_20_0104 : Poly :=
[
  term ((1832979075810 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-916489537905 : Rat) / 45033486517) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1832979075810 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-916489537905 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1832979075810 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1832979075810 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((916489537905 : Rat) / 45033486517) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((916489537905 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 20. -/
theorem ep_Q2_054_partial_20_0104_valid :
    mulPoly ep_Q2_054_coefficient_20_0104
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0105 : Poly :=
[
  term ((-895441199601 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 105 for generator 20. -/
def ep_Q2_054_partial_20_0105 : Poly :=
[
  term ((1790882399202 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1)],
  term ((-895441199601 : Rat) / 45033486517) [(0, 2), (6, 1)],
  term ((1790882399202 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)],
  term ((-895441199601 : Rat) / 45033486517) [(1, 2), (6, 1)],
  term ((-1790882399202 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1)],
  term ((-1790882399202 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1)],
  term ((895441199601 : Rat) / 45033486517) [(6, 1), (10, 2)],
  term ((895441199601 : Rat) / 45033486517) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 20. -/
theorem ep_Q2_054_partial_20_0105_valid :
    mulPoly ep_Q2_054_coefficient_20_0105
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0106 : Poly :=
[
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 106 for generator 20. -/
def ep_Q2_054_partial_20_0106 : Poly :=
[
  term ((-3431995312500 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 2), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 20. -/
theorem ep_Q2_054_partial_20_0106_valid :
    mulPoly ep_Q2_054_coefficient_20_0106
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0107 : Poly :=
[
  term ((-232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 107 for generator 20. -/
def ep_Q2_054_partial_20_0107 : Poly :=
[
  term ((464275379772 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-232137689886 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((464275379772 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 2)],
  term ((-232137689886 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-464275379772 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-464275379772 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 20. -/
theorem ep_Q2_054_partial_20_0107_valid :
    mulPoly ep_Q2_054_coefficient_20_0107
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0108 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 108 for generator 20. -/
def ep_Q2_054_partial_20_0108 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 20. -/
theorem ep_Q2_054_partial_20_0108_valid :
    mulPoly ep_Q2_054_coefficient_20_0108
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0109 : Poly :=
[
  term ((-2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 109 for generator 20. -/
def ep_Q2_054_partial_20_0109 : Poly :=
[
  term ((5893439645016 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 20. -/
theorem ep_Q2_054_partial_20_0109_valid :
    mulPoly ep_Q2_054_coefficient_20_0109
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0110 : Poly :=
[
  term ((15367347719937 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 110 for generator 20. -/
def ep_Q2_054_partial_20_0110 : Poly :=
[
  term ((-30734695439874 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((15367347719937 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-30734695439874 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((15367347719937 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((30734695439874 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((30734695439874 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-15367347719937 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((-15367347719937 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 20. -/
theorem ep_Q2_054_partial_20_0110_valid :
    mulPoly ep_Q2_054_coefficient_20_0110
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0111 : Poly :=
[
  term ((-7031424064050 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 111 for generator 20. -/
def ep_Q2_054_partial_20_0111 : Poly :=
[
  term ((14062848128100 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-7031424064050 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((14062848128100 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-7031424064050 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((-14062848128100 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-14062848128100 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((7031424064050 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((7031424064050 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 20. -/
theorem ep_Q2_054_partial_20_0111_valid :
    mulPoly ep_Q2_054_coefficient_20_0111
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0112 : Poly :=
[
  term ((-19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2)]
]

/-- Partial product 112 for generator 20. -/
def ep_Q2_054_partial_20_0112 : Poly :=
[
  term ((38827572436728 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 2)],
  term ((38827572436728 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 2)],
  term ((-38827572436728 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (10, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (11, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2), (10, 2)],
  term ((19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 20. -/
theorem ep_Q2_054_partial_20_0112_valid :
    mulPoly ep_Q2_054_coefficient_20_0112
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0113 : Poly :=
[
  term ((3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1)]
]

/-- Partial product 113 for generator 20. -/
def ep_Q2_054_partial_20_0113 : Poly :=
[
  term ((-7247704606902 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2)],
  term ((3623852303451 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((-7247704606902 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2)],
  term ((-3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2)],
  term ((7247704606902 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 20. -/
theorem ep_Q2_054_partial_20_0113_valid :
    mulPoly ep_Q2_054_coefficient_20_0113
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0114 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 114 for generator 20. -/
def ep_Q2_054_partial_20_0114 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 20. -/
theorem ep_Q2_054_partial_20_0114_valid :
    mulPoly ep_Q2_054_coefficient_20_0114
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0115 : Poly :=
[
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 115 for generator 20. -/
def ep_Q2_054_partial_20_0115 : Poly :=
[
  term ((91905676988148 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (13, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 20. -/
theorem ep_Q2_054_partial_20_0115_valid :
    mulPoly ep_Q2_054_coefficient_20_0115
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0116 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 20. -/
def ep_Q2_054_partial_20_0116 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 20. -/
theorem ep_Q2_054_partial_20_0116_valid :
    mulPoly ep_Q2_054_coefficient_20_0116
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0117 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 117 for generator 20. -/
def ep_Q2_054_partial_20_0117 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 20. -/
theorem ep_Q2_054_partial_20_0117_valid :
    mulPoly ep_Q2_054_coefficient_20_0117
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0118 : Poly :=
[
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 118 for generator 20. -/
def ep_Q2_054_partial_20_0118 : Poly :=
[
  term ((81651926988 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((81651926988 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 20. -/
theorem ep_Q2_054_partial_20_0118_valid :
    mulPoly ep_Q2_054_coefficient_20_0118
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0119 : Poly :=
[
  term ((4184139294450 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 119 for generator 20. -/
def ep_Q2_054_partial_20_0119 : Poly :=
[
  term ((-8368278588900 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((4184139294450 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-8368278588900 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((4184139294450 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((8368278588900 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-4184139294450 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-4184139294450 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((8368278588900 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 20. -/
theorem ep_Q2_054_partial_20_0119_valid :
    mulPoly ep_Q2_054_coefficient_20_0119
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0120 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 20. -/
def ep_Q2_054_partial_20_0120 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 20. -/
theorem ep_Q2_054_partial_20_0120_valid :
    mulPoly ep_Q2_054_coefficient_20_0120
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0121 : Poly :=
[
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 2)]
]

/-- Partial product 121 for generator 20. -/
def ep_Q2_054_partial_20_0121 : Poly :=
[
  term ((-734867342892 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 2)],
  term ((367433671446 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 3)],
  term ((367433671446 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 2)],
  term ((734867342892 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (10, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 2), (10, 2)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 2)],
  term ((734867342892 : Rat) / 45033486517) [(6, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 20. -/
theorem ep_Q2_054_partial_20_0121_valid :
    mulPoly ep_Q2_054_coefficient_20_0121
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0122 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 20. -/
def ep_Q2_054_partial_20_0122 : Poly :=
[
  term ((-1269540678672 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 20. -/
theorem ep_Q2_054_partial_20_0122_valid :
    mulPoly ep_Q2_054_coefficient_20_0122
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0123 : Poly :=
[
  term ((1420928166735 : Rat) / 45033486517) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 123 for generator 20. -/
def ep_Q2_054_partial_20_0123 : Poly :=
[
  term ((-2841856333470 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 20. -/
theorem ep_Q2_054_partial_20_0123_valid :
    mulPoly ep_Q2_054_coefficient_20_0123
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0124 : Poly :=
[
  term ((23559921533025 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 124 for generator 20. -/
def ep_Q2_054_partial_20_0124 : Poly :=
[
  term ((-47119843066050 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((23559921533025 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-47119843066050 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((23559921533025 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((47119843066050 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((47119843066050 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-23559921533025 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((-23559921533025 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 20. -/
theorem ep_Q2_054_partial_20_0124_valid :
    mulPoly ep_Q2_054_coefficient_20_0124
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0125 : Poly :=
[
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 20. -/
def ep_Q2_054_partial_20_0125 : Poly :=
[
  term ((5683712666940 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 20. -/
theorem ep_Q2_054_partial_20_0125_valid :
    mulPoly ep_Q2_054_coefficient_20_0125
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0126 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 126 for generator 20. -/
def ep_Q2_054_partial_20_0126 : Poly :=
[
  term ((-1269540678672 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 20. -/
theorem ep_Q2_054_partial_20_0126_valid :
    mulPoly ep_Q2_054_coefficient_20_0126
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0127 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (16, 1)]
]

/-- Partial product 127 for generator 20. -/
def ep_Q2_054_partial_20_0127 : Poly :=
[
  term ((1894570888980 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(0, 2), (6, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(1, 2), (6, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 20. -/
theorem ep_Q2_054_partial_20_0127_valid :
    mulPoly ep_Q2_054_coefficient_20_0127
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0128 : Poly :=
[
  term ((736679955627 : Rat) / 45033486517) [(6, 2)]
]

/-- Partial product 128 for generator 20. -/
def ep_Q2_054_partial_20_0128 : Poly :=
[
  term ((-1473359911254 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((736679955627 : Rat) / 45033486517) [(0, 2), (6, 2)],
  term ((-1473359911254 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1)],
  term ((736679955627 : Rat) / 45033486517) [(1, 2), (6, 2)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 2), (8, 1), (10, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 2), (9, 1), (11, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (10, 2)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 20. -/
theorem ep_Q2_054_partial_20_0128_valid :
    mulPoly ep_Q2_054_coefficient_20_0128
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0129 : Poly :=
[
  term ((-632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 129 for generator 20. -/
def ep_Q2_054_partial_20_0129 : Poly :=
[
  term ((1265682617892 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (9, 1)],
  term ((-632841308946 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1)],
  term ((1265682617892 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 2)],
  term ((-632841308946 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-1265682617892 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-1265682617892 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 20. -/
theorem ep_Q2_054_partial_20_0129_valid :
    mulPoly ep_Q2_054_coefficient_20_0129
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0130 : Poly :=
[
  term ((-1825821506250 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 130 for generator 20. -/
def ep_Q2_054_partial_20_0130 : Poly :=
[
  term ((3651643012500 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (11, 1)],
  term ((-1825821506250 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((3651643012500 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-1825821506250 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-3651643012500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((1825821506250 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((1825821506250 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3)],
  term ((-3651643012500 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 20. -/
theorem ep_Q2_054_partial_20_0130_valid :
    mulPoly ep_Q2_054_coefficient_20_0130
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0131 : Poly :=
[
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 131 for generator 20. -/
def ep_Q2_054_partial_20_0131 : Poly :=
[
  term ((-367622707952592 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 20. -/
theorem ep_Q2_054_partial_20_0131_valid :
    mulPoly ep_Q2_054_coefficient_20_0131
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0132 : Poly :=
[
  term ((-372755504772 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 132 for generator 20. -/
def ep_Q2_054_partial_20_0132 : Poly :=
[
  term ((745511009544 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (13, 1)],
  term ((-372755504772 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((745511009544 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-372755504772 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-745511009544 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((372755504772 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((372755504772 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-745511009544 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 20. -/
theorem ep_Q2_054_partial_20_0132_valid :
    mulPoly ep_Q2_054_coefficient_20_0132
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0133 : Poly :=
[
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 133 for generator 20. -/
def ep_Q2_054_partial_20_0133 : Poly :=
[
  term ((183811353976296 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-91905676988148 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-91905676988148 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 20. -/
theorem ep_Q2_054_partial_20_0133_valid :
    mulPoly ep_Q2_054_coefficient_20_0133
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0134 : Poly :=
[
  term ((-13376845324611 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 134 for generator 20. -/
def ep_Q2_054_partial_20_0134 : Poly :=
[
  term ((26753690649222 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((-13376845324611 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((26753690649222 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-13376845324611 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-26753690649222 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((13376845324611 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((13376845324611 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-26753690649222 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 20. -/
theorem ep_Q2_054_partial_20_0134_valid :
    mulPoly ep_Q2_054_coefficient_20_0134
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0135 : Poly :=
[
  term ((-460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 20. -/
def ep_Q2_054_partial_20_0135 : Poly :=
[
  term ((921681134010 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-460840567005 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((921681134010 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-460840567005 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 20. -/
theorem ep_Q2_054_partial_20_0135_valid :
    mulPoly ep_Q2_054_coefficient_20_0135
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0136 : Poly :=
[
  term ((-5380452621459 : Rat) / 90066973034) [(7, 1), (9, 1)]
]

/-- Partial product 136 for generator 20. -/
def ep_Q2_054_partial_20_0136 : Poly :=
[
  term ((5380452621459 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((-5380452621459 : Rat) / 90066973034) [(0, 2), (7, 1), (9, 1)],
  term ((5380452621459 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2)],
  term ((-5380452621459 : Rat) / 90066973034) [(1, 2), (7, 1), (9, 1)],
  term ((-5380452621459 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((5380452621459 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 2)],
  term ((5380452621459 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)],
  term ((-5380452621459 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 20. -/
theorem ep_Q2_054_partial_20_0136_valid :
    mulPoly ep_Q2_054_coefficient_20_0136
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0137 : Poly :=
[
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 137 for generator 20. -/
def ep_Q2_054_partial_20_0137 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 3), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 20. -/
theorem ep_Q2_054_partial_20_0137_valid :
    mulPoly ep_Q2_054_coefficient_20_0137
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0138 : Poly :=
[
  term ((52435942272 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 138 for generator 20. -/
def ep_Q2_054_partial_20_0138 : Poly :=
[
  term ((-104871884544 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((52435942272 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((-104871884544 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (12, 1)],
  term ((52435942272 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((104871884544 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((104871884544 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 20. -/
theorem ep_Q2_054_partial_20_0138_valid :
    mulPoly ep_Q2_054_coefficient_20_0138
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0139 : Poly :=
[
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 139 for generator 20. -/
def ep_Q2_054_partial_20_0139 : Poly :=
[
  term ((163303853976 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 20. -/
theorem ep_Q2_054_partial_20_0139_valid :
    mulPoly ep_Q2_054_coefficient_20_0139
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0140 : Poly :=
[
  term ((15253312500 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 140 for generator 20. -/
def ep_Q2_054_partial_20_0140 : Poly :=
[
  term ((-30506625000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 20. -/
theorem ep_Q2_054_partial_20_0140_valid :
    mulPoly ep_Q2_054_coefficient_20_0140
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0141 : Poly :=
[
  term ((-11469860029599 : Rat) / 180133946068) [(7, 1), (11, 1)]
]

/-- Partial product 141 for generator 20. -/
def ep_Q2_054_partial_20_0141 : Poly :=
[
  term ((11469860029599 : Rat) / 90066973034) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((-11469860029599 : Rat) / 180133946068) [(0, 2), (7, 1), (11, 1)],
  term ((11469860029599 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-11469860029599 : Rat) / 180133946068) [(1, 2), (7, 1), (11, 1)],
  term ((-11469860029599 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-11469860029599 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)],
  term ((11469860029599 : Rat) / 180133946068) [(7, 1), (10, 2), (11, 1)],
  term ((11469860029599 : Rat) / 180133946068) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 20. -/
theorem ep_Q2_054_partial_20_0141_valid :
    mulPoly ep_Q2_054_coefficient_20_0141
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0142 : Poly :=
[
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 142 for generator 20. -/
def ep_Q2_054_partial_20_0142 : Poly :=
[
  term ((159038119382616 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 20. -/
theorem ep_Q2_054_partial_20_0142_valid :
    mulPoly ep_Q2_054_coefficient_20_0142
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0143 : Poly :=
[
  term ((208118815077 : Rat) / 45033486517) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 143 for generator 20. -/
def ep_Q2_054_partial_20_0143 : Poly :=
[
  term ((-416237630154 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((208118815077 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-416237630154 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((208118815077 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((416237630154 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((416237630154 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 20. -/
theorem ep_Q2_054_partial_20_0143_valid :
    mulPoly ep_Q2_054_coefficient_20_0143
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0144 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 144 for generator 20. -/
def ep_Q2_054_partial_20_0144 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 20. -/
theorem ep_Q2_054_partial_20_0144_valid :
    mulPoly ep_Q2_054_coefficient_20_0144
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0145 : Poly :=
[
  term ((4463612933499 : Rat) / 90066973034) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 145 for generator 20. -/
def ep_Q2_054_partial_20_0145 : Poly :=
[
  term ((-4463612933499 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((4463612933499 : Rat) / 90066973034) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-4463612933499 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((4463612933499 : Rat) / 90066973034) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((4463612933499 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((4463612933499 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4463612933499 : Rat) / 90066973034) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-4463612933499 : Rat) / 90066973034) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 20. -/
theorem ep_Q2_054_partial_20_0145_valid :
    mulPoly ep_Q2_054_coefficient_20_0145
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0146 : Poly :=
[
  term ((-28418099317317 : Rat) / 180133946068) [(7, 1), (13, 1)]
]

/-- Partial product 146 for generator 20. -/
def ep_Q2_054_partial_20_0146 : Poly :=
[
  term ((28418099317317 : Rat) / 90066973034) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((-28418099317317 : Rat) / 180133946068) [(0, 2), (7, 1), (13, 1)],
  term ((28418099317317 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-28418099317317 : Rat) / 180133946068) [(1, 2), (7, 1), (13, 1)],
  term ((-28418099317317 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-28418099317317 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((28418099317317 : Rat) / 180133946068) [(7, 1), (10, 2), (13, 1)],
  term ((28418099317317 : Rat) / 180133946068) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 20. -/
theorem ep_Q2_054_partial_20_0146_valid :
    mulPoly ep_Q2_054_coefficient_20_0146
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0147 : Poly :=
[
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 147 for generator 20. -/
def ep_Q2_054_partial_20_0147 : Poly :=
[
  term ((-79519059691308 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((39759529845654 : Rat) / 45033486517) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((39759529845654 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 20. -/
theorem ep_Q2_054_partial_20_0147_valid :
    mulPoly ep_Q2_054_coefficient_20_0147
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0148 : Poly :=
[
  term ((82421333622345 : Rat) / 180133946068) [(7, 1), (15, 1)]
]

/-- Partial product 148 for generator 20. -/
def ep_Q2_054_partial_20_0148 : Poly :=
[
  term ((-82421333622345 : Rat) / 90066973034) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((82421333622345 : Rat) / 180133946068) [(0, 2), (7, 1), (15, 1)],
  term ((-82421333622345 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((82421333622345 : Rat) / 180133946068) [(1, 2), (7, 1), (15, 1)],
  term ((82421333622345 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((82421333622345 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-82421333622345 : Rat) / 180133946068) [(7, 1), (10, 2), (15, 1)],
  term ((-82421333622345 : Rat) / 180133946068) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 20. -/
theorem ep_Q2_054_partial_20_0148_valid :
    mulPoly ep_Q2_054_coefficient_20_0148
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0149 : Poly :=
[
  term ((1123698624087 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 20. -/
def ep_Q2_054_partial_20_0149 : Poly :=
[
  term ((-2247397248174 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1123698624087 : Rat) / 45033486517) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2247397248174 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1123698624087 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((2247397248174 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2247397248174 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1123698624087 : Rat) / 45033486517) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1123698624087 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 20. -/
theorem ep_Q2_054_partial_20_0149_valid :
    mulPoly ep_Q2_054_coefficient_20_0149
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0150 : Poly :=
[
  term ((-1015954161768 : Rat) / 45033486517) [(7, 2)]
]

/-- Partial product 150 for generator 20. -/
def ep_Q2_054_partial_20_0150 : Poly :=
[
  term ((2031908323536 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1)],
  term ((-1015954161768 : Rat) / 45033486517) [(0, 2), (7, 2)],
  term ((2031908323536 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((-1015954161768 : Rat) / 45033486517) [(1, 2), (7, 2)],
  term ((-2031908323536 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1)],
  term ((-2031908323536 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1)],
  term ((1015954161768 : Rat) / 45033486517) [(7, 2), (10, 2)],
  term ((1015954161768 : Rat) / 45033486517) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 20. -/
theorem ep_Q2_054_partial_20_0150_valid :
    mulPoly ep_Q2_054_coefficient_20_0150
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0151 : Poly :=
[
  term ((589065202386 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 151 for generator 20. -/
def ep_Q2_054_partial_20_0151 : Poly :=
[
  term ((-1178130404772 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 2)],
  term ((589065202386 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1)],
  term ((-1178130404772 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1)],
  term ((589065202386 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((1178130404772 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((-589065202386 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2)],
  term ((-589065202386 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2)],
  term ((1178130404772 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 20. -/
theorem ep_Q2_054_partial_20_0151_valid :
    mulPoly ep_Q2_054_coefficient_20_0151
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0152 : Poly :=
[
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 152 for generator 20. -/
def ep_Q2_054_partial_20_0152 : Poly :=
[
  term ((13727981250000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 2), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 3), (13, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 20. -/
theorem ep_Q2_054_partial_20_0152_valid :
    mulPoly ep_Q2_054_coefficient_20_0152
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0153 : Poly :=
[
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 153 for generator 20. -/
def ep_Q2_054_partial_20_0153 : Poly :=
[
  term ((-6863990625000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 2), (13, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 20. -/
theorem ep_Q2_054_partial_20_0153_valid :
    mulPoly ep_Q2_054_coefficient_20_0153
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0154 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 154 for generator 20. -/
def ep_Q2_054_partial_20_0154 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 20. -/
theorem ep_Q2_054_partial_20_0154_valid :
    mulPoly ep_Q2_054_coefficient_20_0154
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0155 : Poly :=
[
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 155 for generator 20. -/
def ep_Q2_054_partial_20_0155 : Poly :=
[
  term ((1057909264920 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(0, 2), (7, 2), (11, 1), (13, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(1, 2), (7, 2), (11, 1), (13, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 20. -/
theorem ep_Q2_054_partial_20_0155_valid :
    mulPoly ep_Q2_054_coefficient_20_0155
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0156 : Poly :=
[
  term ((-233375681250 : Rat) / 45033486517) [(7, 2), (12, 1)]
]

/-- Partial product 156 for generator 20. -/
def ep_Q2_054_partial_20_0156 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (12, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(0, 2), (7, 2), (12, 1)],
  term ((466751362500 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (12, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 2), (10, 2), (12, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 20. -/
theorem ep_Q2_054_partial_20_0156_valid :
    mulPoly ep_Q2_054_coefficient_20_0156
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0157 : Poly :=
[
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 157 for generator 20. -/
def ep_Q2_054_partial_20_0157 : Poly :=
[
  term ((-528954632460 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((264477316230 : Rat) / 45033486517) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((264477316230 : Rat) / 45033486517) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 20. -/
theorem ep_Q2_054_partial_20_0157_valid :
    mulPoly ep_Q2_054_coefficient_20_0157
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0158 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (16, 1)]
]

/-- Partial product 158 for generator 20. -/
def ep_Q2_054_partial_20_0158 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (7, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (7, 2), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (10, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 20. -/
theorem ep_Q2_054_partial_20_0158_valid :
    mulPoly ep_Q2_054_coefficient_20_0158
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0159 : Poly :=
[
  term ((-1710586775637 : Rat) / 45033486517) [(8, 1)]
]

/-- Partial product 159 for generator 20. -/
def ep_Q2_054_partial_20_0159 : Poly :=
[
  term ((3421173551274 : Rat) / 45033486517) [(0, 1), (8, 2)],
  term ((-1710586775637 : Rat) / 45033486517) [(0, 2), (8, 1)],
  term ((3421173551274 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)],
  term ((-1710586775637 : Rat) / 45033486517) [(1, 2), (8, 1)],
  term ((-3421173551274 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)],
  term ((1710586775637 : Rat) / 45033486517) [(8, 1), (10, 2)],
  term ((1710586775637 : Rat) / 45033486517) [(8, 1), (11, 2)],
  term ((-3421173551274 : Rat) / 45033486517) [(8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 20. -/
theorem ep_Q2_054_partial_20_0159_valid :
    mulPoly ep_Q2_054_coefficient_20_0159
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0160 : Poly :=
[
  term ((734867342892 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 160 for generator 20. -/
def ep_Q2_054_partial_20_0160 : Poly :=
[
  term ((-1469734685784 : Rat) / 45033486517) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((734867342892 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((734867342892 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(8, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 20. -/
theorem ep_Q2_054_partial_20_0160_valid :
    mulPoly ep_Q2_054_coefficient_20_0160
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0161 : Poly :=
[
  term ((-912375715122 : Rat) / 45033486517) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 161 for generator 20. -/
def ep_Q2_054_partial_20_0161 : Poly :=
[
  term ((1824751430244 : Rat) / 45033486517) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-912375715122 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((1824751430244 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((-912375715122 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((912375715122 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((912375715122 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1824751430244 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-1824751430244 : Rat) / 45033486517) [(8, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 20. -/
theorem ep_Q2_054_partial_20_0161_valid :
    mulPoly ep_Q2_054_coefficient_20_0161
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0162 : Poly :=
[
  term ((47766468035034 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 162 for generator 20. -/
def ep_Q2_054_partial_20_0162 : Poly :=
[
  term ((-95532936070068 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((47766468035034 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-95532936070068 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((47766468035034 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((95532936070068 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-47766468035034 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-47766468035034 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1)],
  term ((95532936070068 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 20. -/
theorem ep_Q2_054_partial_20_0162_valid :
    mulPoly ep_Q2_054_coefficient_20_0162
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0163 : Poly :=
[
  term ((301737198393 : Rat) / 90066973034) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 163 for generator 20. -/
def ep_Q2_054_partial_20_0163 : Poly :=
[
  term ((-301737198393 : Rat) / 45033486517) [(0, 1), (8, 2), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 20. -/
theorem ep_Q2_054_partial_20_0163_valid :
    mulPoly ep_Q2_054_coefficient_20_0163
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0164 : Poly :=
[
  term ((14500406039940 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 164 for generator 20. -/
def ep_Q2_054_partial_20_0164 : Poly :=
[
  term ((-29000812079880 : Rat) / 45033486517) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((14500406039940 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-29000812079880 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((14500406039940 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((29000812079880 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14500406039940 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-14500406039940 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((29000812079880 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 20. -/
theorem ep_Q2_054_partial_20_0164_valid :
    mulPoly ep_Q2_054_coefficient_20_0164
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0165 : Poly :=
[
  term ((-301737198393 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 20. -/
def ep_Q2_054_partial_20_0165 : Poly :=
[
  term ((603474396786 : Rat) / 45033486517) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((603474396786 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 20. -/
theorem ep_Q2_054_partial_20_0165_valid :
    mulPoly ep_Q2_054_coefficient_20_0165
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0166 : Poly :=
[
  term ((-3593150724636 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 166 for generator 20. -/
def ep_Q2_054_partial_20_0166 : Poly :=
[
  term ((7186301449272 : Rat) / 45033486517) [(0, 1), (8, 2), (15, 2)],
  term ((-3593150724636 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((7186301449272 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-3593150724636 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((-7186301449272 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((3593150724636 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2)],
  term ((3593150724636 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)],
  term ((-7186301449272 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 20. -/
theorem ep_Q2_054_partial_20_0166_valid :
    mulPoly ep_Q2_054_coefficient_20_0166
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0167 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 167 for generator 20. -/
def ep_Q2_054_partial_20_0167 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 20. -/
theorem ep_Q2_054_partial_20_0167_valid :
    mulPoly ep_Q2_054_coefficient_20_0167
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0168 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (16, 1)]
]

/-- Partial product 168 for generator 20. -/
def ep_Q2_054_partial_20_0168 : Poly :=
[
  term ((201158132262 : Rat) / 45033486517) [(0, 1), (8, 2), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(0, 2), (8, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(1, 2), (8, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 20. -/
theorem ep_Q2_054_partial_20_0168_valid :
    mulPoly ep_Q2_054_coefficient_20_0168
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0169 : Poly :=
[
  term ((311355318438 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 169 for generator 20. -/
def ep_Q2_054_partial_20_0169 : Poly :=
[
  term ((-622710636876 : Rat) / 45033486517) [(0, 1), (8, 3)],
  term ((311355318438 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((-622710636876 : Rat) / 45033486517) [(1, 1), (8, 2), (9, 1)],
  term ((311355318438 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((622710636876 : Rat) / 45033486517) [(8, 2), (9, 1), (11, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(8, 2), (10, 2)],
  term ((-311355318438 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((622710636876 : Rat) / 45033486517) [(8, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 20. -/
theorem ep_Q2_054_partial_20_0169_valid :
    mulPoly ep_Q2_054_coefficient_20_0169
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0170 : Poly :=
[
  term ((673628397651 : Rat) / 180133946068) [(9, 1), (11, 1)]
]

/-- Partial product 170 for generator 20. -/
def ep_Q2_054_partial_20_0170 : Poly :=
[
  term ((-673628397651 : Rat) / 90066973034) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((673628397651 : Rat) / 180133946068) [(0, 2), (9, 1), (11, 1)],
  term ((-673628397651 : Rat) / 90066973034) [(1, 1), (9, 2), (11, 1)],
  term ((673628397651 : Rat) / 180133946068) [(1, 2), (9, 1), (11, 1)],
  term ((673628397651 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(9, 1), (10, 2), (11, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(9, 1), (11, 3)],
  term ((673628397651 : Rat) / 90066973034) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 20. -/
theorem ep_Q2_054_partial_20_0170_valid :
    mulPoly ep_Q2_054_coefficient_20_0170
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0171 : Poly :=
[
  term ((-2243449205307 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 171 for generator 20. -/
def ep_Q2_054_partial_20_0171 : Poly :=
[
  term ((2243449205307 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2243449205307 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((2243449205307 : Rat) / 45033486517) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-2243449205307 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2243449205307 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2243449205307 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 20. -/
theorem ep_Q2_054_partial_20_0171_valid :
    mulPoly ep_Q2_054_coefficient_20_0171
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0172 : Poly :=
[
  term ((18939716791101 : Rat) / 180133946068) [(9, 1), (13, 1)]
]

/-- Partial product 172 for generator 20. -/
def ep_Q2_054_partial_20_0172 : Poly :=
[
  term ((-18939716791101 : Rat) / 90066973034) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((18939716791101 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((-18939716791101 : Rat) / 90066973034) [(1, 1), (9, 2), (13, 1)],
  term ((18939716791101 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((18939716791101 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-18939716791101 : Rat) / 180133946068) [(9, 1), (10, 2), (13, 1)],
  term ((-18939716791101 : Rat) / 180133946068) [(9, 1), (11, 2), (13, 1)],
  term ((18939716791101 : Rat) / 90066973034) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 20. -/
theorem ep_Q2_054_partial_20_0172_valid :
    mulPoly ep_Q2_054_coefficient_20_0172
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0173 : Poly :=
[
  term ((36941552751627 : Rat) / 180133946068) [(9, 1), (15, 1)]
]

/-- Partial product 173 for generator 20. -/
def ep_Q2_054_partial_20_0173 : Poly :=
[
  term ((-36941552751627 : Rat) / 90066973034) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((36941552751627 : Rat) / 180133946068) [(0, 2), (9, 1), (15, 1)],
  term ((-36941552751627 : Rat) / 90066973034) [(1, 1), (9, 2), (15, 1)],
  term ((36941552751627 : Rat) / 180133946068) [(1, 2), (9, 1), (15, 1)],
  term ((36941552751627 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-36941552751627 : Rat) / 180133946068) [(9, 1), (10, 2), (15, 1)],
  term ((-36941552751627 : Rat) / 180133946068) [(9, 1), (11, 2), (15, 1)],
  term ((36941552751627 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 20. -/
theorem ep_Q2_054_partial_20_0173_valid :
    mulPoly ep_Q2_054_coefficient_20_0173
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0174 : Poly :=
[
  term ((798574236675 : Rat) / 90066973034) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 20. -/
def ep_Q2_054_partial_20_0174 : Poly :=
[
  term ((-798574236675 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((798574236675 : Rat) / 90066973034) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 45033486517) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((798574236675 : Rat) / 90066973034) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((798574236675 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((798574236675 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 20. -/
theorem ep_Q2_054_partial_20_0174_valid :
    mulPoly ep_Q2_054_coefficient_20_0174
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0175 : Poly :=
[
  term ((-1596713436351 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 175 for generator 20. -/
def ep_Q2_054_partial_20_0175 : Poly :=
[
  term ((3193426872702 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 2)],
  term ((-1596713436351 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((3193426872702 : Rat) / 45033486517) [(1, 1), (9, 3)],
  term ((-1596713436351 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((-3193426872702 : Rat) / 45033486517) [(8, 1), (9, 2), (10, 1)],
  term ((1596713436351 : Rat) / 45033486517) [(9, 2), (10, 2)],
  term ((1596713436351 : Rat) / 45033486517) [(9, 2), (11, 2)],
  term ((-3193426872702 : Rat) / 45033486517) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 20. -/
theorem ep_Q2_054_partial_20_0175_valid :
    mulPoly ep_Q2_054_coefficient_20_0175
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0176 : Poly :=
[
  term ((-734867342892 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 176 for generator 20. -/
def ep_Q2_054_partial_20_0176 : Poly :=
[
  term ((1469734685784 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 2), (12, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(1, 1), (9, 3), (12, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((734867342892 : Rat) / 45033486517) [(9, 2), (10, 2), (12, 1)],
  term ((734867342892 : Rat) / 45033486517) [(9, 2), (11, 2), (12, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 20. -/
theorem ep_Q2_054_partial_20_0176_valid :
    mulPoly ep_Q2_054_coefficient_20_0176
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0177 : Poly :=
[
  term ((-33580265504373 : Rat) / 45033486517) [(11, 1), (15, 1)]
]

/-- Partial product 177 for generator 20. -/
def ep_Q2_054_partial_20_0177 : Poly :=
[
  term ((67160531008746 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-33580265504373 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1)],
  term ((67160531008746 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-33580265504373 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1)],
  term ((-67160531008746 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-67160531008746 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)],
  term ((33580265504373 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1)],
  term ((33580265504373 : Rat) / 45033486517) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 20. -/
theorem ep_Q2_054_partial_20_0177_valid :
    mulPoly ep_Q2_054_coefficient_20_0177
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0178 : Poly :=
[
  term ((-883122138717 : Rat) / 90066973034) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 20. -/
def ep_Q2_054_partial_20_0178 : Poly :=
[
  term ((883122138717 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-883122138717 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((883122138717 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-883122138717 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-883122138717 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-883122138717 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((883122138717 : Rat) / 90066973034) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((883122138717 : Rat) / 90066973034) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 20. -/
theorem ep_Q2_054_partial_20_0178_valid :
    mulPoly ep_Q2_054_coefficient_20_0178
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0179 : Poly :=
[
  term ((-4512245910233 : Rat) / 90066973034) [(12, 1)]
]

/-- Partial product 179 for generator 20. -/
def ep_Q2_054_partial_20_0179 : Poly :=
[
  term ((4512245910233 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1)],
  term ((-4512245910233 : Rat) / 90066973034) [(0, 2), (12, 1)],
  term ((4512245910233 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)],
  term ((-4512245910233 : Rat) / 90066973034) [(1, 2), (12, 1)],
  term ((-4512245910233 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1)],
  term ((-4512245910233 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1)],
  term ((4512245910233 : Rat) / 90066973034) [(10, 2), (12, 1)],
  term ((4512245910233 : Rat) / 90066973034) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 20. -/
theorem ep_Q2_054_partial_20_0179_valid :
    mulPoly ep_Q2_054_coefficient_20_0179
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0180 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 180 for generator 20. -/
def ep_Q2_054_partial_20_0180 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 20. -/
theorem ep_Q2_054_partial_20_0180_valid :
    mulPoly ep_Q2_054_coefficient_20_0180
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0181 : Poly :=
[
  term ((-2016170337060 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 181 for generator 20. -/
def ep_Q2_054_partial_20_0181 : Poly :=
[
  term ((4032340674120 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2016170337060 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((4032340674120 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2016170337060 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((-4032340674120 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-4032340674120 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((2016170337060 : Rat) / 45033486517) [(10, 2), (12, 1), (15, 2)],
  term ((2016170337060 : Rat) / 45033486517) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 20. -/
theorem ep_Q2_054_partial_20_0181_valid :
    mulPoly ep_Q2_054_coefficient_20_0181
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0182 : Poly :=
[
  term ((45403677525 : Rat) / 45033486517) [(12, 1), (16, 1)]
]

/-- Partial product 182 for generator 20. -/
def ep_Q2_054_partial_20_0182 : Poly :=
[
  term ((-90807355050 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(0, 2), (12, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(1, 2), (12, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(10, 2), (12, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 20. -/
theorem ep_Q2_054_partial_20_0182_valid :
    mulPoly ep_Q2_054_coefficient_20_0182
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0183 : Poly :=
[
  term ((14692679661527 : Rat) / 45033486517) [(13, 1), (15, 1)]
]

/-- Partial product 183 for generator 20. -/
def ep_Q2_054_partial_20_0183 : Poly :=
[
  term ((-29385359323054 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((14692679661527 : Rat) / 45033486517) [(0, 2), (13, 1), (15, 1)],
  term ((-29385359323054 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((14692679661527 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1)],
  term ((29385359323054 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((29385359323054 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14692679661527 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1)],
  term ((-14692679661527 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 20. -/
theorem ep_Q2_054_partial_20_0183_valid :
    mulPoly ep_Q2_054_coefficient_20_0183
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0184 : Poly :=
[
  term ((-90807355050 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 20. -/
def ep_Q2_054_partial_20_0184 : Poly :=
[
  term ((181614710100 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((181614710100 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 20. -/
theorem ep_Q2_054_partial_20_0184_valid :
    mulPoly ep_Q2_054_coefficient_20_0184
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0185 : Poly :=
[
  term ((-18474701663605 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 185 for generator 20. -/
def ep_Q2_054_partial_20_0185 : Poly :=
[
  term ((36949403327210 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)],
  term ((-18474701663605 : Rat) / 45033486517) [(0, 2), (15, 2)],
  term ((36949403327210 : Rat) / 45033486517) [(1, 1), (9, 1), (15, 2)],
  term ((-18474701663605 : Rat) / 45033486517) [(1, 2), (15, 2)],
  term ((-36949403327210 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)],
  term ((-36949403327210 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)],
  term ((18474701663605 : Rat) / 45033486517) [(10, 2), (15, 2)],
  term ((18474701663605 : Rat) / 45033486517) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 20. -/
theorem ep_Q2_054_partial_20_0185_valid :
    mulPoly ep_Q2_054_coefficient_20_0185
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0186 : Poly :=
[
  term ((-3119130001407 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 186 for generator 20. -/
def ep_Q2_054_partial_20_0186 : Poly :=
[
  term ((3119130001407 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 90066973034) [(0, 2), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 45033486517) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 90066973034) [(1, 2), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 90066973034) [(10, 2), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 90066973034) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 20. -/
theorem ep_Q2_054_partial_20_0186_valid :
    mulPoly ep_Q2_054_coefficient_20_0186
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 20. -/
def ep_Q2_054_coefficient_20_0187 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(16, 1)]
]

/-- Partial product 187 for generator 20. -/
def ep_Q2_054_partial_20_0187 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(0, 1), (8, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(0, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(1, 1), (9, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(1, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(8, 1), (10, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(9, 1), (11, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(10, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 20. -/
theorem ep_Q2_054_partial_20_0187_valid :
    mulPoly ep_Q2_054_coefficient_20_0187
        ep_Q2_054_generator_20_0100_0187 =
      ep_Q2_054_partial_20_0187 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_20_0100_0187 : List Poly :=
[
  ep_Q2_054_partial_20_0100,
  ep_Q2_054_partial_20_0101,
  ep_Q2_054_partial_20_0102,
  ep_Q2_054_partial_20_0103,
  ep_Q2_054_partial_20_0104,
  ep_Q2_054_partial_20_0105,
  ep_Q2_054_partial_20_0106,
  ep_Q2_054_partial_20_0107,
  ep_Q2_054_partial_20_0108,
  ep_Q2_054_partial_20_0109,
  ep_Q2_054_partial_20_0110,
  ep_Q2_054_partial_20_0111,
  ep_Q2_054_partial_20_0112,
  ep_Q2_054_partial_20_0113,
  ep_Q2_054_partial_20_0114,
  ep_Q2_054_partial_20_0115,
  ep_Q2_054_partial_20_0116,
  ep_Q2_054_partial_20_0117,
  ep_Q2_054_partial_20_0118,
  ep_Q2_054_partial_20_0119,
  ep_Q2_054_partial_20_0120,
  ep_Q2_054_partial_20_0121,
  ep_Q2_054_partial_20_0122,
  ep_Q2_054_partial_20_0123,
  ep_Q2_054_partial_20_0124,
  ep_Q2_054_partial_20_0125,
  ep_Q2_054_partial_20_0126,
  ep_Q2_054_partial_20_0127,
  ep_Q2_054_partial_20_0128,
  ep_Q2_054_partial_20_0129,
  ep_Q2_054_partial_20_0130,
  ep_Q2_054_partial_20_0131,
  ep_Q2_054_partial_20_0132,
  ep_Q2_054_partial_20_0133,
  ep_Q2_054_partial_20_0134,
  ep_Q2_054_partial_20_0135,
  ep_Q2_054_partial_20_0136,
  ep_Q2_054_partial_20_0137,
  ep_Q2_054_partial_20_0138,
  ep_Q2_054_partial_20_0139,
  ep_Q2_054_partial_20_0140,
  ep_Q2_054_partial_20_0141,
  ep_Q2_054_partial_20_0142,
  ep_Q2_054_partial_20_0143,
  ep_Q2_054_partial_20_0144,
  ep_Q2_054_partial_20_0145,
  ep_Q2_054_partial_20_0146,
  ep_Q2_054_partial_20_0147,
  ep_Q2_054_partial_20_0148,
  ep_Q2_054_partial_20_0149,
  ep_Q2_054_partial_20_0150,
  ep_Q2_054_partial_20_0151,
  ep_Q2_054_partial_20_0152,
  ep_Q2_054_partial_20_0153,
  ep_Q2_054_partial_20_0154,
  ep_Q2_054_partial_20_0155,
  ep_Q2_054_partial_20_0156,
  ep_Q2_054_partial_20_0157,
  ep_Q2_054_partial_20_0158,
  ep_Q2_054_partial_20_0159,
  ep_Q2_054_partial_20_0160,
  ep_Q2_054_partial_20_0161,
  ep_Q2_054_partial_20_0162,
  ep_Q2_054_partial_20_0163,
  ep_Q2_054_partial_20_0164,
  ep_Q2_054_partial_20_0165,
  ep_Q2_054_partial_20_0166,
  ep_Q2_054_partial_20_0167,
  ep_Q2_054_partial_20_0168,
  ep_Q2_054_partial_20_0169,
  ep_Q2_054_partial_20_0170,
  ep_Q2_054_partial_20_0171,
  ep_Q2_054_partial_20_0172,
  ep_Q2_054_partial_20_0173,
  ep_Q2_054_partial_20_0174,
  ep_Q2_054_partial_20_0175,
  ep_Q2_054_partial_20_0176,
  ep_Q2_054_partial_20_0177,
  ep_Q2_054_partial_20_0178,
  ep_Q2_054_partial_20_0179,
  ep_Q2_054_partial_20_0180,
  ep_Q2_054_partial_20_0181,
  ep_Q2_054_partial_20_0182,
  ep_Q2_054_partial_20_0183,
  ep_Q2_054_partial_20_0184,
  ep_Q2_054_partial_20_0185,
  ep_Q2_054_partial_20_0186,
  ep_Q2_054_partial_20_0187
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_20_0100_0187 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9301407903450 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (13, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((27204443114400 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((1832979075810 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((464275379772 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-30734695439874 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((14062848128100 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 2), (13, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1)],
  term ((1790882399202 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1)],
  term ((81651926988 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-8368278588900 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 2)],
  term ((-1269540678672 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-47119843066050 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((-7247704606902 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (12, 1), (16, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (16, 1)],
  term ((-1473359911254 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((5380452621459 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-104871884544 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((163303853976 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((11469860029599 : Rat) / 90066973034) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-416237630154 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-4463612933499 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((28418099317317 : Rat) / 90066973034) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-82421333622345 : Rat) / 90066973034) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-2247397248174 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1265682617892 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (9, 1)],
  term ((3651643012500 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (11, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((745511009544 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (13, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (13, 1), (15, 2)],
  term ((26753690649222 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((921681134010 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((2031908323536 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (12, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (16, 1)],
  term ((-1178130404772 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 2)],
  term ((13727981250000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 2), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 2), (16, 1)],
  term ((-673628397651 : Rat) / 90066973034) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((2243449205307 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-18939716791101 : Rat) / 90066973034) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((-36941552751627 : Rat) / 90066973034) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-798574236675 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3193426872702 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 2)],
  term ((1469734685784 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 2), (12, 1)],
  term ((67160531008746 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((883122138717 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4512245910233 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4032340674120 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-90807355050 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-29385359323054 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((181614710100 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((36949403327210 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)],
  term ((3119130001407 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(0, 1), (8, 1), (16, 1)],
  term ((3421173551274 : Rat) / 45033486517) [(0, 1), (8, 2)],
  term ((-1469734685784 : Rat) / 45033486517) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((1824751430244 : Rat) / 45033486517) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-95532936070068 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(0, 1), (8, 2), (12, 1), (16, 1)],
  term ((-29000812079880 : Rat) / 45033486517) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((603474396786 : Rat) / 45033486517) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((7186301449272 : Rat) / 45033486517) [(0, 1), (8, 2), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(0, 1), (8, 2), (16, 1)],
  term ((-622710636876 : Rat) / 45033486517) [(0, 1), (8, 3)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4650703951725 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(0, 2), (3, 1), (15, 1)],
  term ((-916489537905 : Rat) / 45033486517) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-895441199601 : Rat) / 45033486517) [(0, 2), (6, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-232137689886 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((15367347719937 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-7031424064050 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 2)],
  term ((3623852303451 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((4184139294450 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((367433671446 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 2)],
  term ((634770339336 : Rat) / 45033486517) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((23559921533025 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(0, 2), (6, 1), (16, 1)],
  term ((736679955627 : Rat) / 45033486517) [(0, 2), (6, 2)],
  term ((-632841308946 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1825821506250 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-372755504772 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-13376845324611 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-460840567005 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5380452621459 : Rat) / 90066973034) [(0, 2), (7, 1), (9, 1)],
  term ((163303853976 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((52435942272 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((15253312500 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-11469860029599 : Rat) / 180133946068) [(0, 2), (7, 1), (11, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((208118815077 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((466751362500 : Rat) / 45033486517) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((4463612933499 : Rat) / 90066973034) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-28418099317317 : Rat) / 180133946068) [(0, 2), (7, 1), (13, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((82421333622345 : Rat) / 180133946068) [(0, 2), (7, 1), (15, 1)],
  term ((1123698624087 : Rat) / 45033486517) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1015954161768 : Rat) / 45033486517) [(0, 2), (7, 2)],
  term ((589065202386 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (16, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(0, 2), (7, 2), (11, 1), (13, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(0, 2), (7, 2), (12, 1)],
  term ((264477316230 : Rat) / 45033486517) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (7, 2), (16, 1)],
  term ((-1710586775637 : Rat) / 45033486517) [(0, 2), (8, 1)],
  term ((734867342892 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((-912375715122 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((47766468035034 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((301737198393 : Rat) / 90066973034) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((14500406039940 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3593150724636 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((479144542005 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(0, 2), (8, 1), (16, 1)],
  term ((311355318438 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((673628397651 : Rat) / 180133946068) [(0, 2), (9, 1), (11, 1)],
  term ((-2243449205307 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((18939716791101 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((36941552751627 : Rat) / 180133946068) [(0, 2), (9, 1), (15, 1)],
  term ((798574236675 : Rat) / 90066973034) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1596713436351 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((-33580265504373 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1)],
  term ((-883122138717 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4512245910233 : Rat) / 90066973034) [(0, 2), (12, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2016170337060 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((45403677525 : Rat) / 45033486517) [(0, 2), (12, 1), (16, 1)],
  term ((14692679661527 : Rat) / 45033486517) [(0, 2), (13, 1), (15, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18474701663605 : Rat) / 45033486517) [(0, 2), (15, 2)],
  term ((-3119130001407 : Rat) / 90066973034) [(0, 2), (15, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(0, 2), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9301407903450 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((27204443114400 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((1832979075810 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-30734695439874 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((14062848128100 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((464275379772 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((-7247704606902 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((1790882399202 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-47119843066050 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((81651926988 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((-8368278588900 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 3)],
  term ((-1473359911254 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1)],
  term ((3651643012500 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((745511009544 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((26753690649222 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((921681134010 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1265682617892 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 2)],
  term ((11469860029599 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-416237630154 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-4463612933499 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((28418099317317 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-82421333622345 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2247397248174 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((5380452621459 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2)],
  term ((-326607707952 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-104871884544 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (12, 1)],
  term ((163303853976 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-1178130404772 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((2031908323536 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((3421173551274 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)],
  term ((-95532936070068 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-29000812079880 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((603474396786 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7186301449272 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((1824751430244 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((-622710636876 : Rat) / 45033486517) [(1, 1), (8, 2), (9, 1)],
  term ((67160531008746 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((883122138717 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4512245910233 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4032340674120 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-90807355050 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-29385359323054 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((181614710100 : Rat) / 45033486517) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((36949403327210 : Rat) / 45033486517) [(1, 1), (9, 1), (15, 2)],
  term ((3119130001407 : Rat) / 45033486517) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(1, 1), (9, 1), (16, 1)],
  term ((-673628397651 : Rat) / 90066973034) [(1, 1), (9, 2), (11, 1)],
  term ((2243449205307 : Rat) / 45033486517) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-18939716791101 : Rat) / 90066973034) [(1, 1), (9, 2), (13, 1)],
  term ((-36941552751627 : Rat) / 90066973034) [(1, 1), (9, 2), (15, 1)],
  term ((-798574236675 : Rat) / 45033486517) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((3193426872702 : Rat) / 45033486517) [(1, 1), (9, 3)],
  term ((1469734685784 : Rat) / 45033486517) [(1, 1), (9, 3), (12, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4650703951725 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1)],
  term ((604543180320 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1)],
  term ((-916489537905 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-895441199601 : Rat) / 45033486517) [(1, 2), (6, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-232137689886 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((15367347719937 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-7031424064050 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 2)],
  term ((3623852303451 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((4184139294450 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((367433671446 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 2)],
  term ((634770339336 : Rat) / 45033486517) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((23559921533025 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(1, 2), (6, 1), (16, 1)],
  term ((736679955627 : Rat) / 45033486517) [(1, 2), (6, 2)],
  term ((-632841308946 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1825821506250 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-372755504772 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-13376845324611 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-460840567005 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5380452621459 : Rat) / 90066973034) [(1, 2), (7, 1), (9, 1)],
  term ((163303853976 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((52435942272 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((15253312500 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-11469860029599 : Rat) / 180133946068) [(1, 2), (7, 1), (11, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((208118815077 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((466751362500 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((4463612933499 : Rat) / 90066973034) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-28418099317317 : Rat) / 180133946068) [(1, 2), (7, 1), (13, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((82421333622345 : Rat) / 180133946068) [(1, 2), (7, 1), (15, 1)],
  term ((1123698624087 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1015954161768 : Rat) / 45033486517) [(1, 2), (7, 2)],
  term ((589065202386 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (16, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(1, 2), (7, 2), (11, 1), (13, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((264477316230 : Rat) / 45033486517) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (7, 2), (16, 1)],
  term ((-1710586775637 : Rat) / 45033486517) [(1, 2), (8, 1)],
  term ((734867342892 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((-912375715122 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((47766468035034 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((301737198393 : Rat) / 90066973034) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((14500406039940 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3593150724636 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((479144542005 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(1, 2), (8, 1), (16, 1)],
  term ((311355318438 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((673628397651 : Rat) / 180133946068) [(1, 2), (9, 1), (11, 1)],
  term ((-2243449205307 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((18939716791101 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((36941552751627 : Rat) / 180133946068) [(1, 2), (9, 1), (15, 1)],
  term ((798574236675 : Rat) / 90066973034) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1596713436351 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((-33580265504373 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1)],
  term ((-883122138717 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4512245910233 : Rat) / 90066973034) [(1, 2), (12, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2016170337060 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((45403677525 : Rat) / 45033486517) [(1, 2), (12, 1), (16, 1)],
  term ((14692679661527 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18474701663605 : Rat) / 45033486517) [(1, 2), (15, 2)],
  term ((-3119130001407 : Rat) / 90066973034) [(1, 2), (15, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(1, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9301407903450 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27204443114400 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1832979075810 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9301407903450 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27204443114400 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1832979075810 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((4650703951725 : Rat) / 45033486517) [(3, 1), (10, 2), (13, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(3, 1), (10, 2), (15, 1)],
  term ((916489537905 : Rat) / 45033486517) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4650703951725 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((13602221557200 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)],
  term ((916489537905 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-464275379772 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((30734695439874 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-14062848128100 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (10, 1), (13, 1)],
  term ((232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((30734695439874 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-14062848128100 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5661301955130 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-464275379772 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((-15367347719937 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((7031424064050 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((-15367347719937 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 2), (13, 1)],
  term ((7031424064050 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 3)],
  term ((-38827572436728 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (10, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (11, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2), (10, 2)],
  term ((19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2), (11, 2)],
  term ((-81651926988 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((8368278588900 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((734867342892 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (10, 1)],
  term ((-1790882399202 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((47119843066050 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((-3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (16, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((-4184139294450 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1790882399202 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((47119843066050 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-4184139294450 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((790396136667 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 2), (10, 2)],
  term ((-81651926988 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((8368278588900 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 2)],
  term ((734867342892 : Rat) / 45033486517) [(6, 1), (9, 3), (11, 1)],
  term ((895441199601 : Rat) / 45033486517) [(6, 1), (10, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((-23559921533025 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 2), (16, 1)],
  term ((895441199601 : Rat) / 45033486517) [(6, 1), (11, 2)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-23559921533025 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 2), (8, 1), (10, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 2), (9, 1), (11, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (10, 2)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (11, 2)],
  term ((-5380452621459 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((326607707952 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((104871884544 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((30506625000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((-745511009544 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-26753690649222 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3018801703554 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1265682617892 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-11469860029599 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((416237630154 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((4463612933499 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-28418099317317 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((82421333622345 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((2247397248174 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1825821506250 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((372755504772 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((13376845324611 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((372755504772 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((13376845324611 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((1825821506250 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((-1265682617892 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((-3651643012500 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-745511009544 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1), (15, 2)],
  term ((-26753690649222 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((5380452621459 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 2)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((4463612933499 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-28418099317317 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((82421333622345 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((2247397248174 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3044703704070 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2)],
  term ((-52435942272 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-158956467455628 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((400984317654 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 3), (13, 1)],
  term ((-5380452621459 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1)],
  term ((104871884544 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((30506625000 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((326607707952 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 2), (13, 1)],
  term ((11469860029599 : Rat) / 180133946068) [(7, 1), (10, 2), (11, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-4463612933499 : Rat) / 90066973034) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((28418099317317 : Rat) / 180133946068) [(7, 1), (10, 2), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((-82421333622345 : Rat) / 180133946068) [(7, 1), (10, 2), (15, 1)],
  term ((-1123698624087 : Rat) / 45033486517) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-4463612933499 : Rat) / 90066973034) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((28418099317317 : Rat) / 180133946068) [(7, 1), (11, 2), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-82421333622345 : Rat) / 180133946068) [(7, 1), (11, 2), (15, 1)],
  term ((-1123698624087 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((11469860029599 : Rat) / 180133946068) [(7, 1), (11, 3)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (11, 3), (13, 1), (15, 1)],
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (11, 3), (16, 1)],
  term ((1178130404772 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-2031908323536 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (12, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-589065202386 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((-589065202386 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 3), (13, 1)],
  term ((1178130404772 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((-2031908323536 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((1015954161768 : Rat) / 45033486517) [(7, 2), (10, 2)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 2), (10, 2), (12, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (10, 2), (16, 1)],
  term ((1015954161768 : Rat) / 45033486517) [(7, 2), (11, 2)],
  term ((233375681250 : Rat) / 45033486517) [(7, 2), (11, 2), (12, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (11, 2), (16, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (11, 3), (13, 1)],
  term ((673628397651 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2243449205307 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((18939716791101 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((36941552751627 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((798574236675 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((912375715122 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-3421173551274 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((29000812079880 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7186301449272 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((96445311785190 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3193426872702 : Rat) / 45033486517) [(8, 1), (9, 2), (10, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-1824751430244 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-67160531008746 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-883122138717 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4512245910233 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4032340674120 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((90807355050 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((29385359323054 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36949403327210 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)],
  term ((-3119130001407 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(8, 1), (10, 1), (16, 1)],
  term ((1710586775637 : Rat) / 45033486517) [(8, 1), (10, 2)],
  term ((-47766468035034 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-14500406039940 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3593150724636 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2)],
  term ((-479144542005 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 2), (16, 1)],
  term ((1710586775637 : Rat) / 45033486517) [(8, 1), (11, 2)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14500406039940 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3593150724636 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)],
  term ((-479144542005 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 2), (16, 1)],
  term ((-47766468035034 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1824751430244 : Rat) / 45033486517) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((622710636876 : Rat) / 45033486517) [(8, 2), (9, 1), (11, 1)],
  term ((-3421173551274 : Rat) / 45033486517) [(8, 2), (10, 1)],
  term ((95532936070068 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((29000812079880 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7186301449272 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 2), (10, 1), (16, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(8, 2), (10, 2)],
  term ((-311355318438 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((622710636876 : Rat) / 45033486517) [(8, 3), (10, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(9, 1), (10, 2), (11, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-18939716791101 : Rat) / 180133946068) [(9, 1), (10, 2), (13, 1)],
  term ((-36941552751627 : Rat) / 180133946068) [(9, 1), (10, 2), (15, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4512245910233 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4032340674120 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((90807355050 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((29385359323054 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36949403327210 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)],
  term ((-3119130001407 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(9, 1), (11, 1), (16, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-18939716791101 : Rat) / 180133946068) [(9, 1), (11, 2), (13, 1)],
  term ((-305583676786611 : Rat) / 180133946068) [(9, 1), (11, 2), (15, 1)],
  term ((-2564818514109 : Rat) / 90066973034) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(9, 1), (11, 3)],
  term ((1596713436351 : Rat) / 45033486517) [(9, 2), (10, 2)],
  term ((734867342892 : Rat) / 45033486517) [(9, 2), (10, 2), (12, 1)],
  term ((-2243449205307 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((18939716791101 : Rat) / 90066973034) [(9, 2), (11, 1), (13, 1)],
  term ((36941552751627 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1)],
  term ((798574236675 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3867055270353 : Rat) / 90066973034) [(9, 2), (11, 2)],
  term ((734867342892 : Rat) / 45033486517) [(9, 2), (11, 2), (12, 1)],
  term ((-3193426872702 : Rat) / 45033486517) [(9, 3), (11, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(9, 3), (11, 1), (12, 1)],
  term ((33580265504373 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1)],
  term ((883122138717 : Rat) / 90066973034) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((4512245910233 : Rat) / 90066973034) [(10, 2), (12, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((2016170337060 : Rat) / 45033486517) [(10, 2), (12, 1), (15, 2)],
  term ((-45403677525 : Rat) / 45033486517) [(10, 2), (12, 1), (16, 1)],
  term ((-14692679661527 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1)],
  term ((90807355050 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((18474701663605 : Rat) / 45033486517) [(10, 2), (15, 2)],
  term ((3119130001407 : Rat) / 90066973034) [(10, 2), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(10, 2), (16, 1)],
  term ((4512245910233 : Rat) / 90066973034) [(11, 2), (12, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((2016170337060 : Rat) / 45033486517) [(11, 2), (12, 1), (15, 2)],
  term ((-45403677525 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)],
  term ((-14692679661527 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1)],
  term ((90807355050 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((18474701663605 : Rat) / 45033486517) [(11, 2), (15, 2)],
  term ((3119130001407 : Rat) / 90066973034) [(11, 2), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 2), (16, 1)],
  term ((33580265504373 : Rat) / 45033486517) [(11, 3), (15, 1)],
  term ((883122138717 : Rat) / 90066973034) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 100 through 187. -/
theorem ep_Q2_054_block_20_0100_0187_valid :
    checkProductSumEq ep_Q2_054_partials_20_0100_0187
      ep_Q2_054_block_20_0100_0187 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
