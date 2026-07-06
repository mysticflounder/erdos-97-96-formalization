/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 13:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 13 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_13_0000_0099 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0000 : Poly :=
[
  term ((-3710745507238253360124 : Rat) / 253528477699481291099) []
]

/-- Partial product 0 for generator 13. -/
def ep_Q2_002_partial_13_0000 : Poly :=
[
  term ((-7421491014476506720248 : Rat) / 253528477699481291099) [(4, 1), (6, 1)],
  term ((-7421491014476506720248 : Rat) / 253528477699481291099) [(5, 1), (7, 1)],
  term ((3710745507238253360124 : Rat) / 253528477699481291099) [(6, 2)],
  term ((3710745507238253360124 : Rat) / 253528477699481291099) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem ep_Q2_002_partial_13_0000_valid :
    mulPoly ep_Q2_002_coefficient_13_0000
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0001 : Poly :=
[
  term ((11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1)]
]

/-- Partial product 1 for generator 13. -/
def ep_Q2_002_partial_13_0001 : Poly :=
[
  term ((22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (4, 1), (6, 1)],
  term ((22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (5, 1), (7, 1)],
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (6, 2)],
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem ep_Q2_002_partial_13_0001_valid :
    mulPoly ep_Q2_002_coefficient_13_0001
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0002 : Poly :=
[
  term ((-7063239509019014087276216636544 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 13. -/
def ep_Q2_002_partial_13_0002 : Poly :=
[
  term ((-14126479018038028174552433273088 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (4, 1), (6, 1)],
  term ((-14126479018038028174552433273088 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1)],
  term ((7063239509019014087276216636544 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (6, 2)],
  term ((7063239509019014087276216636544 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem ep_Q2_002_partial_13_0002_valid :
    mulPoly ep_Q2_002_coefficient_13_0002
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0003 : Poly :=
[
  term ((5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 3 for generator 13. -/
def ep_Q2_002_partial_13_0003 : Poly :=
[
  term ((10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (6, 1), (11, 1)],
  term ((10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1)],
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 2), (11, 1)],
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem ep_Q2_002_partial_13_0003_valid :
    mulPoly ep_Q2_002_coefficient_13_0003
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0004 : Poly :=
[
  term ((-8849220996467454368219878863744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 4 for generator 13. -/
def ep_Q2_002_partial_13_0004 : Poly :=
[
  term ((-17698441992934908736439757727488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (6, 1), (15, 1)],
  term ((-17698441992934908736439757727488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1)],
  term ((8849220996467454368219878863744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term ((8849220996467454368219878863744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem ep_Q2_002_partial_13_0004_valid :
    mulPoly ep_Q2_002_coefficient_13_0004
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0005 : Poly :=
[
  term ((99861392854851512171965093973088 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 5 for generator 13. -/
def ep_Q2_002_partial_13_0005 : Poly :=
[
  term ((199722785709703024343930187946176 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((199722785709703024343930187946176 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-99861392854851512171965093973088 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((-99861392854851512171965093973088 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem ep_Q2_002_partial_13_0005_valid :
    mulPoly ep_Q2_002_coefficient_13_0005
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0006 : Poly :=
[
  term ((-188057703968631130616987850228096 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 6 for generator 13. -/
def ep_Q2_002_partial_13_0006 : Poly :=
[
  term ((-376115407937262261233975700456192 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-376115407937262261233975700456192 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((188057703968631130616987850228096 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((188057703968631130616987850228096 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem ep_Q2_002_partial_13_0006_valid :
    mulPoly ep_Q2_002_coefficient_13_0006
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0007 : Poly :=
[
  term ((106508282673411691126813380959162096066208 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 7 for generator 13. -/
def ep_Q2_002_partial_13_0007 : Poly :=
[
  term ((213016565346823382253626761918324192132416 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((213016565346823382253626761918324192132416 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-106508282673411691126813380959162096066208 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((-106508282673411691126813380959162096066208 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem ep_Q2_002_partial_13_0007_valid :
    mulPoly ep_Q2_002_coefficient_13_0007
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0008 : Poly :=
[
  term ((-10050547072 : Rat) / 1480263449) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 13. -/
def ep_Q2_002_partial_13_0008 : Poly :=
[
  term ((-20101094144 : Rat) / 1480263449) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-20101094144 : Rat) / 1480263449) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((10050547072 : Rat) / 1480263449) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((10050547072 : Rat) / 1480263449) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem ep_Q2_002_partial_13_0008_valid :
    mulPoly ep_Q2_002_coefficient_13_0008
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0009 : Poly :=
[
  term ((143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 9 for generator 13. -/
def ep_Q2_002_partial_13_0009 : Poly :=
[
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 2), (11, 1), (13, 1)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem ep_Q2_002_partial_13_0009_valid :
    mulPoly ep_Q2_002_coefficient_13_0009
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0010 : Poly :=
[
  term ((-2763240069739064922841558500959663019168 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 10 for generator 13. -/
def ep_Q2_002_partial_13_0010 : Poly :=
[
  term ((-5526480139478129845683117001919326038336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-5526480139478129845683117001919326038336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((2763240069739064922841558500959663019168 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((2763240069739064922841558500959663019168 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem ep_Q2_002_partial_13_0010_valid :
    mulPoly ep_Q2_002_coefficient_13_0010
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0011 : Poly :=
[
  term ((45271166936 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 13. -/
def ep_Q2_002_partial_13_0011 : Poly :=
[
  term ((90542333872 : Rat) / 7401317245) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((90542333872 : Rat) / 7401317245) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem ep_Q2_002_partial_13_0011_valid :
    mulPoly ep_Q2_002_coefficient_13_0011
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0012 : Poly :=
[
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 12 for generator 13. -/
def ep_Q2_002_partial_13_0012 : Poly :=
[
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (6, 1), (11, 2)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (7, 1), (11, 2)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 2), (11, 2)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem ep_Q2_002_partial_13_0012_valid :
    mulPoly ep_Q2_002_coefficient_13_0012
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0013 : Poly :=
[
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (12, 1)]
]

/-- Partial product 13 for generator 13. -/
def ep_Q2_002_partial_13_0013 : Poly :=
[
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (4, 1), (6, 1), (12, 1)],
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (5, 1), (7, 1), (12, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (6, 2), (12, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem ep_Q2_002_partial_13_0013_valid :
    mulPoly ep_Q2_002_coefficient_13_0013
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0014 : Poly :=
[
  term ((-235609196089373560532772555232896 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 14 for generator 13. -/
def ep_Q2_002_partial_13_0014 : Poly :=
[
  term ((-471218392178747121065545110465792 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-471218392178747121065545110465792 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((235609196089373560532772555232896 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((235609196089373560532772555232896 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem ep_Q2_002_partial_13_0014_valid :
    mulPoly ep_Q2_002_coefficient_13_0014
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0015 : Poly :=
[
  term ((2095730561410048424414456150750513509818816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 15 for generator 13. -/
def ep_Q2_002_partial_13_0015 : Poly :=
[
  term ((4191461122820096848828912301501027019637632 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((4191461122820096848828912301501027019637632 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (7, 1), (15, 2)],
  term ((-2095730561410048424414456150750513509818816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 2), (15, 2)],
  term ((-2095730561410048424414456150750513509818816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem ep_Q2_002_partial_13_0015_valid :
    mulPoly ep_Q2_002_coefficient_13_0015
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0016 : Poly :=
[
  term ((-24048549192 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 13. -/
def ep_Q2_002_partial_13_0016 : Poly :=
[
  term ((-48097098384 : Rat) / 7401317245) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-48097098384 : Rat) / 7401317245) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((24048549192 : Rat) / 7401317245) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((24048549192 : Rat) / 7401317245) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem ep_Q2_002_partial_13_0016_valid :
    mulPoly ep_Q2_002_coefficient_13_0016
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0017 : Poly :=
[
  term ((2807134638676440300907776238160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1)]
]

/-- Partial product 17 for generator 13. -/
def ep_Q2_002_partial_13_0017 : Poly :=
[
  term ((5614269277352880601815552476320 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1)],
  term ((5614269277352880601815552476320 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((-2807134638676440300907776238160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 2)],
  term ((-2807134638676440300907776238160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem ep_Q2_002_partial_13_0017_valid :
    mulPoly ep_Q2_002_coefficient_13_0017
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0018 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 18 for generator 13. -/
def ep_Q2_002_partial_13_0018 : Poly :=
[
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (8, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 2), (8, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem ep_Q2_002_partial_13_0018_valid :
    mulPoly ep_Q2_002_coefficient_13_0018
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0019 : Poly :=
[
  term ((-220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 19 for generator 13. -/
def ep_Q2_002_partial_13_0019 : Poly :=
[
  term ((-441524184446328388600478033664 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1)],
  term ((-441524184446328388600478033664 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 2), (12, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem ep_Q2_002_partial_13_0019_valid :
    mulPoly ep_Q2_002_coefficient_13_0019
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0020 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1)]
]

/-- Partial product 20 for generator 13. -/
def ep_Q2_002_partial_13_0020 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 2)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (7, 2)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 2), (7, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem ep_Q2_002_partial_13_0020_valid :
    mulPoly ep_Q2_002_coefficient_13_0020
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0021 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 21 for generator 13. -/
def ep_Q2_002_partial_13_0021 : Poly :=
[
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (7, 2)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 2), (7, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 3)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem ep_Q2_002_partial_13_0021_valid :
    mulPoly ep_Q2_002_coefficient_13_0021
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0022 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 22 for generator 13. -/
def ep_Q2_002_partial_13_0022 : Poly :=
[
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 2), (9, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (9, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem ep_Q2_002_partial_13_0022_valid :
    mulPoly ep_Q2_002_coefficient_13_0022
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0023 : Poly :=
[
  term ((-100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 23 for generator 13. -/
def ep_Q2_002_partial_13_0023 : Poly :=
[
  term ((-201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 2), (11, 1)],
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (11, 1)],
  term ((-201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem ep_Q2_002_partial_13_0023_valid :
    mulPoly ep_Q2_002_coefficient_13_0023
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0024 : Poly :=
[
  term ((180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 24 for generator 13. -/
def ep_Q2_002_partial_13_0024 : Poly :=
[
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 2), (13, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (13, 1)],
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem ep_Q2_002_partial_13_0024_valid :
    mulPoly ep_Q2_002_coefficient_13_0024
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0025 : Poly :=
[
  term ((544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 25 for generator 13. -/
def ep_Q2_002_partial_13_0025 : Poly :=
[
  term ((1088715531992459796355141184206678602802368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 2), (15, 1)],
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (7, 2), (15, 1)],
  term ((1088715531992459796355141184206678602802368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 2), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem ep_Q2_002_partial_13_0025_valid :
    mulPoly ep_Q2_002_coefficient_13_0025
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0026 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 13. -/
def ep_Q2_002_partial_13_0026 : Poly :=
[
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem ep_Q2_002_partial_13_0026_valid :
    mulPoly ep_Q2_002_coefficient_13_0026
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0027 : Poly :=
[
  term ((2726367763864973725214149587280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

/-- Partial product 27 for generator 13. -/
def ep_Q2_002_partial_13_0027 : Poly :=
[
  term ((5452735527729947450428299174560 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (6, 1)],
  term ((-2726367763864973725214149587280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 2)],
  term ((-2726367763864973725214149587280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2)],
  term ((5452735527729947450428299174560 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem ep_Q2_002_partial_13_0027_valid :
    mulPoly ep_Q2_002_coefficient_13_0027
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0028 : Poly :=
[
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 28 for generator 13. -/
def ep_Q2_002_partial_13_0028 : Poly :=
[
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 2), (12, 1)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (12, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem ep_Q2_002_partial_13_0028_valid :
    mulPoly ep_Q2_002_coefficient_13_0028
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0029 : Poly :=
[
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 29 for generator 13. -/
def ep_Q2_002_partial_13_0029 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (7, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (7, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem ep_Q2_002_partial_13_0029_valid :
    mulPoly ep_Q2_002_coefficient_13_0029
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0030 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 30 for generator 13. -/
def ep_Q2_002_partial_13_0030 : Poly :=
[
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 13. -/
theorem ep_Q2_002_partial_13_0030_valid :
    mulPoly ep_Q2_002_coefficient_13_0030
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0031 : Poly :=
[
  term ((11279027448948878812198032523680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 31 for generator 13. -/
def ep_Q2_002_partial_13_0031 : Poly :=
[
  term ((22558054897897757624396065047360 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((22558054897897757624396065047360 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((-11279027448948878812198032523680 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (9, 1)],
  term ((-11279027448948878812198032523680 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 13. -/
theorem ep_Q2_002_partial_13_0031_valid :
    mulPoly ep_Q2_002_coefficient_13_0031
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0032 : Poly :=
[
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 32 for generator 13. -/
def ep_Q2_002_partial_13_0032 : Poly :=
[
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1), (12, 1)],
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (9, 1), (12, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 13. -/
theorem ep_Q2_002_partial_13_0032_valid :
    mulPoly ep_Q2_002_coefficient_13_0032
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0033 : Poly :=
[
  term ((15869243337716748860557867498392 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

/-- Partial product 33 for generator 13. -/
def ep_Q2_002_partial_13_0033 : Poly :=
[
  term ((31738486675433497721115734996784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((31738486675433497721115734996784 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((-15869243337716748860557867498392 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (11, 1)],
  term ((-15869243337716748860557867498392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 13. -/
theorem ep_Q2_002_partial_13_0033_valid :
    mulPoly ep_Q2_002_coefficient_13_0033
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0034 : Poly :=
[
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 34 for generator 13. -/
def ep_Q2_002_partial_13_0034 : Poly :=
[
  term ((-117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((-117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (11, 1), (12, 1)],
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 13. -/
theorem ep_Q2_002_partial_13_0034_valid :
    mulPoly ep_Q2_002_coefficient_13_0034
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0035 : Poly :=
[
  term ((113332133711418375782394593459136 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 35 for generator 13. -/
def ep_Q2_002_partial_13_0035 : Poly :=
[
  term ((226664267422836751564789186918272 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((226664267422836751564789186918272 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-113332133711418375782394593459136 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (12, 1), (13, 1)],
  term ((-113332133711418375782394593459136 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 13. -/
theorem ep_Q2_002_partial_13_0035_valid :
    mulPoly ep_Q2_002_coefficient_13_0035
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0036 : Poly :=
[
  term ((848010876839676573959217502304209257769536 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 36 for generator 13. -/
def ep_Q2_002_partial_13_0036 : Poly :=
[
  term ((1696021753679353147918435004608418515539072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((1696021753679353147918435004608418515539072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-848010876839676573959217502304209257769536 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((-848010876839676573959217502304209257769536 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 13. -/
theorem ep_Q2_002_partial_13_0036_valid :
    mulPoly ep_Q2_002_coefficient_13_0036
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0037 : Poly :=
[
  term ((61246522028 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 13. -/
def ep_Q2_002_partial_13_0037 : Poly :=
[
  term ((122493044056 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((122493044056 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 13. -/
theorem ep_Q2_002_partial_13_0037_valid :
    mulPoly ep_Q2_002_coefficient_13_0037
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0038 : Poly :=
[
  term ((-79604695922321791589856248146752 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 38 for generator 13. -/
def ep_Q2_002_partial_13_0038 : Poly :=
[
  term ((-159209391844643583179712496293504 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((-159209391844643583179712496293504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((79604695922321791589856248146752 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (13, 1)],
  term ((79604695922321791589856248146752 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 13. -/
theorem ep_Q2_002_partial_13_0038_valid :
    mulPoly ep_Q2_002_coefficient_13_0038
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0039 : Poly :=
[
  term ((-635856806647110431659777920544348393511048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)]
]

/-- Partial product 39 for generator 13. -/
def ep_Q2_002_partial_13_0039 : Poly :=
[
  term ((-1271713613294220863319555841088696787022096 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((-1271713613294220863319555841088696787022096 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((635856806647110431659777920544348393511048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 2), (15, 1)],
  term ((635856806647110431659777920544348393511048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 13. -/
theorem ep_Q2_002_partial_13_0039_valid :
    mulPoly ep_Q2_002_coefficient_13_0039
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0040 : Poly :=
[
  term ((-27107718384 : Rat) / 7401317245) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 13. -/
def ep_Q2_002_partial_13_0040 : Poly :=
[
  term ((-54215436768 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-54215436768 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((27107718384 : Rat) / 7401317245) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((27107718384 : Rat) / 7401317245) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 13. -/
theorem ep_Q2_002_partial_13_0040_valid :
    mulPoly ep_Q2_002_coefficient_13_0040
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0041 : Poly :=
[
  term ((-1122438445096774812330142161696 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 41 for generator 13. -/
def ep_Q2_002_partial_13_0041 : Poly :=
[
  term ((-2244876890193549624660284323392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1)],
  term ((-2244876890193549624660284323392 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1)],
  term ((1122438445096774812330142161696 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 2)],
  term ((1122438445096774812330142161696 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 13. -/
theorem ep_Q2_002_partial_13_0041_valid :
    mulPoly ep_Q2_002_coefficient_13_0041
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0042 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)]
]

/-- Partial product 42 for generator 13. -/
def ep_Q2_002_partial_13_0042 : Poly :=
[
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (5, 1), (7, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 2)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 13. -/
theorem ep_Q2_002_partial_13_0042_valid :
    mulPoly ep_Q2_002_coefficient_13_0042
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0043 : Poly :=
[
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 43 for generator 13. -/
def ep_Q2_002_partial_13_0043 : Poly :=
[
  term ((8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (12, 1)],
  term ((8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (12, 1)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 2), (12, 1)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 13. -/
theorem ep_Q2_002_partial_13_0043_valid :
    mulPoly ep_Q2_002_coefficient_13_0043
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0044 : Poly :=
[
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (7, 1)]
]

/-- Partial product 44 for generator 13. -/
def ep_Q2_002_partial_13_0044 : Poly :=
[
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (7, 2)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 2), (7, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 13. -/
theorem ep_Q2_002_partial_13_0044_valid :
    mulPoly ep_Q2_002_coefficient_13_0044
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0045 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 45 for generator 13. -/
def ep_Q2_002_partial_13_0045 : Poly :=
[
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 2), (8, 1), (11, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 13. -/
theorem ep_Q2_002_partial_13_0045_valid :
    mulPoly ep_Q2_002_coefficient_13_0045
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0046 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 46 for generator 13. -/
def ep_Q2_002_partial_13_0046 : Poly :=
[
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 2), (8, 1), (13, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 13. -/
theorem ep_Q2_002_partial_13_0046_valid :
    mulPoly ep_Q2_002_coefficient_13_0046
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0047 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 47 for generator 13. -/
def ep_Q2_002_partial_13_0047 : Poly :=
[
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 13. -/
theorem ep_Q2_002_partial_13_0047_valid :
    mulPoly ep_Q2_002_coefficient_13_0047
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0048 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 13. -/
def ep_Q2_002_partial_13_0048 : Poly :=
[
  term ((21084059056 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((21084059056 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 13. -/
theorem ep_Q2_002_partial_13_0048_valid :
    mulPoly ep_Q2_002_coefficient_13_0048
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0049 : Poly :=
[
  term ((-39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1)]
]

/-- Partial product 49 for generator 13. -/
def ep_Q2_002_partial_13_0049 : Poly :=
[
  term ((-79375582433919990598582347827640 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-79375582433919990598582347827640 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 2), (11, 1)],
  term ((39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 13. -/
theorem ep_Q2_002_partial_13_0049_valid :
    mulPoly ep_Q2_002_coefficient_13_0049
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0050 : Poly :=
[
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 50 for generator 13. -/
def ep_Q2_002_partial_13_0050 : Poly :=
[
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (7, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 13. -/
theorem ep_Q2_002_partial_13_0050_valid :
    mulPoly ep_Q2_002_coefficient_13_0050
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0051 : Poly :=
[
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 51 for generator 13. -/
def ep_Q2_002_partial_13_0051 : Poly :=
[
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 2), (12, 1), (13, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 13. -/
theorem ep_Q2_002_partial_13_0051_valid :
    mulPoly ep_Q2_002_coefficient_13_0051
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0052 : Poly :=
[
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 52 for generator 13. -/
def ep_Q2_002_partial_13_0052 : Poly :=
[
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 13. -/
theorem ep_Q2_002_partial_13_0052_valid :
    mulPoly ep_Q2_002_coefficient_13_0052
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0053 : Poly :=
[
  term ((-37861474304 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 13. -/
def ep_Q2_002_partial_13_0053 : Poly :=
[
  term ((-75722948608 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75722948608 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 13. -/
theorem ep_Q2_002_partial_13_0053_valid :
    mulPoly ep_Q2_002_coefficient_13_0053
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0054 : Poly :=
[
  term ((74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1)]
]

/-- Partial product 54 for generator 13. -/
def ep_Q2_002_partial_13_0054 : Poly :=
[
  term ((149479086531393230675728096262880 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((149479086531393230675728096262880 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 2), (13, 1)],
  term ((-74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 13. -/
theorem ep_Q2_002_partial_13_0054_valid :
    mulPoly ep_Q2_002_coefficient_13_0054
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0055 : Poly :=
[
  term ((-1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 1)]
]

/-- Partial product 55 for generator 13. -/
def ep_Q2_002_partial_13_0055 : Poly :=
[
  term ((-2216386721525246256067896947494769494733276 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-2216386721525246256067896947494769494733276 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 2), (15, 1)],
  term ((1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 13. -/
theorem ep_Q2_002_partial_13_0055_valid :
    mulPoly ep_Q2_002_coefficient_13_0055
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0056 : Poly :=
[
  term ((-38687265959 : Rat) / 44407903470) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 13. -/
def ep_Q2_002_partial_13_0056 : Poly :=
[
  term ((-38687265959 : Rat) / 22203951735) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-38687265959 : Rat) / 22203951735) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((38687265959 : Rat) / 44407903470) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((38687265959 : Rat) / 44407903470) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 13. -/
theorem ep_Q2_002_partial_13_0056_valid :
    mulPoly ep_Q2_002_coefficient_13_0056
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0057 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 57 for generator 13. -/
def ep_Q2_002_partial_13_0057 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 2), (11, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (7, 2), (11, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 2), (7, 1), (11, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(4, 2), (5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 13. -/
theorem ep_Q2_002_partial_13_0057_valid :
    mulPoly ep_Q2_002_coefficient_13_0057
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0058 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 58 for generator 13. -/
def ep_Q2_002_partial_13_0058 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 2), (13, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 2), (7, 1), (13, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(4, 2), (5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 13. -/
theorem ep_Q2_002_partial_13_0058_valid :
    mulPoly ep_Q2_002_coefficient_13_0058
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0059 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 59 for generator 13. -/
def ep_Q2_002_partial_13_0059 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 2), (15, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 2), (7, 1), (15, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 13. -/
theorem ep_Q2_002_partial_13_0059_valid :
    mulPoly ep_Q2_002_coefficient_13_0059
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0060 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 13. -/
def ep_Q2_002_partial_13_0060 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(4, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 13. -/
theorem ep_Q2_002_partial_13_0060_valid :
    mulPoly ep_Q2_002_coefficient_13_0060
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0061 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 61 for generator 13. -/
def ep_Q2_002_partial_13_0061 : Poly :=
[
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 2), (11, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (7, 1), (11, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 3), (11, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 13. -/
theorem ep_Q2_002_partial_13_0061_valid :
    mulPoly ep_Q2_002_coefficient_13_0061
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0062 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 62 for generator 13. -/
def ep_Q2_002_partial_13_0062 : Poly :=
[
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 3), (13, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 13. -/
theorem ep_Q2_002_partial_13_0062_valid :
    mulPoly ep_Q2_002_coefficient_13_0062
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0063 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 63 for generator 13. -/
def ep_Q2_002_partial_13_0063 : Poly :=
[
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (7, 1), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 3), (15, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 13. -/
theorem ep_Q2_002_partial_13_0063_valid :
    mulPoly ep_Q2_002_coefficient_13_0063
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0064 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 13. -/
def ep_Q2_002_partial_13_0064 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(4, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 13. -/
theorem ep_Q2_002_partial_13_0064_valid :
    mulPoly ep_Q2_002_coefficient_13_0064
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0065 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 65 for generator 13. -/
def ep_Q2_002_partial_13_0065 : Poly :=
[
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (9, 1), (11, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 13. -/
theorem ep_Q2_002_partial_13_0065_valid :
    mulPoly ep_Q2_002_coefficient_13_0065
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0066 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 66 for generator 13. -/
def ep_Q2_002_partial_13_0066 : Poly :=
[
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 13. -/
theorem ep_Q2_002_partial_13_0066_valid :
    mulPoly ep_Q2_002_coefficient_13_0066
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0067 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 67 for generator 13. -/
def ep_Q2_002_partial_13_0067 : Poly :=
[
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 13. -/
theorem ep_Q2_002_partial_13_0067_valid :
    mulPoly ep_Q2_002_coefficient_13_0067
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0068 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 13. -/
def ep_Q2_002_partial_13_0068 : Poly :=
[
  term ((-195028145136 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(4, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 13. -/
theorem ep_Q2_002_partial_13_0068_valid :
    mulPoly ep_Q2_002_coefficient_13_0068
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0069 : Poly :=
[
  term ((-30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 69 for generator 13. -/
def ep_Q2_002_partial_13_0069 : Poly :=
[
  term ((-60063891619813708566081797671968 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-60063891619813708566081797671968 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 13. -/
theorem ep_Q2_002_partial_13_0069_valid :
    mulPoly ep_Q2_002_coefficient_13_0069
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0070 : Poly :=
[
  term ((-44438865622751439465234820140196057288176 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 70 for generator 13. -/
def ep_Q2_002_partial_13_0070 : Poly :=
[
  term ((-88877731245502878930469640280392114576352 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((44438865622751439465234820140196057288176 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((44438865622751439465234820140196057288176 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-88877731245502878930469640280392114576352 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 13. -/
theorem ep_Q2_002_partial_13_0070_valid :
    mulPoly ep_Q2_002_coefficient_13_0070
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0071 : Poly :=
[
  term ((-7555141124 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 13. -/
def ep_Q2_002_partial_13_0071 : Poly :=
[
  term ((-15110282248 : Rat) / 1480263449) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 13. -/
theorem ep_Q2_002_partial_13_0071_valid :
    mulPoly ep_Q2_002_coefficient_13_0071
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0072 : Poly :=
[
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 72 for generator 13. -/
def ep_Q2_002_partial_13_0072 : Poly :=
[
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (11, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (11, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (11, 2)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 13. -/
theorem ep_Q2_002_partial_13_0072_valid :
    mulPoly ep_Q2_002_coefficient_13_0072
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0073 : Poly :=
[
  term ((-1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 73 for generator 13. -/
def ep_Q2_002_partial_13_0073 : Poly :=
[
  term ((-2376406475382967311677577214749255393732288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-2376406475382967311677577214749255393732288 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 13. -/
theorem ep_Q2_002_partial_13_0073_valid :
    mulPoly ep_Q2_002_coefficient_13_0073
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0074 : Poly :=
[
  term ((-56063165212 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 13. -/
def ep_Q2_002_partial_13_0074 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 13. -/
theorem ep_Q2_002_partial_13_0074_valid :
    mulPoly ep_Q2_002_coefficient_13_0074
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0075 : Poly :=
[
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 75 for generator 13. -/
def ep_Q2_002_partial_13_0075 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (13, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (13, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (13, 2)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 13. -/
theorem ep_Q2_002_partial_13_0075_valid :
    mulPoly ep_Q2_002_coefficient_13_0075
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0076 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 2)]
]

/-- Partial product 76 for generator 13. -/
def ep_Q2_002_partial_13_0076 : Poly :=
[
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (15, 2)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (15, 2)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 13. -/
theorem ep_Q2_002_partial_13_0076_valid :
    mulPoly ep_Q2_002_coefficient_13_0076
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0077 : Poly :=
[
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 13. -/
def ep_Q2_002_partial_13_0077 : Poly :=
[
  term ((-300100471816 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-300100471816 : Rat) / 7401317245) [(4, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 13. -/
theorem ep_Q2_002_partial_13_0077_valid :
    mulPoly ep_Q2_002_coefficient_13_0077
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0078 : Poly :=
[
  term ((-38545894130657359098346581612060 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

/-- Partial product 78 for generator 13. -/
def ep_Q2_002_partial_13_0078 : Poly :=
[
  term ((-77091788261314718196693163224120 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((38545894130657359098346581612060 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (11, 1)],
  term ((38545894130657359098346581612060 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1)],
  term ((-77091788261314718196693163224120 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 13. -/
theorem ep_Q2_002_partial_13_0078_valid :
    mulPoly ep_Q2_002_coefficient_13_0078
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0079 : Poly :=
[
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 79 for generator 13. -/
def ep_Q2_002_partial_13_0079 : Poly :=
[
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 13. -/
theorem ep_Q2_002_partial_13_0079_valid :
    mulPoly ep_Q2_002_coefficient_13_0079
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0080 : Poly :=
[
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 80 for generator 13. -/
def ep_Q2_002_partial_13_0080 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 13. -/
theorem ep_Q2_002_partial_13_0080_valid :
    mulPoly ep_Q2_002_coefficient_13_0080
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0081 : Poly :=
[
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 81 for generator 13. -/
def ep_Q2_002_partial_13_0081 : Poly :=
[
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 13. -/
theorem ep_Q2_002_partial_13_0081_valid :
    mulPoly ep_Q2_002_coefficient_13_0081
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0082 : Poly :=
[
  term ((-56063165212 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 13. -/
def ep_Q2_002_partial_13_0082 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 13. -/
theorem ep_Q2_002_partial_13_0082_valid :
    mulPoly ep_Q2_002_coefficient_13_0082
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0083 : Poly :=
[
  term ((72589137207064208916549742289520 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

/-- Partial product 83 for generator 13. -/
def ep_Q2_002_partial_13_0083 : Poly :=
[
  term ((145178274414128417833099484579040 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-72589137207064208916549742289520 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (13, 1)],
  term ((-72589137207064208916549742289520 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1)],
  term ((145178274414128417833099484579040 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 13. -/
theorem ep_Q2_002_partial_13_0083_valid :
    mulPoly ep_Q2_002_coefficient_13_0083
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0084 : Poly :=
[
  term ((890414598266630128700581986811531374605154 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 1)]
]

/-- Partial product 84 for generator 13. -/
def ep_Q2_002_partial_13_0084 : Poly :=
[
  term ((1780829196533260257401163973623062749210308 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-890414598266630128700581986811531374605154 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 2), (15, 1)],
  term ((-890414598266630128700581986811531374605154 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (15, 1)],
  term ((1780829196533260257401163973623062749210308 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 13. -/
theorem ep_Q2_002_partial_13_0084_valid :
    mulPoly ep_Q2_002_coefficient_13_0084
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0085 : Poly :=
[
  term ((295801971337 : Rat) / 44407903470) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 13. -/
def ep_Q2_002_partial_13_0085 : Poly :=
[
  term ((295801971337 : Rat) / 22203951735) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-295801971337 : Rat) / 44407903470) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-295801971337 : Rat) / 44407903470) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((295801971337 : Rat) / 22203951735) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 13. -/
theorem ep_Q2_002_partial_13_0085_valid :
    mulPoly ep_Q2_002_coefficient_13_0085
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0086 : Poly :=
[
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(6, 1)]
]

/-- Partial product 86 for generator 13. -/
def ep_Q2_002_partial_13_0086 : Poly :=
[
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(4, 1), (6, 2)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(5, 1), (6, 1), (7, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(6, 1), (7, 2)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 13. -/
theorem ep_Q2_002_partial_13_0086_valid :
    mulPoly ep_Q2_002_coefficient_13_0086
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0087 : Poly :=
[
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 87 for generator 13. -/
def ep_Q2_002_partial_13_0087 : Poly :=
[
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (7, 2), (11, 1), (15, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 13. -/
theorem ep_Q2_002_partial_13_0087_valid :
    mulPoly ep_Q2_002_coefficient_13_0087
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0088 : Poly :=
[
  term ((12548443744 : Rat) / 7401317245) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 13. -/
def ep_Q2_002_partial_13_0088 : Poly :=
[
  term ((25096887488 : Rat) / 7401317245) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((25096887488 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(6, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 13. -/
theorem ep_Q2_002_partial_13_0088_valid :
    mulPoly ep_Q2_002_coefficient_13_0088
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0089 : Poly :=
[
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 89 for generator 13. -/
def ep_Q2_002_partial_13_0089 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 2), (7, 1), (11, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 13. -/
theorem ep_Q2_002_partial_13_0089_valid :
    mulPoly ep_Q2_002_coefficient_13_0089
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0090 : Poly :=
[
  term ((186435468927985632048188047458864 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 90 for generator 13. -/
def ep_Q2_002_partial_13_0090 : Poly :=
[
  term ((372870937855971264096376094917728 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((372870937855971264096376094917728 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1)],
  term ((-186435468927985632048188047458864 : Rat) / 1273790490336191187829975377157) [(6, 2), (7, 1), (13, 1)],
  term ((-186435468927985632048188047458864 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 13. -/
theorem ep_Q2_002_partial_13_0090_valid :
    mulPoly ep_Q2_002_coefficient_13_0090
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0091 : Poly :=
[
  term ((-567794666480671759046486489752554657872658 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 91 for generator 13. -/
def ep_Q2_002_partial_13_0091 : Poly :=
[
  term ((-1135589332961343518092972979505109315745316 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-1135589332961343518092972979505109315745316 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (15, 1)],
  term ((567794666480671759046486489752554657872658 : Rat) / 1346818217520322526586147269553926167495) [(6, 2), (7, 1), (15, 1)],
  term ((567794666480671759046486489752554657872658 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 13. -/
theorem ep_Q2_002_partial_13_0091_valid :
    mulPoly ep_Q2_002_coefficient_13_0091
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0092 : Poly :=
[
  term ((100719688757 : Rat) / 14802634490) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 13. -/
def ep_Q2_002_partial_13_0092 : Poly :=
[
  term ((100719688757 : Rat) / 7401317245) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((100719688757 : Rat) / 7401317245) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-100719688757 : Rat) / 14802634490) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-100719688757 : Rat) / 14802634490) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 13. -/
theorem ep_Q2_002_partial_13_0092_valid :
    mulPoly ep_Q2_002_coefficient_13_0092
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0093 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 93 for generator 13. -/
def ep_Q2_002_partial_13_0093 : Poly :=
[
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 13. -/
theorem ep_Q2_002_partial_13_0093_valid :
    mulPoly ep_Q2_002_coefficient_13_0093
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0094 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 94 for generator 13. -/
def ep_Q2_002_partial_13_0094 : Poly :=
[
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 13. -/
theorem ep_Q2_002_partial_13_0094_valid :
    mulPoly ep_Q2_002_coefficient_13_0094
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0095 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 95 for generator 13. -/
def ep_Q2_002_partial_13_0095 : Poly :=
[
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 2), (8, 1), (15, 2)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 13. -/
theorem ep_Q2_002_partial_13_0095_valid :
    mulPoly ep_Q2_002_coefficient_13_0095
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0096 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 96 for generator 13. -/
def ep_Q2_002_partial_13_0096 : Poly :=
[
  term ((21084059056 : Rat) / 7401317245) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((21084059056 : Rat) / 7401317245) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(7, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 13. -/
theorem ep_Q2_002_partial_13_0096_valid :
    mulPoly ep_Q2_002_coefficient_13_0096
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0097 : Poly :=
[
  term ((-159464986237819160497425290922360 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 97 for generator 13. -/
def ep_Q2_002_partial_13_0097 : Poly :=
[
  term ((-318929972475638320994850581844720 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-318929972475638320994850581844720 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((159464986237819160497425290922360 : Rat) / 1273790490336191187829975377157) [(6, 2), (9, 1), (11, 1)],
  term ((159464986237819160497425290922360 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 13. -/
theorem ep_Q2_002_partial_13_0097_valid :
    mulPoly ep_Q2_002_coefficient_13_0097
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0098 : Poly :=
[
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 98 for generator 13. -/
def ep_Q2_002_partial_13_0098 : Poly :=
[
  term ((117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 13. -/
theorem ep_Q2_002_partial_13_0098_valid :
    mulPoly ep_Q2_002_coefficient_13_0098
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 13. -/
def ep_Q2_002_coefficient_13_0099 : Poly :=
[
  term ((-111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 99 for generator 13. -/
def ep_Q2_002_partial_13_0099 : Poly :=
[
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 13. -/
theorem ep_Q2_002_partial_13_0099_valid :
    mulPoly ep_Q2_002_coefficient_13_0099
        ep_Q2_002_generator_13_0000_0099 =
      ep_Q2_002_partial_13_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_13_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_13_0000,
  ep_Q2_002_partial_13_0001,
  ep_Q2_002_partial_13_0002,
  ep_Q2_002_partial_13_0003,
  ep_Q2_002_partial_13_0004,
  ep_Q2_002_partial_13_0005,
  ep_Q2_002_partial_13_0006,
  ep_Q2_002_partial_13_0007,
  ep_Q2_002_partial_13_0008,
  ep_Q2_002_partial_13_0009,
  ep_Q2_002_partial_13_0010,
  ep_Q2_002_partial_13_0011,
  ep_Q2_002_partial_13_0012,
  ep_Q2_002_partial_13_0013,
  ep_Q2_002_partial_13_0014,
  ep_Q2_002_partial_13_0015,
  ep_Q2_002_partial_13_0016,
  ep_Q2_002_partial_13_0017,
  ep_Q2_002_partial_13_0018,
  ep_Q2_002_partial_13_0019,
  ep_Q2_002_partial_13_0020,
  ep_Q2_002_partial_13_0021,
  ep_Q2_002_partial_13_0022,
  ep_Q2_002_partial_13_0023,
  ep_Q2_002_partial_13_0024,
  ep_Q2_002_partial_13_0025,
  ep_Q2_002_partial_13_0026,
  ep_Q2_002_partial_13_0027,
  ep_Q2_002_partial_13_0028,
  ep_Q2_002_partial_13_0029,
  ep_Q2_002_partial_13_0030,
  ep_Q2_002_partial_13_0031,
  ep_Q2_002_partial_13_0032,
  ep_Q2_002_partial_13_0033,
  ep_Q2_002_partial_13_0034,
  ep_Q2_002_partial_13_0035,
  ep_Q2_002_partial_13_0036,
  ep_Q2_002_partial_13_0037,
  ep_Q2_002_partial_13_0038,
  ep_Q2_002_partial_13_0039,
  ep_Q2_002_partial_13_0040,
  ep_Q2_002_partial_13_0041,
  ep_Q2_002_partial_13_0042,
  ep_Q2_002_partial_13_0043,
  ep_Q2_002_partial_13_0044,
  ep_Q2_002_partial_13_0045,
  ep_Q2_002_partial_13_0046,
  ep_Q2_002_partial_13_0047,
  ep_Q2_002_partial_13_0048,
  ep_Q2_002_partial_13_0049,
  ep_Q2_002_partial_13_0050,
  ep_Q2_002_partial_13_0051,
  ep_Q2_002_partial_13_0052,
  ep_Q2_002_partial_13_0053,
  ep_Q2_002_partial_13_0054,
  ep_Q2_002_partial_13_0055,
  ep_Q2_002_partial_13_0056,
  ep_Q2_002_partial_13_0057,
  ep_Q2_002_partial_13_0058,
  ep_Q2_002_partial_13_0059,
  ep_Q2_002_partial_13_0060,
  ep_Q2_002_partial_13_0061,
  ep_Q2_002_partial_13_0062,
  ep_Q2_002_partial_13_0063,
  ep_Q2_002_partial_13_0064,
  ep_Q2_002_partial_13_0065,
  ep_Q2_002_partial_13_0066,
  ep_Q2_002_partial_13_0067,
  ep_Q2_002_partial_13_0068,
  ep_Q2_002_partial_13_0069,
  ep_Q2_002_partial_13_0070,
  ep_Q2_002_partial_13_0071,
  ep_Q2_002_partial_13_0072,
  ep_Q2_002_partial_13_0073,
  ep_Q2_002_partial_13_0074,
  ep_Q2_002_partial_13_0075,
  ep_Q2_002_partial_13_0076,
  ep_Q2_002_partial_13_0077,
  ep_Q2_002_partial_13_0078,
  ep_Q2_002_partial_13_0079,
  ep_Q2_002_partial_13_0080,
  ep_Q2_002_partial_13_0081,
  ep_Q2_002_partial_13_0082,
  ep_Q2_002_partial_13_0083,
  ep_Q2_002_partial_13_0084,
  ep_Q2_002_partial_13_0085,
  ep_Q2_002_partial_13_0086,
  ep_Q2_002_partial_13_0087,
  ep_Q2_002_partial_13_0088,
  ep_Q2_002_partial_13_0089,
  ep_Q2_002_partial_13_0090,
  ep_Q2_002_partial_13_0091,
  ep_Q2_002_partial_13_0092,
  ep_Q2_002_partial_13_0093,
  ep_Q2_002_partial_13_0094,
  ep_Q2_002_partial_13_0095,
  ep_Q2_002_partial_13_0096,
  ep_Q2_002_partial_13_0097,
  ep_Q2_002_partial_13_0098,
  ep_Q2_002_partial_13_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_13_0000_0099 : Poly :=
[
  term ((-14126479018038028174552433273088 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (4, 1), (6, 1)],
  term ((-14126479018038028174552433273088 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1)],
  term ((7063239509019014087276216636544 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (6, 2)],
  term ((7063239509019014087276216636544 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (7, 2)],
  term ((10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (6, 1), (11, 1)],
  term ((-17698441992934908736439757727488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (6, 1), (15, 1)],
  term ((10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1)],
  term ((-17698441992934908736439757727488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 2), (11, 1)],
  term ((8849220996467454368219878863744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 2), (11, 1)],
  term ((8849220996467454368219878863744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((199722785709703024343930187946176 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-376115407937262261233975700456192 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1)],
  term ((213016565346823382253626761918324192132416 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-20101094144 : Rat) / 1480263449) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((199722785709703024343930187946176 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-376115407937262261233975700456192 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((213016565346823382253626761918324192132416 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-20101094144 : Rat) / 1480263449) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-99861392854851512171965093973088 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((188057703968631130616987850228096 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((-106508282673411691126813380959162096066208 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((10050547072 : Rat) / 1480263449) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-99861392854851512171965093973088 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((188057703968631130616987850228096 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((-106508282673411691126813380959162096066208 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((10050547072 : Rat) / 1480263449) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (4, 1), (6, 1)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-5526480139478129845683117001919326038336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((90542333872 : Rat) / 7401317245) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (6, 1), (11, 2)],
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (4, 1), (6, 1), (12, 1)],
  term ((-471218392178747121065545110465792 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((4191461122820096848828912301501027019637632 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((-48097098384 : Rat) / 7401317245) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (5, 1), (7, 1)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-5526480139478129845683117001919326038336 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((90542333872 : Rat) / 7401317245) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (7, 1), (11, 2)],
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (5, 1), (7, 1), (12, 1)],
  term ((-471218392178747121065545110465792 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((4191461122820096848828912301501027019637632 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (7, 1), (15, 2)],
  term ((-48097098384 : Rat) / 7401317245) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (6, 2)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 2), (11, 1), (13, 1)],
  term ((2763240069739064922841558500959663019168 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 2), (11, 2)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (6, 2), (12, 1)],
  term ((235609196089373560532772555232896 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-2095730561410048424414456150750513509818816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 2), (15, 2)],
  term ((24048549192 : Rat) / 7401317245) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (7, 2)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((2763240069739064922841558500959663019168 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 2), (11, 2)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (7, 2), (12, 1)],
  term ((235609196089373560532772555232896 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-2095730561410048424414456150750513509818816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 2), (15, 2)],
  term ((24048549192 : Rat) / 7401317245) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((5614269277352880601815552476320 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (8, 1)],
  term ((-441524184446328388600478033664 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1)],
  term ((5614269277352880601815552476320 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1)],
  term ((-441524184446328388600478033664 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1)],
  term ((-2807134638676440300907776238160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 2), (8, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 2), (12, 1)],
  term ((-2807134638676440300907776238160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (8, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (7, 2), (12, 1)],
  term ((5452735527729947450428299174560 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (6, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 2)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1)],
  term ((-201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((1088715531992459796355141184206678602802368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-22366354031679638803498676134560 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (7, 2)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 2), (7, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (7, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((22558054897897757624396065047360 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1), (12, 1)],
  term ((31738486675433497721115734996784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((-117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((226664267422836751564789186918272 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((1696021753679353147918435004608418515539072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((122493044056 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-159209391844643583179712496293504 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((-1271713613294220863319555841088696787022096 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((-54215436768 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 2), (7, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 2), (9, 1)],
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 2), (11, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 2), (13, 1)],
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 2), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (9, 1)],
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (11, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (13, 1)],
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (7, 2), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 3)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (5, 1), (6, 1)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (7, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (9, 1)],
  term ((-201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (11, 1)],
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (13, 1)],
  term ((1088715531992459796355141184206678602802368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 2), (6, 1), (15, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-2726367763864973725214149587280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 2)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 2), (12, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((22558054897897757624396065047360 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1)],
  term ((31738486675433497721115734996784 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((-117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((226664267422836751564789186918272 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((1696021753679353147918435004608418515539072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((122493044056 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-159209391844643583179712496293504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-1271713613294220863319555841088696787022096 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-54215436768 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((1062003713466399099186423706672 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (12, 1)],
  term ((5452735527729947450428299174560 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (7, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (7, 1), (12, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (7, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((-11279027448948878812198032523680 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (9, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (9, 1), (12, 1)],
  term ((-15869243337716748860557867498392 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (11, 1)],
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (11, 1), (12, 1)],
  term ((-113332133711418375782394593459136 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (12, 1), (13, 1)],
  term ((-848010876839676573959217502304209257769536 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((79604695922321791589856248146752 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (13, 1)],
  term ((635856806647110431659777920544348393511048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 2), (15, 1)],
  term ((27107718384 : Rat) / 7401317245) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((-11279027448948878812198032523680 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((-15869243337716748860557867498392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1)],
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term ((-113332133711418375782394593459136 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-848010876839676573959217502304209257769536 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((79604695922321791589856248146752 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (13, 1)],
  term ((635856806647110431659777920544348393511048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (15, 1)],
  term ((27107718384 : Rat) / 7401317245) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (5, 1), (7, 1)],
  term ((-2244876890193549624660284323392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1)],
  term ((8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (12, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 2)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2), (6, 1)],
  term ((-2244876890193549624660284323392 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1)],
  term ((8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (12, 1)],
  term ((1122438445096774812330142161696 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 2)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 2), (12, 1)],
  term ((1122438445096774812330142161696 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2), (12, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((21084059056 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-79375582433919990598582347827640 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((-75722948608 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((149479086531393230675728096262880 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-2216386721525246256067896947494769494733276 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-38687265959 : Rat) / 22203951735) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((21084059056 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-79375582433919990598582347827640 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-75722948608 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((149479086531393230675728096262880 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-2216386721525246256067896947494769494733276 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-38687265959 : Rat) / 22203951735) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (7, 2)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 2), (7, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 2), (8, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 2), (8, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 2), (11, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 2), (12, 1), (13, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 2), (13, 1)],
  term ((1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 2), (15, 1)],
  term ((38687265959 : Rat) / 44407903470) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (8, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (8, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (7, 2), (11, 1), (12, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (7, 2), (12, 1), (13, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1)],
  term ((1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 1)],
  term ((38687265959 : Rat) / 44407903470) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (7, 3)],
  term ((-77091788261314718196693163224120 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((145178274414128417833099484579040 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((1780829196533260257401163973623062749210308 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((295801971337 : Rat) / 22203951735) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 2), (11, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 2), (13, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 2), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-60063891619813708566081797671968 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-88877731245502878930469640280392114576352 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (11, 2)],
  term ((-2376406475382967311677577214749255393732288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 1), (13, 2)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((-300100471816 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((316219670002165824379321917144120 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 2), (11, 1)],
  term ((-595500857641366723397776205219040 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((8142415539311691650675762711236366319274732 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((14552827561 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 2), (7, 1), (11, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 2), (7, 1), (13, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 2), (7, 1), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-7421491014476506720248 : Rat) / 253528477699481291099) [(4, 1), (6, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((372870937855971264096376094917728 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-1135589332961343518092972979505109315745316 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((100719688757 : Rat) / 7401317245) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((21084059056 : Rat) / 7401317245) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-318929972475638320994850581844720 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(4, 1), (6, 2)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (7, 1), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (7, 1), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (9, 1), (11, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((1161708886267059371914772515423791103498416 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((62872593108 : Rat) / 7401317245) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (11, 2)],
  term ((1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 2), (13, 2)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 2), (15, 2)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(4, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((44438865622751439465234820140196057288176 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (11, 2)],
  term ((1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (13, 2)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (15, 2)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 3), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 3), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 3), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(4, 2), (5, 1), (6, 1), (11, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(4, 2), (5, 1), (6, 1), (13, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (5, 1), (6, 1), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(4, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(4, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-60063891619813708566081797671968 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((-88877731245502878930469640280392114576352 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (11, 2)],
  term ((-2376406475382967311677577214749255393732288 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (13, 2)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (6, 1), (15, 2)],
  term ((-300100471816 : Rat) / 7401317245) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(5, 1), (6, 1), (7, 1)],
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((25096887488 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((38545894130657359098346581612060 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (11, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-72589137207064208916549742289520 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (13, 1)],
  term ((-890414598266630128700581986811531374605154 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 2), (15, 1)],
  term ((-295801971337 : Rat) / 44407903470) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-7421491014476506720248 : Rat) / 253528477699481291099) [(5, 1), (7, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((21084059056 : Rat) / 7401317245) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-318929972475638320994850581844720 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-15014805870360263728675643075844 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((27298345513537005016347850238928 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (13, 1)],
  term ((-36836435113235884487155544842120739824554 : Rat) / 24487603954914955028839041264616839409) [(5, 1), (7, 2), (15, 1)],
  term ((8814747463 : Rat) / 1268797242) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-77091788261314718196693163224120 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (11, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((145178274414128417833099484579040 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (13, 1)],
  term ((1780829196533260257401163973623062749210308 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (7, 1), (15, 1)],
  term ((295801971337 : Rat) / 22203951735) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(6, 1), (7, 2)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (7, 2), (11, 1), (15, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((3710745507238253360124 : Rat) / 253528477699481291099) [(6, 2)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 2), (7, 1), (11, 1)],
  term ((-186435468927985632048188047458864 : Rat) / 1273790490336191187829975377157) [(6, 2), (7, 1), (13, 1)],
  term ((567794666480671759046486489752554657872658 : Rat) / 1346818217520322526586147269553926167495) [(6, 2), (7, 1), (15, 1)],
  term ((-100719688757 : Rat) / 14802634490) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 2), (8, 1), (15, 2)],
  term ((-10542029528 : Rat) / 7401317245) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((159464986237819160497425290922360 : Rat) / 1273790490336191187829975377157) [(6, 2), (9, 1), (11, 1)],
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(6, 3)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 3), (11, 1), (15, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(6, 3), (11, 1), (15, 1), (16, 1)],
  term ((3710745507238253360124 : Rat) / 253528477699481291099) [(7, 2)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (8, 1), (15, 2)],
  term ((-10542029528 : Rat) / 7401317245) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((159464986237819160497425290922360 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)],
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)],
  term ((-186435468927985632048188047458864 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)],
  term ((567794666480671759046486489752554657872658 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)],
  term ((-100719688757 : Rat) / 14802634490) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 99. -/
theorem ep_Q2_002_block_13_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_13_0000_0099
      ep_Q2_002_block_13_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
