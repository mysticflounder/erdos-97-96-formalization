/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 12:0-34

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 12 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_12_0000_0034 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0000 : Poly :=
[
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 12. -/
def ep_Q2_020_partial_12_0000 : Poly :=
[
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem ep_Q2_020_partial_12_0000_valid :
    mulPoly ep_Q2_020_coefficient_12_0000
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0001 : Poly :=
[
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 1 for generator 12. -/
def ep_Q2_020_partial_12_0001 : Poly :=
[
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (6, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem ep_Q2_020_partial_12_0001_valid :
    mulPoly ep_Q2_020_coefficient_12_0001
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0002 : Poly :=
[
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 2 for generator 12. -/
def ep_Q2_020_partial_12_0002 : Poly :=
[
  term ((285415654200668748 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (2, 2), (8, 1), (16, 1)],
  term ((285415654200668748 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (3, 2), (8, 1), (16, 1)],
  term ((-285415654200668748 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-285415654200668748 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (6, 2), (8, 1), (16, 1)],
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem ep_Q2_020_partial_12_0002_valid :
    mulPoly ep_Q2_020_coefficient_12_0002
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0003 : Poly :=
[
  term ((52757794849321089 : Rat) / 28298395017400811) [(0, 1), (16, 1)]
]

/-- Partial product 3 for generator 12. -/
def ep_Q2_020_partial_12_0003 : Poly :=
[
  term ((-105515589698642178 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((52757794849321089 : Rat) / 28298395017400811) [(0, 1), (2, 2), (16, 1)],
  term ((-105515589698642178 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((52757794849321089 : Rat) / 28298395017400811) [(0, 1), (3, 2), (16, 1)],
  term ((105515589698642178 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((105515589698642178 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-52757794849321089 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((-52757794849321089 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem ep_Q2_020_partial_12_0003_valid :
    mulPoly ep_Q2_020_coefficient_12_0003
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0004 : Poly :=
[
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def ep_Q2_020_partial_12_0004 : Poly :=
[
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 1), (3, 2), (12, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem ep_Q2_020_partial_12_0004_valid :
    mulPoly ep_Q2_020_coefficient_12_0004
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0005 : Poly :=
[
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 12. -/
def ep_Q2_020_partial_12_0005 : Poly :=
[
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem ep_Q2_020_partial_12_0005_valid :
    mulPoly ep_Q2_020_coefficient_12_0005
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0006 : Poly :=
[
  term ((-157728508927917609 : Rat) / 28298395017400811) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def ep_Q2_020_partial_12_0006 : Poly :=
[
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem ep_Q2_020_partial_12_0006_valid :
    mulPoly ep_Q2_020_coefficient_12_0006
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0007 : Poly :=
[
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 12. -/
def ep_Q2_020_partial_12_0007 : Poly :=
[
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem ep_Q2_020_partial_12_0007_valid :
    mulPoly ep_Q2_020_coefficient_12_0007
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0008 : Poly :=
[
  term ((-12684748816562382 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def ep_Q2_020_partial_12_0008 : Poly :=
[
  term ((25369497633124764 : Rat) / 28298395017400811) [(2, 1), (4, 2), (6, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(4, 1), (6, 3), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem ep_Q2_020_partial_12_0008_valid :
    mulPoly ep_Q2_020_coefficient_12_0008
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0009 : Poly :=
[
  term ((65895997160953980 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 9 for generator 12. -/
def ep_Q2_020_partial_12_0009 : Poly :=
[
  term ((-131791994321907960 : Rat) / 28298395017400811) [(2, 1), (4, 2), (8, 1), (16, 1)],
  term ((65895997160953980 : Rat) / 28298395017400811) [(2, 2), (4, 1), (8, 1), (16, 1)],
  term ((-131791994321907960 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((65895997160953980 : Rat) / 28298395017400811) [(3, 2), (4, 1), (8, 1), (16, 1)],
  term ((131791994321907960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-65895997160953980 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 1), (16, 1)],
  term ((-65895997160953980 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 1), (16, 1)],
  term ((131791994321907960 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem ep_Q2_020_partial_12_0009_valid :
    mulPoly ep_Q2_020_coefficient_12_0009
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0010 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def ep_Q2_020_partial_12_0010 : Poly :=
[
  term ((83662852093660944 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 2), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem ep_Q2_020_partial_12_0010_valid :
    mulPoly ep_Q2_020_coefficient_12_0010
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0011 : Poly :=
[
  term ((-2879355564355392 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 11 for generator 12. -/
def ep_Q2_020_partial_12_0011 : Poly :=
[
  term ((5758711128710784 : Rat) / 28298395017400811) [(2, 1), (4, 2), (16, 1)],
  term ((-2879355564355392 : Rat) / 28298395017400811) [(2, 2), (4, 1), (16, 1)],
  term ((5758711128710784 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-2879355564355392 : Rat) / 28298395017400811) [(3, 2), (4, 1), (16, 1)],
  term ((-5758711128710784 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((2879355564355392 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((2879355564355392 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)],
  term ((-5758711128710784 : Rat) / 28298395017400811) [(4, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem ep_Q2_020_partial_12_0011_valid :
    mulPoly ep_Q2_020_coefficient_12_0011
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0012 : Poly :=
[
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 12 for generator 12. -/
def ep_Q2_020_partial_12_0012 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(2, 1), (4, 3), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(2, 2), (4, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(3, 2), (4, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem ep_Q2_020_partial_12_0012_valid :
    mulPoly ep_Q2_020_coefficient_12_0012
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0013 : Poly :=
[
  term ((12684748816562382 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 13 for generator 12. -/
def ep_Q2_020_partial_12_0013 : Poly :=
[
  term ((-25369497633124764 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(5, 1), (7, 3), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem ep_Q2_020_partial_12_0013_valid :
    mulPoly ep_Q2_020_coefficient_12_0013
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0014 : Poly :=
[
  term ((-25369497633124764 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 12. -/
def ep_Q2_020_partial_12_0014 : Poly :=
[
  term ((50738995266249528 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem ep_Q2_020_partial_12_0014_valid :
    mulPoly ep_Q2_020_coefficient_12_0014
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0015 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 12. -/
def ep_Q2_020_partial_12_0015 : Poly :=
[
  term ((83662852093660944 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem ep_Q2_020_partial_12_0015_valid :
    mulPoly ep_Q2_020_coefficient_12_0015
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0016 : Poly :=
[
  term ((20915713023415236 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def ep_Q2_020_partial_12_0016 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(2, 2), (5, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(3, 1), (5, 3), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(3, 2), (5, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(5, 2), (6, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem ep_Q2_020_partial_12_0016_valid :
    mulPoly ep_Q2_020_coefficient_12_0016
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0017 : Poly :=
[
  term ((258548360893982577 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 17 for generator 12. -/
def ep_Q2_020_partial_12_0017 : Poly :=
[
  term ((-517096721787965154 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((258548360893982577 : Rat) / 28298395017400811) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((-517096721787965154 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((258548360893982577 : Rat) / 28298395017400811) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((517096721787965154 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 1), (16, 1)],
  term ((517096721787965154 : Rat) / 28298395017400811) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-258548360893982577 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-258548360893982577 : Rat) / 28298395017400811) [(6, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem ep_Q2_020_partial_12_0017_valid :
    mulPoly ep_Q2_020_coefficient_12_0017
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0018 : Poly :=
[
  term ((-188859843624608631 : Rat) / 56596790034801622) [(6, 1), (16, 1)]
]

/-- Partial product 18 for generator 12. -/
def ep_Q2_020_partial_12_0018 : Poly :=
[
  term ((188859843624608631 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-188859843624608631 : Rat) / 56596790034801622) [(2, 2), (6, 1), (16, 1)],
  term ((188859843624608631 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-188859843624608631 : Rat) / 56596790034801622) [(3, 2), (6, 1), (16, 1)],
  term ((-188859843624608631 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((-188859843624608631 : Rat) / 28298395017400811) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((188859843624608631 : Rat) / 56596790034801622) [(6, 1), (7, 2), (16, 1)],
  term ((188859843624608631 : Rat) / 56596790034801622) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem ep_Q2_020_partial_12_0018_valid :
    mulPoly ep_Q2_020_coefficient_12_0018
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0019 : Poly :=
[
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 2), (16, 1)]
]

/-- Partial product 19 for generator 12. -/
def ep_Q2_020_partial_12_0019 : Poly :=
[
  term ((5265379791325926 : Rat) / 1230365000756557) [(2, 1), (4, 1), (6, 2), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(2, 2), (6, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(3, 2), (6, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(4, 1), (6, 3), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 2), (7, 2), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem ep_Q2_020_partial_12_0019_valid :
    mulPoly ep_Q2_020_coefficient_12_0019
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0020 : Poly :=
[
  term ((108418986383933916 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 12. -/
def ep_Q2_020_partial_12_0020 : Poly :=
[
  term ((-216837972767867832 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((108418986383933916 : Rat) / 28298395017400811) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-216837972767867832 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((108418986383933916 : Rat) / 28298395017400811) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((216837972767867832 : Rat) / 28298395017400811) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((216837972767867832 : Rat) / 28298395017400811) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem ep_Q2_020_partial_12_0020_valid :
    mulPoly ep_Q2_020_coefficient_12_0020
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0021 : Poly :=
[
  term ((-2632689895662963 : Rat) / 1230365000756557) [(7, 2), (16, 1)]
]

/-- Partial product 21 for generator 12. -/
def ep_Q2_020_partial_12_0021 : Poly :=
[
  term ((5265379791325926 : Rat) / 1230365000756557) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(2, 2), (7, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(3, 2), (7, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(5, 1), (7, 3), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 2), (7, 2), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem ep_Q2_020_partial_12_0021_valid :
    mulPoly ep_Q2_020_coefficient_12_0021
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0022 : Poly :=
[
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 22 for generator 12. -/
def ep_Q2_020_partial_12_0022 : Poly :=
[
  term ((-73385709777162504 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(7, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem ep_Q2_020_partial_12_0022_valid :
    mulPoly ep_Q2_020_coefficient_12_0022
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0023 : Poly :=
[
  term ((101957417638946808 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 23 for generator 12. -/
def ep_Q2_020_partial_12_0023 : Poly :=
[
  term ((-203914835277893616 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (14, 1), (16, 1)],
  term ((101957417638946808 : Rat) / 28298395017400811) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((-203914835277893616 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((101957417638946808 : Rat) / 28298395017400811) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((203914835277893616 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((203914835277893616 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-101957417638946808 : Rat) / 28298395017400811) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((-101957417638946808 : Rat) / 28298395017400811) [(7, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem ep_Q2_020_partial_12_0023_valid :
    mulPoly ep_Q2_020_coefficient_12_0023
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0024 : Poly :=
[
  term ((111667594595504358 : Rat) / 28298395017400811) [(8, 1), (16, 1)]
]

/-- Partial product 24 for generator 12. -/
def ep_Q2_020_partial_12_0024 : Poly :=
[
  term ((-223335189191008716 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((111667594595504358 : Rat) / 28298395017400811) [(2, 2), (8, 1), (16, 1)],
  term ((-223335189191008716 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((111667594595504358 : Rat) / 28298395017400811) [(3, 2), (8, 1), (16, 1)],
  term ((223335189191008716 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((223335189191008716 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-111667594595504358 : Rat) / 28298395017400811) [(6, 2), (8, 1), (16, 1)],
  term ((-111667594595504358 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem ep_Q2_020_partial_12_0024_valid :
    mulPoly ep_Q2_020_coefficient_12_0024
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0025 : Poly :=
[
  term ((-6308722559776626 : Rat) / 690204756521971) [(8, 2), (16, 1)]
]

/-- Partial product 25 for generator 12. -/
def ep_Q2_020_partial_12_0025 : Poly :=
[
  term ((12617445119553252 : Rat) / 690204756521971) [(2, 1), (4, 1), (8, 2), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(2, 2), (8, 2), (16, 1)],
  term ((12617445119553252 : Rat) / 690204756521971) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(3, 2), (8, 2), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(4, 1), (6, 1), (8, 2), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(6, 2), (8, 2), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(7, 2), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem ep_Q2_020_partial_12_0025_valid :
    mulPoly ep_Q2_020_coefficient_12_0025
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0026 : Poly :=
[
  term ((198348295900969719 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 12. -/
def ep_Q2_020_partial_12_0026 : Poly :=
[
  term ((-396696591801939438 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((198348295900969719 : Rat) / 28298395017400811) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-396696591801939438 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((198348295900969719 : Rat) / 28298395017400811) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((396696591801939438 : Rat) / 28298395017400811) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((396696591801939438 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-198348295900969719 : Rat) / 28298395017400811) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-198348295900969719 : Rat) / 28298395017400811) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem ep_Q2_020_partial_12_0026_valid :
    mulPoly ep_Q2_020_coefficient_12_0026
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0027 : Poly :=
[
  term ((-22112949090248544 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 12. -/
def ep_Q2_020_partial_12_0027 : Poly :=
[
  term ((44225898180497088 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22112949090248544 : Rat) / 28298395017400811) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((44225898180497088 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22112949090248544 : Rat) / 28298395017400811) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-44225898180497088 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-44225898180497088 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((22112949090248544 : Rat) / 28298395017400811) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((22112949090248544 : Rat) / 28298395017400811) [(7, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem ep_Q2_020_partial_12_0027_valid :
    mulPoly ep_Q2_020_coefficient_12_0027
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0028 : Poly :=
[
  term ((175555007497515237 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 28 for generator 12. -/
def ep_Q2_020_partial_12_0028 : Poly :=
[
  term ((-351110014995030474 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((175555007497515237 : Rat) / 28298395017400811) [(2, 2), (12, 1), (16, 1)],
  term ((-351110014995030474 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((175555007497515237 : Rat) / 28298395017400811) [(3, 2), (12, 1), (16, 1)],
  term ((351110014995030474 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((351110014995030474 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-175555007497515237 : Rat) / 28298395017400811) [(6, 2), (12, 1), (16, 1)],
  term ((-175555007497515237 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem ep_Q2_020_partial_12_0028_valid :
    mulPoly ep_Q2_020_coefficient_12_0028
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0029 : Poly :=
[
  term ((-82947139681153428 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 12. -/
def ep_Q2_020_partial_12_0029 : Poly :=
[
  term ((165894279362306856 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82947139681153428 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((165894279362306856 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82947139681153428 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-165894279362306856 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-165894279362306856 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((82947139681153428 : Rat) / 28298395017400811) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((82947139681153428 : Rat) / 28298395017400811) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem ep_Q2_020_partial_12_0029_valid :
    mulPoly ep_Q2_020_coefficient_12_0029
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0030 : Poly :=
[
  term ((41146639498290780 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

/-- Partial product 30 for generator 12. -/
def ep_Q2_020_partial_12_0030 : Poly :=
[
  term ((-82293278996581560 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((41146639498290780 : Rat) / 28298395017400811) [(2, 2), (13, 2), (16, 1)],
  term ((-82293278996581560 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((41146639498290780 : Rat) / 28298395017400811) [(3, 2), (13, 2), (16, 1)],
  term ((82293278996581560 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((82293278996581560 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-41146639498290780 : Rat) / 28298395017400811) [(6, 2), (13, 2), (16, 1)],
  term ((-41146639498290780 : Rat) / 28298395017400811) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem ep_Q2_020_partial_12_0030_valid :
    mulPoly ep_Q2_020_coefficient_12_0030
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0031 : Poly :=
[
  term ((-63647524738627257 : Rat) / 56596790034801622) [(14, 1), (16, 1)]
]

/-- Partial product 31 for generator 12. -/
def ep_Q2_020_partial_12_0031 : Poly :=
[
  term ((63647524738627257 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-63647524738627257 : Rat) / 56596790034801622) [(2, 2), (14, 1), (16, 1)],
  term ((63647524738627257 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-63647524738627257 : Rat) / 56596790034801622) [(3, 2), (14, 1), (16, 1)],
  term ((-63647524738627257 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-63647524738627257 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((63647524738627257 : Rat) / 56596790034801622) [(6, 2), (14, 1), (16, 1)],
  term ((63647524738627257 : Rat) / 56596790034801622) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem ep_Q2_020_partial_12_0031_valid :
    mulPoly ep_Q2_020_coefficient_12_0031
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0032 : Poly :=
[
  term ((-56557577836222500 : Rat) / 28298395017400811) [(14, 2), (16, 1)]
]

/-- Partial product 32 for generator 12. -/
def ep_Q2_020_partial_12_0032 : Poly :=
[
  term ((113115155672445000 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-56557577836222500 : Rat) / 28298395017400811) [(2, 2), (14, 2), (16, 1)],
  term ((113115155672445000 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-56557577836222500 : Rat) / 28298395017400811) [(3, 2), (14, 2), (16, 1)],
  term ((-113115155672445000 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-113115155672445000 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((56557577836222500 : Rat) / 28298395017400811) [(6, 2), (14, 2), (16, 1)],
  term ((56557577836222500 : Rat) / 28298395017400811) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem ep_Q2_020_partial_12_0032_valid :
    mulPoly ep_Q2_020_coefficient_12_0032
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0033 : Poly :=
[
  term ((-56557577836222500 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

/-- Partial product 33 for generator 12. -/
def ep_Q2_020_partial_12_0033 : Poly :=
[
  term ((113115155672445000 : Rat) / 28298395017400811) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-56557577836222500 : Rat) / 28298395017400811) [(2, 2), (15, 2), (16, 1)],
  term ((113115155672445000 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-56557577836222500 : Rat) / 28298395017400811) [(3, 2), (15, 2), (16, 1)],
  term ((-113115155672445000 : Rat) / 28298395017400811) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-113115155672445000 : Rat) / 28298395017400811) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((56557577836222500 : Rat) / 28298395017400811) [(6, 2), (15, 2), (16, 1)],
  term ((56557577836222500 : Rat) / 28298395017400811) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem ep_Q2_020_partial_12_0033_valid :
    mulPoly ep_Q2_020_coefficient_12_0033
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def ep_Q2_020_coefficient_12_0034 : Poly :=
[
  term ((-43448410233572265 : Rat) / 28298395017400811) [(16, 1)]
]

/-- Partial product 34 for generator 12. -/
def ep_Q2_020_partial_12_0034 : Poly :=
[
  term ((86896820467144530 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)],
  term ((-43448410233572265 : Rat) / 28298395017400811) [(2, 2), (16, 1)],
  term ((86896820467144530 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)],
  term ((-43448410233572265 : Rat) / 28298395017400811) [(3, 2), (16, 1)],
  term ((-86896820467144530 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((-86896820467144530 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((43448410233572265 : Rat) / 28298395017400811) [(6, 2), (16, 1)],
  term ((43448410233572265 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem ep_Q2_020_partial_12_0034_valid :
    mulPoly ep_Q2_020_coefficient_12_0034
        ep_Q2_020_generator_12_0000_0034 =
      ep_Q2_020_partial_12_0034 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_12_0000_0034 : List Poly :=
[
  ep_Q2_020_partial_12_0000,
  ep_Q2_020_partial_12_0001,
  ep_Q2_020_partial_12_0002,
  ep_Q2_020_partial_12_0003,
  ep_Q2_020_partial_12_0004,
  ep_Q2_020_partial_12_0005,
  ep_Q2_020_partial_12_0006,
  ep_Q2_020_partial_12_0007,
  ep_Q2_020_partial_12_0008,
  ep_Q2_020_partial_12_0009,
  ep_Q2_020_partial_12_0010,
  ep_Q2_020_partial_12_0011,
  ep_Q2_020_partial_12_0012,
  ep_Q2_020_partial_12_0013,
  ep_Q2_020_partial_12_0014,
  ep_Q2_020_partial_12_0015,
  ep_Q2_020_partial_12_0016,
  ep_Q2_020_partial_12_0017,
  ep_Q2_020_partial_12_0018,
  ep_Q2_020_partial_12_0019,
  ep_Q2_020_partial_12_0020,
  ep_Q2_020_partial_12_0021,
  ep_Q2_020_partial_12_0022,
  ep_Q2_020_partial_12_0023,
  ep_Q2_020_partial_12_0024,
  ep_Q2_020_partial_12_0025,
  ep_Q2_020_partial_12_0026,
  ep_Q2_020_partial_12_0027,
  ep_Q2_020_partial_12_0028,
  ep_Q2_020_partial_12_0029,
  ep_Q2_020_partial_12_0030,
  ep_Q2_020_partial_12_0031,
  ep_Q2_020_partial_12_0032,
  ep_Q2_020_partial_12_0033,
  ep_Q2_020_partial_12_0034
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_12_0000_0034 : Poly :=
[
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (6, 1), (16, 1)],
  term ((285415654200668748 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-105515589698642178 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (2, 2), (8, 1), (16, 1)],
  term ((52757794849321089 : Rat) / 28298395017400811) [(0, 1), (2, 2), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((285415654200668748 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-105515589698642178 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (3, 2), (8, 1), (16, 1)],
  term ((52757794849321089 : Rat) / 28298395017400811) [(0, 1), (3, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-285415654200668748 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((105515589698642178 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 2), (6, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-285415654200668748 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((105515589698642178 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (16, 1)],
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (6, 2), (8, 1), (16, 1)],
  term ((-52757794849321089 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 3), (16, 1)],
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (7, 2), (8, 1), (16, 1)],
  term ((-52757794849321089 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 1), (3, 2), (12, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((-517096721787965154 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((188859843624608631 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(2, 1), (4, 1), (6, 2), (16, 1)],
  term ((-216837972767867832 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-203914835277893616 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-223335189191008716 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((12617445119553252 : Rat) / 690204756521971) [(2, 1), (4, 1), (8, 2), (16, 1)],
  term ((-396696591801939438 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((44225898180497088 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-351110014995030474 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((165894279362306856 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82293278996581560 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((63647524738627257 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((113115155672445000 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((113115155672445000 : Rat) / 28298395017400811) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((86896820467144530 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(2, 1), (4, 2), (6, 1), (16, 1)],
  term ((-131791994321907960 : Rat) / 28298395017400811) [(2, 1), (4, 2), (8, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((5758711128710784 : Rat) / 28298395017400811) [(2, 1), (4, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(2, 1), (4, 3), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((65895997160953980 : Rat) / 28298395017400811) [(2, 2), (4, 1), (8, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((-238868880081009516 : Rat) / 28298395017400811) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((-2879355564355392 : Rat) / 28298395017400811) [(2, 2), (4, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(2, 2), (4, 2), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(2, 2), (5, 2), (16, 1)],
  term ((258548360893982577 : Rat) / 28298395017400811) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((-188859843624608631 : Rat) / 56596790034801622) [(2, 2), (6, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(2, 2), (6, 2), (16, 1)],
  term ((108418986383933916 : Rat) / 28298395017400811) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(2, 2), (7, 2), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((101957417638946808 : Rat) / 28298395017400811) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((111667594595504358 : Rat) / 28298395017400811) [(2, 2), (8, 1), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(2, 2), (8, 2), (16, 1)],
  term ((198348295900969719 : Rat) / 28298395017400811) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22112949090248544 : Rat) / 28298395017400811) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((175555007497515237 : Rat) / 28298395017400811) [(2, 2), (12, 1), (16, 1)],
  term ((-82947139681153428 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((41146639498290780 : Rat) / 28298395017400811) [(2, 2), (13, 2), (16, 1)],
  term ((-63647524738627257 : Rat) / 56596790034801622) [(2, 2), (14, 1), (16, 1)],
  term ((-56557577836222500 : Rat) / 28298395017400811) [(2, 2), (14, 2), (16, 1)],
  term ((-56557577836222500 : Rat) / 28298395017400811) [(2, 2), (15, 2), (16, 1)],
  term ((-43448410233572265 : Rat) / 28298395017400811) [(2, 2), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 3), (12, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 3), (14, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-131791994321907960 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((5758711128710784 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((-517096721787965154 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((188859843624608631 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-532294990623703050 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-203914835277893616 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-223335189191008716 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((12617445119553252 : Rat) / 690204756521971) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((-396696591801939438 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((44225898180497088 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-351110014995030474 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((165894279362306856 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82293278996581560 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((63647524738627257 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((113115155672445000 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((113115155672445000 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((86896820467144530 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(3, 1), (5, 3), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((65895997160953980 : Rat) / 28298395017400811) [(3, 2), (4, 1), (8, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-2879355564355392 : Rat) / 28298395017400811) [(3, 2), (4, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(3, 2), (4, 2), (16, 1)],
  term ((12684748816562382 : Rat) / 28298395017400811) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((290087520222710454 : Rat) / 28298395017400811) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-238868880081009516 : Rat) / 28298395017400811) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(3, 2), (5, 2), (16, 1)],
  term ((258548360893982577 : Rat) / 28298395017400811) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((-188859843624608631 : Rat) / 56596790034801622) [(3, 2), (6, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(3, 2), (6, 2), (16, 1)],
  term ((108418986383933916 : Rat) / 28298395017400811) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(3, 2), (7, 2), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((101957417638946808 : Rat) / 28298395017400811) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((111667594595504358 : Rat) / 28298395017400811) [(3, 2), (8, 1), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(3, 2), (8, 2), (16, 1)],
  term ((198348295900969719 : Rat) / 28298395017400811) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22112949090248544 : Rat) / 28298395017400811) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((175555007497515237 : Rat) / 28298395017400811) [(3, 2), (12, 1), (16, 1)],
  term ((-82947139681153428 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((41146639498290780 : Rat) / 28298395017400811) [(3, 2), (13, 2), (16, 1)],
  term ((-63647524738627257 : Rat) / 56596790034801622) [(3, 2), (14, 1), (16, 1)],
  term ((-56557577836222500 : Rat) / 28298395017400811) [(3, 2), (14, 2), (16, 1)],
  term ((-56557577836222500 : Rat) / 28298395017400811) [(3, 2), (15, 2), (16, 1)],
  term ((-43448410233572265 : Rat) / 28298395017400811) [(3, 2), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(3, 3), (13, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 3), (15, 1), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((131791994321907960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5758711128710784 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((216837972767867832 : Rat) / 28298395017400811) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((203914835277893616 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((223335189191008716 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(4, 1), (6, 1), (8, 2), (16, 1)],
  term ((396696591801939438 : Rat) / 28298395017400811) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44225898180497088 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((351110014995030474 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-165894279362306856 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((82293278996581560 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-63647524738627257 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-113115155672445000 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-113115155672445000 : Rat) / 28298395017400811) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-86896820467144530 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((451200724627011174 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-185980488060253239 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(4, 1), (6, 3), (16, 1)],
  term ((-65895997160953980 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((2879355564355392 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((131791994321907960 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 2), (6, 1), (14, 1), (16, 1)],
  term ((-5758711128710784 : Rat) / 28298395017400811) [(4, 2), (6, 1), (16, 1)],
  term ((-46285210656540000 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 3), (6, 1), (16, 1)],
  term ((517096721787965154 : Rat) / 28298395017400811) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-188859843624608631 : Rat) / 28298395017400811) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-133788484017058680 : Rat) / 28298395017400811) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((203914835277893616 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((223335189191008716 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((396696591801939438 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44225898180497088 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((351110014995030474 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-165894279362306856 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((82293278996581560 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-63647524738627257 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-113115155672445000 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-113115155672445000 : Rat) / 28298395017400811) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-86896820467144530 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-133788484017058680 : Rat) / 28298395017400811) [(5, 1), (7, 3), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(5, 2), (6, 2), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 3), (7, 1), (16, 1)],
  term ((-258548360893982577 : Rat) / 28298395017400811) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((188859843624608631 : Rat) / 56596790034801622) [(6, 1), (7, 2), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 2), (7, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((-101957417638946808 : Rat) / 28298395017400811) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((-111667594595504358 : Rat) / 28298395017400811) [(6, 2), (8, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(6, 2), (8, 2), (16, 1)],
  term ((-198348295900969719 : Rat) / 28298395017400811) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((22112949090248544 : Rat) / 28298395017400811) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-175555007497515237 : Rat) / 28298395017400811) [(6, 2), (12, 1), (16, 1)],
  term ((82947139681153428 : Rat) / 28298395017400811) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41146639498290780 : Rat) / 28298395017400811) [(6, 2), (13, 2), (16, 1)],
  term ((63647524738627257 : Rat) / 56596790034801622) [(6, 2), (14, 1), (16, 1)],
  term ((56557577836222500 : Rat) / 28298395017400811) [(6, 2), (14, 2), (16, 1)],
  term ((56557577836222500 : Rat) / 28298395017400811) [(6, 2), (15, 2), (16, 1)],
  term ((43448410233572265 : Rat) / 28298395017400811) [(6, 2), (16, 1)],
  term ((-258548360893982577 : Rat) / 28298395017400811) [(6, 3), (8, 1), (16, 1)],
  term ((188859843624608631 : Rat) / 56596790034801622) [(6, 3), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 4), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((-101957417638946808 : Rat) / 28298395017400811) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-111667594595504358 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(7, 2), (8, 2), (16, 1)],
  term ((-198348295900969719 : Rat) / 28298395017400811) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((22112949090248544 : Rat) / 28298395017400811) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-175555007497515237 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)],
  term ((82947139681153428 : Rat) / 28298395017400811) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41146639498290780 : Rat) / 28298395017400811) [(7, 2), (13, 2), (16, 1)],
  term ((63647524738627257 : Rat) / 56596790034801622) [(7, 2), (14, 1), (16, 1)],
  term ((56557577836222500 : Rat) / 28298395017400811) [(7, 2), (14, 2), (16, 1)],
  term ((56557577836222500 : Rat) / 28298395017400811) [(7, 2), (15, 2), (16, 1)],
  term ((43448410233572265 : Rat) / 28298395017400811) [(7, 2), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(7, 3), (13, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 34. -/
theorem ep_Q2_020_block_12_0000_0034_valid :
    checkProductSumEq ep_Q2_020_partials_12_0000_0034
      ep_Q2_020_block_12_0000_0034 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
