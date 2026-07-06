/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 6:0-34

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 6 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_06_0000_0034 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0000 : Poly :=
[
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 6. -/
def ep_Q2_020_partial_06_0000 : Poly :=
[
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 2), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 2), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 3), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 6. -/
theorem ep_Q2_020_partial_06_0000_valid :
    mulPoly ep_Q2_020_coefficient_06_0000
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0001 : Poly :=
[
  term ((18596118700846098 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 1 for generator 6. -/
def ep_Q2_020_partial_06_0001 : Poly :=
[
  term ((18596118700846098 : Rat) / 28298395017400811) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((37192237401692196 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((-18596118700846098 : Rat) / 28298395017400811) [(0, 1), (4, 2), (6, 1), (16, 1)],
  term ((-18596118700846098 : Rat) / 28298395017400811) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((-37192237401692196 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((18596118700846098 : Rat) / 28298395017400811) [(0, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 6. -/
theorem ep_Q2_020_partial_06_0001_valid :
    mulPoly ep_Q2_020_coefficient_06_0001
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0002 : Poly :=
[
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 6. -/
def ep_Q2_020_partial_06_0002 : Poly :=
[
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-175474335331953288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 6. -/
theorem ep_Q2_020_partial_06_0002_valid :
    mulPoly ep_Q2_020_coefficient_06_0002
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0003 : Poly :=
[
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 3 for generator 6. -/
def ep_Q2_020_partial_06_0003 : Poly :=
[
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((183550277367624024 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-91775138683812012 : Rat) / 28298395017400811) [(0, 1), (4, 2), (14, 1), (16, 1)],
  term ((-91775138683812012 : Rat) / 28298395017400811) [(0, 1), (5, 2), (14, 1), (16, 1)],
  term ((-183550277367624024 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 6. -/
theorem ep_Q2_020_partial_06_0003_valid :
    mulPoly ep_Q2_020_coefficient_06_0003
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0004 : Poly :=
[
  term ((-65762320539481809 : Rat) / 28298395017400811) [(0, 1), (16, 1)]
]

/-- Partial product 4 for generator 6. -/
def ep_Q2_020_partial_06_0004 : Poly :=
[
  term ((-65762320539481809 : Rat) / 28298395017400811) [(0, 1), (1, 2), (16, 1)],
  term ((-131524641078963618 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)],
  term ((65762320539481809 : Rat) / 28298395017400811) [(0, 1), (4, 2), (16, 1)],
  term ((65762320539481809 : Rat) / 28298395017400811) [(0, 1), (5, 2), (16, 1)],
  term ((131524641078963618 : Rat) / 28298395017400811) [(0, 2), (16, 1)],
  term ((-65762320539481809 : Rat) / 28298395017400811) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 6. -/
theorem ep_Q2_020_partial_06_0004_valid :
    mulPoly ep_Q2_020_coefficient_06_0004
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0005 : Poly :=
[
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 5 for generator 6. -/
def ep_Q2_020_partial_06_0005 : Poly :=
[
  term ((15007255382258568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 6. -/
theorem ep_Q2_020_partial_06_0005_valid :
    mulPoly ep_Q2_020_coefficient_06_0005
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0006 : Poly :=
[
  term ((123362250788561244 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 6. -/
def ep_Q2_020_partial_06_0006 : Poly :=
[
  term ((-246724501577122488 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((123362250788561244 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((246724501577122488 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-123362250788561244 : Rat) / 28298395017400811) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-123362250788561244 : Rat) / 28298395017400811) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((123362250788561244 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 6. -/
theorem ep_Q2_020_partial_06_0006_valid :
    mulPoly ep_Q2_020_coefficient_06_0006
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0007 : Poly :=
[
  term ((-98518727017089522 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 6. -/
def ep_Q2_020_partial_06_0007 : Poly :=
[
  term ((197037454034179044 : Rat) / 28298395017400811) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 6. -/
theorem ep_Q2_020_partial_06_0007_valid :
    mulPoly ep_Q2_020_coefficient_06_0007
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0008 : Poly :=
[
  term ((-98518727017089522 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 6. -/
def ep_Q2_020_partial_06_0008 : Poly :=
[
  term ((197037454034179044 : Rat) / 28298395017400811) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 6. -/
theorem ep_Q2_020_partial_06_0008_valid :
    mulPoly ep_Q2_020_coefficient_06_0008
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0009 : Poly :=
[
  term ((-12684748816562382 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 9 for generator 6. -/
def ep_Q2_020_partial_06_0009 : Poly :=
[
  term ((25369497633124764 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(4, 2), (6, 1), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(4, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 6. -/
theorem ep_Q2_020_partial_06_0009_valid :
    mulPoly ep_Q2_020_coefficient_06_0009
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0010 : Poly :=
[
  term ((-17383894199559216 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 10 for generator 6. -/
def ep_Q2_020_partial_06_0010 : Poly :=
[
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(4, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 6. -/
theorem ep_Q2_020_partial_06_0010_valid :
    mulPoly ep_Q2_020_coefficient_06_0010
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0011 : Poly :=
[
  term ((109045803772077474 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 11 for generator 6. -/
def ep_Q2_020_partial_06_0011 : Poly :=
[
  term ((-218091607544154948 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(4, 1), (5, 2), (12, 1), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(4, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 6. -/
theorem ep_Q2_020_partial_06_0011_valid :
    mulPoly ep_Q2_020_coefficient_06_0011
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0012 : Poly :=
[
  term ((-6396202232004663 : Rat) / 1230365000756557) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 12 for generator 6. -/
def ep_Q2_020_partial_06_0012 : Poly :=
[
  term ((12792404464009326 : Rat) / 1230365000756557) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-6396202232004663 : Rat) / 1230365000756557) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-6396202232004663 : Rat) / 1230365000756557) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((6396202232004663 : Rat) / 1230365000756557) [(4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-12792404464009326 : Rat) / 1230365000756557) [(4, 2), (14, 1), (16, 1)],
  term ((6396202232004663 : Rat) / 1230365000756557) [(4, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 6. -/
theorem ep_Q2_020_partial_06_0012_valid :
    mulPoly ep_Q2_020_coefficient_06_0012
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0013 : Poly :=
[
  term ((78778953366736119 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 13 for generator 6. -/
def ep_Q2_020_partial_06_0013 : Poly :=
[
  term ((-157557906733472238 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)],
  term ((78778953366736119 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((78778953366736119 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((-78778953366736119 : Rat) / 28298395017400811) [(4, 1), (5, 2), (16, 1)],
  term ((157557906733472238 : Rat) / 28298395017400811) [(4, 2), (16, 1)],
  term ((-78778953366736119 : Rat) / 28298395017400811) [(4, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 6. -/
theorem ep_Q2_020_partial_06_0013_valid :
    mulPoly ep_Q2_020_coefficient_06_0013
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0014 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 14 for generator 6. -/
def ep_Q2_020_partial_06_0014 : Poly :=
[
  term ((41831426046830472 : Rat) / 28298395017400811) [(0, 1), (4, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 2), (5, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 3), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 6. -/
theorem ep_Q2_020_partial_06_0014_valid :
    mulPoly ep_Q2_020_coefficient_06_0014
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0015 : Poly :=
[
  term ((-30068643016121598 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 15 for generator 6. -/
def ep_Q2_020_partial_06_0015 : Poly :=
[
  term ((60137286032243196 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-30068643016121598 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-30068643016121598 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-60137286032243196 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((30068643016121598 : Rat) / 28298395017400811) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((30068643016121598 : Rat) / 28298395017400811) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 6. -/
theorem ep_Q2_020_partial_06_0015_valid :
    mulPoly ep_Q2_020_coefficient_06_0015
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0016 : Poly :=
[
  term ((38287859039580960 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 6. -/
def ep_Q2_020_partial_06_0016 : Poly :=
[
  term ((-76575718079161920 : Rat) / 28298395017400811) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((38287859039580960 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((38287859039580960 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((76575718079161920 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 6. -/
theorem ep_Q2_020_partial_06_0016_valid :
    mulPoly ep_Q2_020_coefficient_06_0016
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0017 : Poly :=
[
  term ((98587094329420719 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 6. -/
def ep_Q2_020_partial_06_0017 : Poly :=
[
  term ((-197174188658841438 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((98587094329420719 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((98587094329420719 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((197174188658841438 : Rat) / 28298395017400811) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-98587094329420719 : Rat) / 28298395017400811) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-98587094329420719 : Rat) / 28298395017400811) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 6. -/
theorem ep_Q2_020_partial_06_0017_valid :
    mulPoly ep_Q2_020_coefficient_06_0017
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0018 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 18 for generator 6. -/
def ep_Q2_020_partial_06_0018 : Poly :=
[
  term ((41831426046830472 : Rat) / 28298395017400811) [(0, 1), (5, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(0, 2), (5, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 2), (5, 2), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 6. -/
theorem ep_Q2_020_partial_06_0018_valid :
    mulPoly ep_Q2_020_coefficient_06_0018
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0019 : Poly :=
[
  term ((80424576917094150 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 19 for generator 6. -/
def ep_Q2_020_partial_06_0019 : Poly :=
[
  term ((-160849153834188300 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((160849153834188300 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-80424576917094150 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((-80424576917094150 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 6. -/
theorem ep_Q2_020_partial_06_0019_valid :
    mulPoly ep_Q2_020_coefficient_06_0019
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0020 : Poly :=
[
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 20 for generator 6. -/
def ep_Q2_020_partial_06_0020 : Poly :=
[
  term ((73385709777162504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(5, 2), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 6. -/
theorem ep_Q2_020_partial_06_0020_valid :
    mulPoly ep_Q2_020_coefficient_06_0020
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0021 : Poly :=
[
  term ((9059447614665306 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 21 for generator 6. -/
def ep_Q2_020_partial_06_0021 : Poly :=
[
  term ((-18118895229330612 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)],
  term ((9059447614665306 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((9059447614665306 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((18118895229330612 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((-9059447614665306 : Rat) / 28298395017400811) [(4, 2), (6, 1), (16, 1)],
  term ((-9059447614665306 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 6. -/
theorem ep_Q2_020_partial_06_0021_valid :
    mulPoly ep_Q2_020_coefficient_06_0021
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0022 : Poly :=
[
  term ((-50094011088540531 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

/-- Partial product 22 for generator 6. -/
def ep_Q2_020_partial_06_0022 : Poly :=
[
  term ((100188022177081062 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((-50094011088540531 : Rat) / 28298395017400811) [(0, 2), (6, 2), (16, 1)],
  term ((-50094011088540531 : Rat) / 28298395017400811) [(1, 2), (6, 2), (16, 1)],
  term ((-100188022177081062 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((50094011088540531 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)],
  term ((50094011088540531 : Rat) / 28298395017400811) [(5, 2), (6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 6. -/
theorem ep_Q2_020_partial_06_0022_valid :
    mulPoly ep_Q2_020_coefficient_06_0022
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0023 : Poly :=
[
  term ((185279596115553840 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 6. -/
def ep_Q2_020_partial_06_0023 : Poly :=
[
  term ((-370559192231107680 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((185279596115553840 : Rat) / 28298395017400811) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((185279596115553840 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((370559192231107680 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-185279596115553840 : Rat) / 28298395017400811) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-185279596115553840 : Rat) / 28298395017400811) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 6. -/
theorem ep_Q2_020_partial_06_0023_valid :
    mulPoly ep_Q2_020_coefficient_06_0023
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0024 : Poly :=
[
  term ((-78213964935819951 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 24 for generator 6. -/
def ep_Q2_020_partial_06_0024 : Poly :=
[
  term ((156427929871639902 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)],
  term ((-78213964935819951 : Rat) / 28298395017400811) [(0, 2), (7, 2), (16, 1)],
  term ((-78213964935819951 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)],
  term ((-156427929871639902 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)],
  term ((78213964935819951 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((78213964935819951 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 6. -/
theorem ep_Q2_020_partial_06_0024_valid :
    mulPoly ep_Q2_020_coefficient_06_0024
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0025 : Poly :=
[
  term ((34767788399118432 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 25 for generator 6. -/
def ep_Q2_020_partial_06_0025 : Poly :=
[
  term ((-69535576798236864 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((69535576798236864 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 6. -/
theorem ep_Q2_020_partial_06_0025_valid :
    mulPoly ep_Q2_020_coefficient_06_0025
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0026 : Poly :=
[
  term ((-120636865375641225 : Rat) / 28298395017400811) [(8, 1), (16, 1)]
]

/-- Partial product 26 for generator 6. -/
def ep_Q2_020_partial_06_0026 : Poly :=
[
  term ((241273730751282450 : Rat) / 28298395017400811) [(0, 1), (8, 1), (16, 1)],
  term ((-120636865375641225 : Rat) / 28298395017400811) [(0, 2), (8, 1), (16, 1)],
  term ((-120636865375641225 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)],
  term ((-241273730751282450 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)],
  term ((120636865375641225 : Rat) / 28298395017400811) [(4, 2), (8, 1), (16, 1)],
  term ((120636865375641225 : Rat) / 28298395017400811) [(5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 6. -/
theorem ep_Q2_020_partial_06_0026_valid :
    mulPoly ep_Q2_020_coefficient_06_0026
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0027 : Poly :=
[
  term ((-204257822889806448 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 6. -/
def ep_Q2_020_partial_06_0027 : Poly :=
[
  term ((408515645779612896 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-204257822889806448 : Rat) / 28298395017400811) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-204257822889806448 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-408515645779612896 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((204257822889806448 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((204257822889806448 : Rat) / 28298395017400811) [(5, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 6. -/
theorem ep_Q2_020_partial_06_0027_valid :
    mulPoly ep_Q2_020_coefficient_06_0027
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0028 : Poly :=
[
  term ((199271057556181023 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 28 for generator 6. -/
def ep_Q2_020_partial_06_0028 : Poly :=
[
  term ((-398542115112362046 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)],
  term ((199271057556181023 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((199271057556181023 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((398542115112362046 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)],
  term ((-199271057556181023 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((-199271057556181023 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 6. -/
theorem ep_Q2_020_partial_06_0028_valid :
    mulPoly ep_Q2_020_coefficient_06_0028
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0029 : Poly :=
[
  term ((-550515689092170264 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 6. -/
def ep_Q2_020_partial_06_0029 : Poly :=
[
  term ((1101031378184340528 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-550515689092170264 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-550515689092170264 : Rat) / 28298395017400811) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1101031378184340528 : Rat) / 28298395017400811) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((550515689092170264 : Rat) / 28298395017400811) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((550515689092170264 : Rat) / 28298395017400811) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 6. -/
theorem ep_Q2_020_partial_06_0029_valid :
    mulPoly ep_Q2_020_coefficient_06_0029
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0030 : Poly :=
[
  term ((91578728834930958 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

/-- Partial product 30 for generator 6. -/
def ep_Q2_020_partial_06_0030 : Poly :=
[
  term ((-183157457669861916 : Rat) / 28298395017400811) [(0, 1), (13, 2), (16, 1)],
  term ((91578728834930958 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((91578728834930958 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)],
  term ((183157457669861916 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)],
  term ((-91578728834930958 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((-91578728834930958 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 6. -/
theorem ep_Q2_020_partial_06_0030_valid :
    mulPoly ep_Q2_020_coefficient_06_0030
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0031 : Poly :=
[
  term ((349895377627474977 : Rat) / 28298395017400811) [(14, 1), (16, 1)]
]

/-- Partial product 31 for generator 6. -/
def ep_Q2_020_partial_06_0031 : Poly :=
[
  term ((-699790755254949954 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((349895377627474977 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((349895377627474977 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((699790755254949954 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((-349895377627474977 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)],
  term ((-349895377627474977 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 6. -/
theorem ep_Q2_020_partial_06_0031_valid :
    mulPoly ep_Q2_020_coefficient_06_0031
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0032 : Poly :=
[
  term ((10347785392118139 : Rat) / 1951613449475918) [(14, 2), (16, 1)]
]

/-- Partial product 32 for generator 6. -/
def ep_Q2_020_partial_06_0032 : Poly :=
[
  term ((-10347785392118139 : Rat) / 975806724737959) [(0, 1), (14, 2), (16, 1)],
  term ((10347785392118139 : Rat) / 1951613449475918) [(0, 2), (14, 2), (16, 1)],
  term ((10347785392118139 : Rat) / 1951613449475918) [(1, 2), (14, 2), (16, 1)],
  term ((10347785392118139 : Rat) / 975806724737959) [(4, 1), (14, 2), (16, 1)],
  term ((-10347785392118139 : Rat) / 1951613449475918) [(4, 2), (14, 2), (16, 1)],
  term ((-10347785392118139 : Rat) / 1951613449475918) [(5, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 6. -/
theorem ep_Q2_020_partial_06_0032_valid :
    mulPoly ep_Q2_020_coefficient_06_0032
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0033 : Poly :=
[
  term ((256191784792002363 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 33 for generator 6. -/
def ep_Q2_020_partial_06_0033 : Poly :=
[
  term ((-256191784792002363 : Rat) / 28298395017400811) [(0, 1), (15, 2), (16, 1)],
  term ((256191784792002363 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((256191784792002363 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((256191784792002363 : Rat) / 28298395017400811) [(4, 1), (15, 2), (16, 1)],
  term ((-256191784792002363 : Rat) / 56596790034801622) [(4, 2), (15, 2), (16, 1)],
  term ((-256191784792002363 : Rat) / 56596790034801622) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 6. -/
theorem ep_Q2_020_partial_06_0033_valid :
    mulPoly ep_Q2_020_coefficient_06_0033
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 6. -/
def ep_Q2_020_coefficient_06_0034 : Poly :=
[
  term ((-212098715426036913 : Rat) / 28298395017400811) [(16, 1)]
]

/-- Partial product 34 for generator 6. -/
def ep_Q2_020_partial_06_0034 : Poly :=
[
  term ((424197430852073826 : Rat) / 28298395017400811) [(0, 1), (16, 1)],
  term ((-212098715426036913 : Rat) / 28298395017400811) [(0, 2), (16, 1)],
  term ((-212098715426036913 : Rat) / 28298395017400811) [(1, 2), (16, 1)],
  term ((-424197430852073826 : Rat) / 28298395017400811) [(4, 1), (16, 1)],
  term ((212098715426036913 : Rat) / 28298395017400811) [(4, 2), (16, 1)],
  term ((212098715426036913 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 6. -/
theorem ep_Q2_020_partial_06_0034_valid :
    mulPoly ep_Q2_020_coefficient_06_0034
        ep_Q2_020_generator_06_0000_0034 =
      ep_Q2_020_partial_06_0034 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_06_0000_0034 : List Poly :=
[
  ep_Q2_020_partial_06_0000,
  ep_Q2_020_partial_06_0001,
  ep_Q2_020_partial_06_0002,
  ep_Q2_020_partial_06_0003,
  ep_Q2_020_partial_06_0004,
  ep_Q2_020_partial_06_0005,
  ep_Q2_020_partial_06_0006,
  ep_Q2_020_partial_06_0007,
  ep_Q2_020_partial_06_0008,
  ep_Q2_020_partial_06_0009,
  ep_Q2_020_partial_06_0010,
  ep_Q2_020_partial_06_0011,
  ep_Q2_020_partial_06_0012,
  ep_Q2_020_partial_06_0013,
  ep_Q2_020_partial_06_0014,
  ep_Q2_020_partial_06_0015,
  ep_Q2_020_partial_06_0016,
  ep_Q2_020_partial_06_0017,
  ep_Q2_020_partial_06_0018,
  ep_Q2_020_partial_06_0019,
  ep_Q2_020_partial_06_0020,
  ep_Q2_020_partial_06_0021,
  ep_Q2_020_partial_06_0022,
  ep_Q2_020_partial_06_0023,
  ep_Q2_020_partial_06_0024,
  ep_Q2_020_partial_06_0025,
  ep_Q2_020_partial_06_0026,
  ep_Q2_020_partial_06_0027,
  ep_Q2_020_partial_06_0028,
  ep_Q2_020_partial_06_0029,
  ep_Q2_020_partial_06_0030,
  ep_Q2_020_partial_06_0031,
  ep_Q2_020_partial_06_0032,
  ep_Q2_020_partial_06_0033,
  ep_Q2_020_partial_06_0034
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_06_0000_0034 : Poly :=
[
  term ((15007255382258568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-246724501577122488 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((18596118700846098 : Rat) / 28298395017400811) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-65762320539481809 : Rat) / 28298395017400811) [(0, 1), (1, 2), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 2), (16, 1)],
  term ((62561735034816960 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-393565942876108236 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((477775580039838522 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-289082547812435856 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)],
  term ((-18596118700846098 : Rat) / 28298395017400811) [(0, 1), (4, 2), (6, 1), (16, 1)],
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((-91775138683812012 : Rat) / 28298395017400811) [(0, 1), (4, 2), (14, 1), (16, 1)],
  term ((142361534985430713 : Rat) / 28298395017400811) [(0, 1), (4, 2), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 3), (16, 1)],
  term ((60137286032243196 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-76575718079161920 : Rat) / 28298395017400811) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-197174188658841438 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-18596118700846098 : Rat) / 28298395017400811) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((-91775138683812012 : Rat) / 28298395017400811) [(0, 1), (5, 2), (14, 1), (16, 1)],
  term ((107593746586312281 : Rat) / 28298395017400811) [(0, 1), (5, 2), (16, 1)],
  term ((-160849153834188300 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-18118895229330612 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)],
  term ((100188022177081062 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((-370559192231107680 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((156427929871639902 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)],
  term ((-69535576798236864 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((241273730751282450 : Rat) / 28298395017400811) [(0, 1), (8, 1), (16, 1)],
  term ((408515645779612896 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-398542115112362046 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)],
  term ((1101031378184340528 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-183157457669861916 : Rat) / 28298395017400811) [(0, 1), (13, 2), (16, 1)],
  term ((-699790755254949954 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((-10347785392118139 : Rat) / 975806724737959) [(0, 1), (14, 2), (16, 1)],
  term ((-256191784792002363 : Rat) / 28298395017400811) [(0, 1), (15, 2), (16, 1)],
  term ((424197430852073826 : Rat) / 28298395017400811) [(0, 1), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((123362250788561244 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-6396202232004663 : Rat) / 1230365000756557) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((44011164967617687 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((-30068643016121598 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((38287859039580960 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((98587094329420719 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(0, 2), (5, 2), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-28132789787026890 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((-50094011088540531 : Rat) / 28298395017400811) [(0, 2), (6, 2), (16, 1)],
  term ((185279596115553840 : Rat) / 28298395017400811) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-78213964935819951 : Rat) / 28298395017400811) [(0, 2), (7, 2), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((-120636865375641225 : Rat) / 28298395017400811) [(0, 2), (8, 1), (16, 1)],
  term ((-204257822889806448 : Rat) / 28298395017400811) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((374745392888134311 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((-550515689092170264 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((91578728834930958 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((166345100259850953 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((10347785392118139 : Rat) / 1951613449475918) [(0, 2), (14, 2), (16, 1)],
  term ((256191784792002363 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((-80574074347073295 : Rat) / 28298395017400811) [(0, 2), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)],
  term ((18596118700846098 : Rat) / 28298395017400811) [(0, 3), (6, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)],
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)],
  term ((-65762320539481809 : Rat) / 28298395017400811) [(0, 3), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((246724501577122488 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((-123362250788561244 : Rat) / 28298395017400811) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-123362250788561244 : Rat) / 28298395017400811) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-6396202232004663 : Rat) / 1230365000756557) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((78778953366736119 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((-30068643016121598 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((38287859039580960 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((98587094329420719 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((9059447614665306 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((-50094011088540531 : Rat) / 28298395017400811) [(1, 2), (6, 2), (16, 1)],
  term ((185279596115553840 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-78213964935819951 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((-120636865375641225 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)],
  term ((-204257822889806448 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((199271057556181023 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((-550515689092170264 : Rat) / 28298395017400811) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((91578728834930958 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)],
  term ((349895377627474977 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((10347785392118139 : Rat) / 1951613449475918) [(1, 2), (14, 2), (16, 1)],
  term ((256191784792002363 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((-212098715426036913 : Rat) / 28298395017400811) [(1, 2), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)],
  term ((123362250788561244 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-60137286032243196 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((76575718079161920 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((197174188658841438 : Rat) / 28298395017400811) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(4, 1), (5, 2), (12, 1), (16, 1)],
  term ((6396202232004663 : Rat) / 1230365000756557) [(4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-120610379413566591 : Rat) / 28298395017400811) [(4, 1), (5, 2), (16, 1)],
  term ((160849153834188300 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((18118895229330612 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((-100188022177081062 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((370559192231107680 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-156427929871639902 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)],
  term ((69535576798236864 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-241273730751282450 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)],
  term ((-408515645779612896 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((398542115112362046 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)],
  term ((-1101031378184340528 : Rat) / 28298395017400811) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((183157457669861916 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)],
  term ((699790755254949954 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((10347785392118139 : Rat) / 975806724737959) [(4, 1), (14, 2), (16, 1)],
  term ((256191784792002363 : Rat) / 28298395017400811) [(4, 1), (15, 2), (16, 1)],
  term ((-424197430852073826 : Rat) / 28298395017400811) [(4, 1), (16, 1)],
  term ((30068643016121598 : Rat) / 28298395017400811) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-98587094329420719 : Rat) / 28298395017400811) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 2), (5, 2), (16, 1)],
  term ((-80424576917094150 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term ((-34428945247790070 : Rat) / 28298395017400811) [(4, 2), (6, 1), (16, 1)],
  term ((50094011088540531 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)],
  term ((-185279596115553840 : Rat) / 28298395017400811) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((78213964935819951 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((85869076976522793 : Rat) / 28298395017400811) [(4, 2), (8, 1), (16, 1)],
  term ((204257822889806448 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((18820549987973925 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((550515689092170264 : Rat) / 28298395017400811) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-91578728834930958 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((-644120680299689475 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)],
  term ((-10347785392118139 : Rat) / 1951613449475918) [(4, 2), (14, 2), (16, 1)],
  term ((-256191784792002363 : Rat) / 56596790034801622) [(4, 2), (15, 2), (16, 1)],
  term ((369656622159509151 : Rat) / 28298395017400811) [(4, 2), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(4, 3), (6, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(4, 3), (8, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(4, 3), (12, 1), (16, 1)],
  term ((6396202232004663 : Rat) / 1230365000756557) [(4, 3), (14, 1), (16, 1)],
  term ((-120610379413566591 : Rat) / 28298395017400811) [(4, 3), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 4), (16, 1)],
  term ((-80424576917094150 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(5, 2), (6, 1), (12, 1), (16, 1)],
  term ((-9059447614665306 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)],
  term ((50094011088540531 : Rat) / 28298395017400811) [(5, 2), (6, 2), (16, 1)],
  term ((-185279596115553840 : Rat) / 28298395017400811) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((78213964935819951 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((120636865375641225 : Rat) / 28298395017400811) [(5, 2), (8, 1), (16, 1)],
  term ((204257822889806448 : Rat) / 28298395017400811) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-199271057556181023 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)],
  term ((550515689092170264 : Rat) / 28298395017400811) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-91578728834930958 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((-349895377627474977 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)],
  term ((-10347785392118139 : Rat) / 1951613449475918) [(5, 2), (14, 2), (16, 1)],
  term ((-256191784792002363 : Rat) / 56596790034801622) [(5, 2), (15, 2), (16, 1)],
  term ((212098715426036913 : Rat) / 28298395017400811) [(5, 2), (16, 1)],
  term ((30068643016121598 : Rat) / 28298395017400811) [(5, 3), (7, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(5, 3), (13, 1), (16, 1)],
  term ((-98587094329420719 : Rat) / 28298395017400811) [(5, 3), (15, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 0 through 34. -/
theorem ep_Q2_020_block_06_0000_0034_valid :
    checkProductSumEq ep_Q2_020_partials_06_0000_0034
      ep_Q2_020_block_06_0000_0034 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
