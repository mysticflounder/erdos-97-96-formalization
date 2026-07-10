/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 12:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 12 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_12_0000_0099 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0000 : Poly :=
[
  term ((3710745507238253360124 : Rat) / 253528477699481291099) []
]

/-- Partial product 0 for generator 12. -/
def ep_Q2_002_partial_12_0000 : Poly :=
[
  term ((7421491014476506720248 : Rat) / 253528477699481291099) [(2, 1), (4, 1)],
  term ((-3710745507238253360124 : Rat) / 253528477699481291099) [(2, 2)],
  term ((7421491014476506720248 : Rat) / 253528477699481291099) [(3, 1), (5, 1)],
  term ((-3710745507238253360124 : Rat) / 253528477699481291099) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem ep_Q2_002_partial_12_0000_valid :
    mulPoly ep_Q2_002_coefficient_12_0000
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0001 : Poly :=
[
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1)]
]

/-- Partial product 1 for generator 12. -/
def ep_Q2_002_partial_12_0001 : Poly :=
[
  term ((-22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (4, 1)],
  term ((11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (2, 2)],
  term ((-22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (3, 1), (5, 1)],
  term ((11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem ep_Q2_002_partial_12_0001_valid :
    mulPoly ep_Q2_002_coefficient_12_0001
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0002 : Poly :=
[
  term ((8859112694327412817808137792256 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 12. -/
def ep_Q2_002_partial_12_0002 : Poly :=
[
  term ((17718225388654825635616275584512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (3, 1), (4, 1)],
  term ((-8859112694327412817808137792256 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((17718225388654825635616275584512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1)],
  term ((-8859112694327412817808137792256 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem ep_Q2_002_partial_12_0002_valid :
    mulPoly ep_Q2_002_coefficient_12_0002
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0003 : Poly :=
[
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (12, 1)]
]

/-- Partial product 3 for generator 12. -/
def ep_Q2_002_partial_12_0003 : Poly :=
[
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (3, 1), (4, 1), (12, 1)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (3, 1), (12, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1), (12, 1)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem ep_Q2_002_partial_12_0003_valid :
    mulPoly ep_Q2_002_coefficient_12_0003
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0004 : Poly :=
[
  term ((-1609609831710187017060982041024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 4 for generator 12. -/
def ep_Q2_002_partial_12_0004 : Poly :=
[
  term ((-3219219663420374034121964082048 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (7, 1)],
  term ((1609609831710187017060982041024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-3219219663420374034121964082048 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1)],
  term ((1609609831710187017060982041024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem ep_Q2_002_partial_12_0004_valid :
    mulPoly ep_Q2_002_coefficient_12_0004
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0005 : Poly :=
[
  term ((-325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 5 for generator 12. -/
def ep_Q2_002_partial_12_0005 : Poly :=
[
  term ((-650985607840403286133370105856 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (2, 1), (4, 1), (9, 1)],
  term ((325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-650985607840403286133370105856 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1)],
  term ((325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (3, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem ep_Q2_002_partial_12_0005_valid :
    mulPoly ep_Q2_002_coefficient_12_0005
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0006 : Poly :=
[
  term ((-36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 6 for generator 12. -/
def ep_Q2_002_partial_12_0006 : Poly :=
[
  term ((-73270918151764402578708334477728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((-73270918151764402578708334477728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem ep_Q2_002_partial_12_0006_valid :
    mulPoly ep_Q2_002_coefficient_12_0006
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0007 : Poly :=
[
  term ((-1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 1), (15, 1)]
]

/-- Partial product 7 for generator 12. -/
def ep_Q2_002_partial_12_0007 : Poly :=
[
  term ((-3571962974896880561887324454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-3571962974896880561887324454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem ep_Q2_002_partial_12_0007_valid :
    mulPoly ep_Q2_002_coefficient_12_0007
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0008 : Poly :=
[
  term ((57298280748314818882467880046592 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 8 for generator 12. -/
def ep_Q2_002_partial_12_0008 : Poly :=
[
  term ((114596561496629637764935760093184 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-57298280748314818882467880046592 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((114596561496629637764935760093184 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-57298280748314818882467880046592 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem ep_Q2_002_partial_12_0008_valid :
    mulPoly ep_Q2_002_coefficient_12_0008
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0009 : Poly :=
[
  term ((16131883754506571460624158380453553715328 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 9 for generator 12. -/
def ep_Q2_002_partial_12_0009 : Poly :=
[
  term ((32263767509013142921248316760907107430656 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-16131883754506571460624158380453553715328 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((32263767509013142921248316760907107430656 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-16131883754506571460624158380453553715328 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem ep_Q2_002_partial_12_0009_valid :
    mulPoly ep_Q2_002_coefficient_12_0009
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0010 : Poly :=
[
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def ep_Q2_002_partial_12_0010 : Poly :=
[
  term ((1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-621830788 : Rat) / 211466207) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-621830788 : Rat) / 211466207) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem ep_Q2_002_partial_12_0010_valid :
    mulPoly ep_Q2_002_coefficient_12_0010
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0011 : Poly :=
[
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)]
]

/-- Partial product 11 for generator 12. -/
def ep_Q2_002_partial_12_0011 : Poly :=
[
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (2, 1), (4, 1)],
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (2, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (3, 1), (5, 1)],
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem ep_Q2_002_partial_12_0011_valid :
    mulPoly ep_Q2_002_coefficient_12_0011
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0012 : Poly :=
[
  term ((-125251781704978890683085817384512 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 12 for generator 12. -/
def ep_Q2_002_partial_12_0012 : Poly :=
[
  term ((-250503563409957781366171634769024 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((125251781704978890683085817384512 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-250503563409957781366171634769024 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((125251781704978890683085817384512 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem ep_Q2_002_partial_12_0012_valid :
    mulPoly ep_Q2_002_coefficient_12_0012
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0013 : Poly :=
[
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 13 for generator 12. -/
def ep_Q2_002_partial_12_0013 : Poly :=
[
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1), (12, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem ep_Q2_002_partial_12_0013_valid :
    mulPoly ep_Q2_002_coefficient_12_0013
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0014 : Poly :=
[
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 14 for generator 12. -/
def ep_Q2_002_partial_12_0014 : Poly :=
[
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (12, 1), (13, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem ep_Q2_002_partial_12_0014_valid :
    mulPoly ep_Q2_002_coefficient_12_0014
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0015 : Poly :=
[
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 15 for generator 12. -/
def ep_Q2_002_partial_12_0015 : Poly :=
[
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem ep_Q2_002_partial_12_0015_valid :
    mulPoly ep_Q2_002_coefficient_12_0015
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0016 : Poly :=
[
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def ep_Q2_002_partial_12_0016 : Poly :=
[
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem ep_Q2_002_partial_12_0016_valid :
    mulPoly ep_Q2_002_coefficient_12_0016
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0017 : Poly :=
[
  term ((235872561077283133137633355471104 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 17 for generator 12. -/
def ep_Q2_002_partial_12_0017 : Poly :=
[
  term ((471745122154566266275266710942208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-235872561077283133137633355471104 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((471745122154566266275266710942208 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-235872561077283133137633355471104 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem ep_Q2_002_partial_12_0017_valid :
    mulPoly ep_Q2_002_coefficient_12_0017
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0018 : Poly :=
[
  term ((127934589421372791361250426974300052275176 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 18 for generator 12. -/
def ep_Q2_002_partial_12_0018 : Poly :=
[
  term ((255869178842745582722500853948600104550352 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-127934589421372791361250426974300052275176 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((255869178842745582722500853948600104550352 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-127934589421372791361250426974300052275176 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem ep_Q2_002_partial_12_0018_valid :
    mulPoly ep_Q2_002_coefficient_12_0018
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0019 : Poly :=
[
  term ((85031414458 : Rat) / 7401317245) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 12. -/
def ep_Q2_002_partial_12_0019 : Poly :=
[
  term ((170062828916 : Rat) / 7401317245) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-85031414458 : Rat) / 7401317245) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((170062828916 : Rat) / 7401317245) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-85031414458 : Rat) / 7401317245) [(0, 1), (3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem ep_Q2_002_partial_12_0019_valid :
    mulPoly ep_Q2_002_coefficient_12_0019
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0020 : Poly :=
[
  term ((22756962940616277474848762532048 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 20 for generator 12. -/
def ep_Q2_002_partial_12_0020 : Poly :=
[
  term ((45513925881232554949697525064096 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-22756962940616277474848762532048 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((45513925881232554949697525064096 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-22756962940616277474848762532048 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem ep_Q2_002_partial_12_0020_valid :
    mulPoly ep_Q2_002_coefficient_12_0020
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0021 : Poly :=
[
  term ((-42855622954628263153723979332416 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 21 for generator 12. -/
def ep_Q2_002_partial_12_0021 : Poly :=
[
  term ((-85711245909256526307447958664832 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (7, 1), (13, 1)],
  term ((42855622954628263153723979332416 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-85711245909256526307447958664832 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((42855622954628263153723979332416 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem ep_Q2_002_partial_12_0021_valid :
    mulPoly ep_Q2_002_coefficient_12_0021
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0022 : Poly :=
[
  term ((-352457481157071049970477010715054770742608 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 22 for generator 12. -/
def ep_Q2_002_partial_12_0022 : Poly :=
[
  term ((-704914962314142099940954021430109541485216 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((352457481157071049970477010715054770742608 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-704914962314142099940954021430109541485216 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((352457481157071049970477010715054770742608 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem ep_Q2_002_partial_12_0022_valid :
    mulPoly ep_Q2_002_coefficient_12_0022
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0023 : Poly :=
[
  term ((-23935192464 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 12. -/
def ep_Q2_002_partial_12_0023 : Poly :=
[
  term ((-47870384928 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((23935192464 : Rat) / 7401317245) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-47870384928 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((23935192464 : Rat) / 7401317245) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem ep_Q2_002_partial_12_0023_valid :
    mulPoly ep_Q2_002_coefficient_12_0023
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0024 : Poly :=
[
  term ((4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 24 for generator 12. -/
def ep_Q2_002_partial_12_0024 : Poly :=
[
  term ((9203755506859992031558737011712 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((9203755506859992031558737011712 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem ep_Q2_002_partial_12_0024_valid :
    mulPoly ep_Q2_002_coefficient_12_0024
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0025 : Poly :=
[
  term ((-8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 25 for generator 12. -/
def ep_Q2_002_partial_12_0025 : Poly :=
[
  term ((-17332395223292207667121978773504 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1)],
  term ((8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-17332395223292207667121978773504 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem ep_Q2_002_partial_12_0025_valid :
    mulPoly ep_Q2_002_coefficient_12_0025
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0026 : Poly :=
[
  term ((62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 26 for generator 12. -/
def ep_Q2_002_partial_12_0026 : Poly :=
[
  term ((125680104643955935309051620326730908775264 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((125680104643955935309051620326730908775264 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem ep_Q2_002_partial_12_0026_valid :
    mulPoly ep_Q2_002_coefficient_12_0026
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0027 : Poly :=
[
  term ((-855560780 : Rat) / 211466207) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 12. -/
def ep_Q2_002_partial_12_0027 : Poly :=
[
  term ((-1711121560 : Rat) / 211466207) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((855560780 : Rat) / 211466207) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1711121560 : Rat) / 211466207) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((855560780 : Rat) / 211466207) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem ep_Q2_002_partial_12_0027_valid :
    mulPoly ep_Q2_002_coefficient_12_0027
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0028 : Poly :=
[
  term ((25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 28 for generator 12. -/
def ep_Q2_002_partial_12_0028 : Poly :=
[
  term ((50501076374897323053093218908800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((50501076374897323053093218908800 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem ep_Q2_002_partial_12_0028_valid :
    mulPoly ep_Q2_002_coefficient_12_0028
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0029 : Poly :=
[
  term ((-120830556046626158821374967090704 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 29 for generator 12. -/
def ep_Q2_002_partial_12_0029 : Poly :=
[
  term ((-241661112093252317642749934181408 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((120830556046626158821374967090704 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-241661112093252317642749934181408 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((120830556046626158821374967090704 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem ep_Q2_002_partial_12_0029_valid :
    mulPoly ep_Q2_002_coefficient_12_0029
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0030 : Poly :=
[
  term ((-3677728369492737479626030776325162009392 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 30 for generator 12. -/
def ep_Q2_002_partial_12_0030 : Poly :=
[
  term ((-7355456738985474959252061552650324018784 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((3677728369492737479626030776325162009392 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-7355456738985474959252061552650324018784 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((3677728369492737479626030776325162009392 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem ep_Q2_002_partial_12_0030_valid :
    mulPoly ep_Q2_002_coefficient_12_0030
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0031 : Poly :=
[
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 12. -/
def ep_Q2_002_partial_12_0031 : Poly :=
[
  term ((-90542333872 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((45271166936 : Rat) / 7401317245) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-90542333872 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((45271166936 : Rat) / 7401317245) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem ep_Q2_002_partial_12_0031_valid :
    mulPoly ep_Q2_002_coefficient_12_0031
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0032 : Poly :=
[
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 32 for generator 12. -/
def ep_Q2_002_partial_12_0032 : Poly :=
[
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (11, 2)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem ep_Q2_002_partial_12_0032_valid :
    mulPoly ep_Q2_002_coefficient_12_0032
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0033 : Poly :=
[
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (12, 1)]
]

/-- Partial product 33 for generator 12. -/
def ep_Q2_002_partial_12_0033 : Poly :=
[
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (4, 1), (12, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (2, 2), (12, 1)],
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem ep_Q2_002_partial_12_0033_valid :
    mulPoly ep_Q2_002_coefficient_12_0033
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0034 : Poly :=
[
  term ((-47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 34 for generator 12. -/
def ep_Q2_002_partial_12_0034 : Poly :=
[
  term ((-95102984241484859831569410009600 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-95102984241484859831569410009600 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem ep_Q2_002_partial_12_0034_valid :
    mulPoly ep_Q2_002_coefficient_12_0034
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0035 : Poly :=
[
  term ((1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 35 for generator 12. -/
def ep_Q2_002_partial_12_0035 : Poly :=
[
  term ((3126378296085979937560778491909406058975552 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((3126378296085979937560778491909406058975552 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem ep_Q2_002_partial_12_0035_valid :
    mulPoly ep_Q2_002_coefficient_12_0035
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0036 : Poly :=
[
  term ((26204186168 : Rat) / 7401317245) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def ep_Q2_002_partial_12_0036 : Poly :=
[
  term ((52408372336 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((52408372336 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem ep_Q2_002_partial_12_0036_valid :
    mulPoly ep_Q2_002_coefficient_12_0036
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0037 : Poly :=
[
  term ((61453981452140063600048123674095858288888 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 37 for generator 12. -/
def ep_Q2_002_partial_12_0037 : Poly :=
[
  term ((122907962904280127200096247348191716577776 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-61453981452140063600048123674095858288888 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((122907962904280127200096247348191716577776 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-61453981452140063600048123674095858288888 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem ep_Q2_002_partial_12_0037_valid :
    mulPoly ep_Q2_002_coefficient_12_0037
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0038 : Poly :=
[
  term ((-3032454662 : Rat) / 1480263449) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 12. -/
def ep_Q2_002_partial_12_0038 : Poly :=
[
  term ((-6064909324 : Rat) / 1480263449) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((3032454662 : Rat) / 1480263449) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6064909324 : Rat) / 1480263449) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((3032454662 : Rat) / 1480263449) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem ep_Q2_002_partial_12_0038_valid :
    mulPoly ep_Q2_002_coefficient_12_0038
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0039 : Poly :=
[
  term ((-3222377108594011609177221141696 : Rat) / 97983883872014706756151952089) [(0, 1), (13, 2)]
]

/-- Partial product 39 for generator 12. -/
def ep_Q2_002_partial_12_0039 : Poly :=
[
  term ((-6444754217188023218354442283392 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (13, 2)],
  term ((3222377108594011609177221141696 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 2), (13, 2)],
  term ((-6444754217188023218354442283392 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((3222377108594011609177221141696 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem ep_Q2_002_partial_12_0039_valid :
    mulPoly ep_Q2_002_coefficient_12_0039
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0040 : Poly :=
[
  term ((-3879801290024151293505098876411753537655528 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 40 for generator 12. -/
def ep_Q2_002_partial_12_0040 : Poly :=
[
  term ((-7759602580048302587010197752823507075311056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((3879801290024151293505098876411753537655528 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (15, 2)],
  term ((-7759602580048302587010197752823507075311056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((3879801290024151293505098876411753537655528 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem ep_Q2_002_partial_12_0040_valid :
    mulPoly ep_Q2_002_coefficient_12_0040
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0041 : Poly :=
[
  term ((1529682466 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 12. -/
def ep_Q2_002_partial_12_0041 : Poly :=
[
  term ((3059364932 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-1529682466 : Rat) / 7401317245) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((3059364932 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1529682466 : Rat) / 7401317245) [(0, 1), (3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem ep_Q2_002_partial_12_0041_valid :
    mulPoly ep_Q2_002_coefficient_12_0041
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0042 : Poly :=
[
  term ((-225091348433234900353967259448 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1)]
]

/-- Partial product 42 for generator 12. -/
def ep_Q2_002_partial_12_0042 : Poly :=
[
  term ((-450182696866469800707934518896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((225091348433234900353967259448 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1)],
  term ((-450182696866469800707934518896 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1)],
  term ((225091348433234900353967259448 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem ep_Q2_002_partial_12_0042_valid :
    mulPoly ep_Q2_002_coefficient_12_0042
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0043 : Poly :=
[
  term ((-4878639134998385394112389914416 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 43 for generator 12. -/
def ep_Q2_002_partial_12_0043 : Poly :=
[
  term ((-9757278269996770788224779828832 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2)],
  term ((4878639134998385394112389914416 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((-9757278269996770788224779828832 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1)],
  term ((4878639134998385394112389914416 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 12. -/
theorem ep_Q2_002_partial_12_0043_valid :
    mulPoly ep_Q2_002_coefficient_12_0043
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0044 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1)]
]

/-- Partial product 44 for generator 12. -/
def ep_Q2_002_partial_12_0044 : Poly :=
[
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2), (12, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1), (12, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1), (12, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 12. -/
theorem ep_Q2_002_partial_12_0044_valid :
    mulPoly ep_Q2_002_coefficient_12_0044
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0045 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1)]
]

/-- Partial product 45 for generator 12. -/
def ep_Q2_002_partial_12_0045 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (7, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1), (5, 1), (7, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 2), (7, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 12. -/
theorem ep_Q2_002_partial_12_0045_valid :
    mulPoly ep_Q2_002_coefficient_12_0045
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0046 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 46 for generator 12. -/
def ep_Q2_002_partial_12_0046 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 2), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 12. -/
theorem ep_Q2_002_partial_12_0046_valid :
    mulPoly ep_Q2_002_coefficient_12_0046
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0047 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1)]
]

/-- Partial product 47 for generator 12. -/
def ep_Q2_002_partial_12_0047 : Poly :=
[
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (9, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (9, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 1), (9, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 12. -/
theorem ep_Q2_002_partial_12_0047_valid :
    mulPoly ep_Q2_002_coefficient_12_0047
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0048 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1)]
]

/-- Partial product 48 for generator 12. -/
def ep_Q2_002_partial_12_0048 : Poly :=
[
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (11, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 1), (11, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 12. -/
theorem ep_Q2_002_partial_12_0048_valid :
    mulPoly ep_Q2_002_coefficient_12_0048
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0049 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1)]
]

/-- Partial product 49 for generator 12. -/
def ep_Q2_002_partial_12_0049 : Poly :=
[
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (13, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (13, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 12. -/
theorem ep_Q2_002_partial_12_0049_valid :
    mulPoly ep_Q2_002_coefficient_12_0049
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0050 : Poly :=
[
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (15, 1)]
]

/-- Partial product 50 for generator 12. -/
def ep_Q2_002_partial_12_0050 : Poly :=
[
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 12. -/
theorem ep_Q2_002_partial_12_0050_valid :
    mulPoly ep_Q2_002_coefficient_12_0050
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0051 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 12. -/
def ep_Q2_002_partial_12_0051 : Poly :=
[
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 12. -/
theorem ep_Q2_002_partial_12_0051_valid :
    mulPoly ep_Q2_002_coefficient_12_0051
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0052 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2)]
]

/-- Partial product 52 for generator 12. -/
def ep_Q2_002_partial_12_0052 : Poly :=
[
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 2)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 12. -/
theorem ep_Q2_002_partial_12_0052_valid :
    mulPoly ep_Q2_002_coefficient_12_0052
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0053 : Poly :=
[
  term ((-1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 53 for generator 12. -/
def ep_Q2_002_partial_12_0053 : Poly :=
[
  term ((-2003449625319891114127186942464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (8, 1)],
  term ((1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((-2003449625319891114127186942464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (8, 1)],
  term ((1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 12. -/
theorem ep_Q2_002_partial_12_0053_valid :
    mulPoly ep_Q2_002_coefficient_12_0053
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0054 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 54 for generator 12. -/
def ep_Q2_002_partial_12_0054 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 12. -/
theorem ep_Q2_002_partial_12_0054_valid :
    mulPoly ep_Q2_002_coefficient_12_0054
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0055 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (15, 1)]
]

/-- Partial product 55 for generator 12. -/
def ep_Q2_002_partial_12_0055 : Poly :=
[
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 12. -/
theorem ep_Q2_002_partial_12_0055_valid :
    mulPoly ep_Q2_002_coefficient_12_0055
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0056 : Poly :=
[
  term ((-184951728172403970415931290080 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 56 for generator 12. -/
def ep_Q2_002_partial_12_0056 : Poly :=
[
  term ((-369903456344807940831862580160 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1)],
  term ((184951728172403970415931290080 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((-369903456344807940831862580160 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((184951728172403970415931290080 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 12. -/
theorem ep_Q2_002_partial_12_0056_valid :
    mulPoly ep_Q2_002_coefficient_12_0056
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0057 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 57 for generator 12. -/
def ep_Q2_002_partial_12_0057 : Poly :=
[
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 12. -/
theorem ep_Q2_002_partial_12_0057_valid :
    mulPoly ep_Q2_002_coefficient_12_0057
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0058 : Poly :=
[
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 58 for generator 12. -/
def ep_Q2_002_partial_12_0058 : Poly :=
[
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 12. -/
theorem ep_Q2_002_partial_12_0058_valid :
    mulPoly ep_Q2_002_coefficient_12_0058
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0059 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 12. -/
def ep_Q2_002_partial_12_0059 : Poly :=
[
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 12. -/
theorem ep_Q2_002_partial_12_0059_valid :
    mulPoly ep_Q2_002_coefficient_12_0059
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0060 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1)]
]

/-- Partial product 60 for generator 12. -/
def ep_Q2_002_partial_12_0060 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 2), (5, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (4, 1), (5, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (4, 1), (5, 2)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (4, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 12. -/
theorem ep_Q2_002_partial_12_0060_valid :
    mulPoly ep_Q2_002_coefficient_12_0060
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0061 : Poly :=
[
  term ((17633640208150908230780282654064 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 61 for generator 12. -/
def ep_Q2_002_partial_12_0061 : Poly :=
[
  term ((35267280416301816461560565308128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (7, 1)],
  term ((-17633640208150908230780282654064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1)],
  term ((35267280416301816461560565308128 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (7, 1)],
  term ((-17633640208150908230780282654064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 12. -/
theorem ep_Q2_002_partial_12_0061_valid :
    mulPoly ep_Q2_002_coefficient_12_0061
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0062 : Poly :=
[
  term ((337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 62 for generator 12. -/
def ep_Q2_002_partial_12_0062 : Poly :=
[
  term ((674271974722956393410992560000 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 2), (9, 1)],
  term ((-337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((674271974722956393410992560000 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (5, 1), (9, 1)],
  term ((-337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 12. -/
theorem ep_Q2_002_partial_12_0062_valid :
    mulPoly ep_Q2_002_coefficient_12_0062
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0063 : Poly :=
[
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 63 for generator 12. -/
def ep_Q2_002_partial_12_0063 : Poly :=
[
  term ((201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((-100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((-100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 12. -/
theorem ep_Q2_002_partial_12_0063_valid :
    mulPoly ep_Q2_002_coefficient_12_0063
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0064 : Poly :=
[
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 64 for generator 12. -/
def ep_Q2_002_partial_12_0064 : Poly :=
[
  term ((-21971709299870815468377193874688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (12, 1), (15, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((-21971709299870815468377193874688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 12. -/
theorem ep_Q2_002_partial_12_0064_valid :
    mulPoly ep_Q2_002_coefficient_12_0064
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0065 : Poly :=
[
  term ((-177403445128953808183295350248480 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 65 for generator 12. -/
def ep_Q2_002_partial_12_0065 : Poly :=
[
  term ((-354806890257907616366590700496960 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (13, 1)],
  term ((177403445128953808183295350248480 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((-354806890257907616366590700496960 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (13, 1)],
  term ((177403445128953808183295350248480 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 12. -/
theorem ep_Q2_002_partial_12_0065_valid :
    mulPoly ep_Q2_002_coefficient_12_0065
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0066 : Poly :=
[
  term ((-537451230325909046870187233177759227020784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 66 for generator 12. -/
def ep_Q2_002_partial_12_0066 : Poly :=
[
  term ((-1074902460651818093740374466355518454041568 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((537451230325909046870187233177759227020784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-1074902460651818093740374466355518454041568 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((537451230325909046870187233177759227020784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 12. -/
theorem ep_Q2_002_partial_12_0066_valid :
    mulPoly ep_Q2_002_coefficient_12_0066
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0067 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 12. -/
def ep_Q2_002_partial_12_0067 : Poly :=
[
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 12. -/
theorem ep_Q2_002_partial_12_0067_valid :
    mulPoly ep_Q2_002_coefficient_12_0067
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0068 : Poly :=
[
  term ((-186094128375408806824861177704 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1)]
]

/-- Partial product 68 for generator 12. -/
def ep_Q2_002_partial_12_0068 : Poly :=
[
  term ((-372188256750817613649722355408 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 1), (5, 1)],
  term ((186094128375408806824861177704 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (5, 1)],
  term ((-372188256750817613649722355408 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (5, 2)],
  term ((186094128375408806824861177704 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 12. -/
theorem ep_Q2_002_partial_12_0068_valid :
    mulPoly ep_Q2_002_coefficient_12_0068
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0069 : Poly :=
[
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 69 for generator 12. -/
def ep_Q2_002_partial_12_0069 : Poly :=
[
  term ((-2345622979022214119647616213376 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1)],
  term ((-2345622979022214119647616213376 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 2), (7, 1), (15, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 12. -/
theorem ep_Q2_002_partial_12_0069_valid :
    mulPoly ep_Q2_002_coefficient_12_0069
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0070 : Poly :=
[
  term ((-1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 70 for generator 12. -/
def ep_Q2_002_partial_12_0070 : Poly :=
[
  term ((-3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (8, 1)],
  term ((1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (8, 1)],
  term ((-3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (8, 1)],
  term ((1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 12. -/
theorem ep_Q2_002_partial_12_0070_valid :
    mulPoly ep_Q2_002_coefficient_12_0070
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0071 : Poly :=
[
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 71 for generator 12. -/
def ep_Q2_002_partial_12_0071 : Poly :=
[
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (12, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 12. -/
theorem ep_Q2_002_partial_12_0071_valid :
    mulPoly ep_Q2_002_coefficient_12_0071
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0072 : Poly :=
[
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (15, 2)]
]

/-- Partial product 72 for generator 12. -/
def ep_Q2_002_partial_12_0072 : Poly :=
[
  term ((-8312954790988180052920072534144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (15, 2)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((-8312954790988180052920072534144 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (15, 2)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 12. -/
theorem ep_Q2_002_partial_12_0072_valid :
    mulPoly ep_Q2_002_coefficient_12_0072
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0073 : Poly :=
[
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 73 for generator 12. -/
def ep_Q2_002_partial_12_0073 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (7, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 12. -/
theorem ep_Q2_002_partial_12_0073_valid :
    mulPoly ep_Q2_002_coefficient_12_0073
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0074 : Poly :=
[
  term ((5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 74 for generator 12. -/
def ep_Q2_002_partial_12_0074 : Poly :=
[
  term ((10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (9, 1)],
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (9, 1)],
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 12. -/
theorem ep_Q2_002_partial_12_0074_valid :
    mulPoly ep_Q2_002_coefficient_12_0074
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0075 : Poly :=
[
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 75 for generator 12. -/
def ep_Q2_002_partial_12_0075 : Poly :=
[
  term ((52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 12. -/
theorem ep_Q2_002_partial_12_0075_valid :
    mulPoly ep_Q2_002_coefficient_12_0075
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0076 : Poly :=
[
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 76 for generator 12. -/
def ep_Q2_002_partial_12_0076 : Poly :=
[
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (13, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 12. -/
theorem ep_Q2_002_partial_12_0076_valid :
    mulPoly ep_Q2_002_coefficient_12_0076
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0077 : Poly :=
[
  term ((70030285787399226797547342726342429273936 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 77 for generator 12. -/
def ep_Q2_002_partial_12_0077 : Poly :=
[
  term ((140060571574798453595094685452684858547872 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((-70030285787399226797547342726342429273936 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((140060571574798453595094685452684858547872 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((-70030285787399226797547342726342429273936 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 12. -/
theorem ep_Q2_002_partial_12_0077_valid :
    mulPoly ep_Q2_002_coefficient_12_0077
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0078 : Poly :=
[
  term ((-14304889212 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 12. -/
def ep_Q2_002_partial_12_0078 : Poly :=
[
  term ((-28609778424 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 12. -/
theorem ep_Q2_002_partial_12_0078_valid :
    mulPoly ep_Q2_002_coefficient_12_0078
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0079 : Poly :=
[
  term ((-21275384924276893538924853592096 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 79 for generator 12. -/
def ep_Q2_002_partial_12_0079 : Poly :=
[
  term ((-42550769848553787077849707184192 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1)],
  term ((21275384924276893538924853592096 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1)],
  term ((-42550769848553787077849707184192 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((21275384924276893538924853592096 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 12. -/
theorem ep_Q2_002_partial_12_0079_valid :
    mulPoly ep_Q2_002_coefficient_12_0079
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0080 : Poly :=
[
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 80 for generator 12. -/
def ep_Q2_002_partial_12_0080 : Poly :=
[
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (8, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (8, 1)],
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 12. -/
theorem ep_Q2_002_partial_12_0080_valid :
    mulPoly ep_Q2_002_coefficient_12_0080
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0081 : Poly :=
[
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 81 for generator 12. -/
def ep_Q2_002_partial_12_0081 : Poly :=
[
  term ((-32047189985581250176232147123712 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1)],
  term ((-32047189985581250176232147123712 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 12. -/
theorem ep_Q2_002_partial_12_0081_valid :
    mulPoly ep_Q2_002_coefficient_12_0081
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0082 : Poly :=
[
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 82 for generator 12. -/
def ep_Q2_002_partial_12_0082 : Poly :=
[
  term ((-390155114549454292952617578029568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((-390155114549454292952617578029568 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 12. -/
theorem ep_Q2_002_partial_12_0082_valid :
    mulPoly ep_Q2_002_coefficient_12_0082
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0083 : Poly :=
[
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 83 for generator 12. -/
def ep_Q2_002_partial_12_0083 : Poly :=
[
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (12, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (12, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 12. -/
theorem ep_Q2_002_partial_12_0083_valid :
    mulPoly ep_Q2_002_coefficient_12_0083
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0084 : Poly :=
[
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 84 for generator 12. -/
def ep_Q2_002_partial_12_0084 : Poly :=
[
  term ((720599635165750640467369997931264 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((720599635165750640467369997931264 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 12. -/
theorem ep_Q2_002_partial_12_0084_valid :
    mulPoly ep_Q2_002_coefficient_12_0084
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0085 : Poly :=
[
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (15, 2)]
]

/-- Partial product 85 for generator 12. -/
def ep_Q2_002_partial_12_0085 : Poly :=
[
  term ((2244206414374987957333299333783500317696256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (7, 1), (15, 2)],
  term ((2244206414374987957333299333783500317696256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 12. -/
theorem ep_Q2_002_partial_12_0085_valid :
    mulPoly ep_Q2_002_coefficient_12_0085
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0086 : Poly :=
[
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 86 for generator 12. -/
def ep_Q2_002_partial_12_0086 : Poly :=
[
  term ((305920653408 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((305920653408 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 12. -/
theorem ep_Q2_002_partial_12_0086_valid :
    mulPoly ep_Q2_002_coefficient_12_0086
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0087 : Poly :=
[
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (15, 1)]
]

/-- Partial product 87 for generator 12. -/
def ep_Q2_002_partial_12_0087 : Poly :=
[
  term ((-57633634447981455265059241442688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 2), (15, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 2), (15, 1)],
  term ((-57633634447981455265059241442688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 12. -/
theorem ep_Q2_002_partial_12_0087_valid :
    mulPoly ep_Q2_002_coefficient_12_0087
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0088 : Poly :=
[
  term ((-3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 88 for generator 12. -/
def ep_Q2_002_partial_12_0088 : Poly :=
[
  term ((-6138492155487164145886210713600 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (9, 1)],
  term ((3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (9, 1)],
  term ((-6138492155487164145886210713600 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)],
  term ((3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 12. -/
theorem ep_Q2_002_partial_12_0088_valid :
    mulPoly ep_Q2_002_coefficient_12_0088
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0089 : Poly :=
[
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 89 for generator 12. -/
def ep_Q2_002_partial_12_0089 : Poly :=
[
  term ((28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1)],
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (11, 1)],
  term ((28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1)],
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 12. -/
theorem ep_Q2_002_partial_12_0089_valid :
    mulPoly ep_Q2_002_coefficient_12_0089
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0090 : Poly :=
[
  term ((-2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 90 for generator 12. -/
def ep_Q2_002_partial_12_0090 : Poly :=
[
  term ((-4594908401476729035822348179232 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (8, 1), (13, 1)],
  term ((2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (8, 1), (13, 1)],
  term ((-4594908401476729035822348179232 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)],
  term ((2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 12. -/
theorem ep_Q2_002_partial_12_0090_valid :
    mulPoly ep_Q2_002_coefficient_12_0090
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0091 : Poly :=
[
  term ((-71246717081931807578569215301800829687248 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 91 for generator 12. -/
def ep_Q2_002_partial_12_0091 : Poly :=
[
  term ((-142493434163863615157138430603601659374496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1)],
  term ((71246717081931807578569215301800829687248 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((-142493434163863615157138430603601659374496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)],
  term ((71246717081931807578569215301800829687248 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 12. -/
theorem ep_Q2_002_partial_12_0091_valid :
    mulPoly ep_Q2_002_coefficient_12_0091
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0092 : Poly :=
[
  term ((-10981330664 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 12. -/
def ep_Q2_002_partial_12_0092 : Poly :=
[
  term ((-21962661328 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-21962661328 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 12. -/
theorem ep_Q2_002_partial_12_0092_valid :
    mulPoly ep_Q2_002_coefficient_12_0092
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0093 : Poly :=
[
  term ((-19466024348341527856263679357248 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 93 for generator 12. -/
def ep_Q2_002_partial_12_0093 : Poly :=
[
  term ((-38932048696683055712527358714496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((19466024348341527856263679357248 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1)],
  term ((-38932048696683055712527358714496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((19466024348341527856263679357248 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 12. -/
theorem ep_Q2_002_partial_12_0093_valid :
    mulPoly ep_Q2_002_coefficient_12_0093
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0094 : Poly :=
[
  term ((16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 94 for generator 12. -/
def ep_Q2_002_partial_12_0094 : Poly :=
[
  term ((32714022639284573960692291260000 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (12, 1)],
  term ((-16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((32714022639284573960692291260000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1)],
  term ((-16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 12. -/
theorem ep_Q2_002_partial_12_0094_valid :
    mulPoly ep_Q2_002_coefficient_12_0094
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0095 : Poly :=
[
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 95 for generator 12. -/
def ep_Q2_002_partial_12_0095 : Poly :=
[
  term ((10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (15, 2)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1), (15, 2)],
  term ((10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 12. -/
theorem ep_Q2_002_partial_12_0095_valid :
    mulPoly ep_Q2_002_coefficient_12_0095
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0096 : Poly :=
[
  term ((-87100153279347298205369260017312 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

/-- Partial product 96 for generator 12. -/
def ep_Q2_002_partial_12_0096 : Poly :=
[
  term ((-174200306558694596410738520034624 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((87100153279347298205369260017312 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1)],
  term ((-174200306558694596410738520034624 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((87100153279347298205369260017312 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 12. -/
theorem ep_Q2_002_partial_12_0096_valid :
    mulPoly ep_Q2_002_coefficient_12_0096
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0097 : Poly :=
[
  term ((104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 97 for generator 12. -/
def ep_Q2_002_partial_12_0097 : Poly :=
[
  term ((208738186299466223416143766305408 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((-104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((208738186299466223416143766305408 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 12. -/
theorem ep_Q2_002_partial_12_0097_valid :
    mulPoly ep_Q2_002_coefficient_12_0097
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0098 : Poly :=
[
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 98 for generator 12. -/
def ep_Q2_002_partial_12_0098 : Poly :=
[
  term ((130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 12. -/
theorem ep_Q2_002_partial_12_0098_valid :
    mulPoly ep_Q2_002_coefficient_12_0098
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0099 : Poly :=
[
  term ((-194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 99 for generator 12. -/
def ep_Q2_002_partial_12_0099 : Poly :=
[
  term ((-388028617503576671401578300363648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-388028617503576671401578300363648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 12. -/
theorem ep_Q2_002_partial_12_0099_valid :
    mulPoly ep_Q2_002_coefficient_12_0099
        ep_Q2_002_generator_12_0000_0099 =
      ep_Q2_002_partial_12_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_12_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_12_0000,
  ep_Q2_002_partial_12_0001,
  ep_Q2_002_partial_12_0002,
  ep_Q2_002_partial_12_0003,
  ep_Q2_002_partial_12_0004,
  ep_Q2_002_partial_12_0005,
  ep_Q2_002_partial_12_0006,
  ep_Q2_002_partial_12_0007,
  ep_Q2_002_partial_12_0008,
  ep_Q2_002_partial_12_0009,
  ep_Q2_002_partial_12_0010,
  ep_Q2_002_partial_12_0011,
  ep_Q2_002_partial_12_0012,
  ep_Q2_002_partial_12_0013,
  ep_Q2_002_partial_12_0014,
  ep_Q2_002_partial_12_0015,
  ep_Q2_002_partial_12_0016,
  ep_Q2_002_partial_12_0017,
  ep_Q2_002_partial_12_0018,
  ep_Q2_002_partial_12_0019,
  ep_Q2_002_partial_12_0020,
  ep_Q2_002_partial_12_0021,
  ep_Q2_002_partial_12_0022,
  ep_Q2_002_partial_12_0023,
  ep_Q2_002_partial_12_0024,
  ep_Q2_002_partial_12_0025,
  ep_Q2_002_partial_12_0026,
  ep_Q2_002_partial_12_0027,
  ep_Q2_002_partial_12_0028,
  ep_Q2_002_partial_12_0029,
  ep_Q2_002_partial_12_0030,
  ep_Q2_002_partial_12_0031,
  ep_Q2_002_partial_12_0032,
  ep_Q2_002_partial_12_0033,
  ep_Q2_002_partial_12_0034,
  ep_Q2_002_partial_12_0035,
  ep_Q2_002_partial_12_0036,
  ep_Q2_002_partial_12_0037,
  ep_Q2_002_partial_12_0038,
  ep_Q2_002_partial_12_0039,
  ep_Q2_002_partial_12_0040,
  ep_Q2_002_partial_12_0041,
  ep_Q2_002_partial_12_0042,
  ep_Q2_002_partial_12_0043,
  ep_Q2_002_partial_12_0044,
  ep_Q2_002_partial_12_0045,
  ep_Q2_002_partial_12_0046,
  ep_Q2_002_partial_12_0047,
  ep_Q2_002_partial_12_0048,
  ep_Q2_002_partial_12_0049,
  ep_Q2_002_partial_12_0050,
  ep_Q2_002_partial_12_0051,
  ep_Q2_002_partial_12_0052,
  ep_Q2_002_partial_12_0053,
  ep_Q2_002_partial_12_0054,
  ep_Q2_002_partial_12_0055,
  ep_Q2_002_partial_12_0056,
  ep_Q2_002_partial_12_0057,
  ep_Q2_002_partial_12_0058,
  ep_Q2_002_partial_12_0059,
  ep_Q2_002_partial_12_0060,
  ep_Q2_002_partial_12_0061,
  ep_Q2_002_partial_12_0062,
  ep_Q2_002_partial_12_0063,
  ep_Q2_002_partial_12_0064,
  ep_Q2_002_partial_12_0065,
  ep_Q2_002_partial_12_0066,
  ep_Q2_002_partial_12_0067,
  ep_Q2_002_partial_12_0068,
  ep_Q2_002_partial_12_0069,
  ep_Q2_002_partial_12_0070,
  ep_Q2_002_partial_12_0071,
  ep_Q2_002_partial_12_0072,
  ep_Q2_002_partial_12_0073,
  ep_Q2_002_partial_12_0074,
  ep_Q2_002_partial_12_0075,
  ep_Q2_002_partial_12_0076,
  ep_Q2_002_partial_12_0077,
  ep_Q2_002_partial_12_0078,
  ep_Q2_002_partial_12_0079,
  ep_Q2_002_partial_12_0080,
  ep_Q2_002_partial_12_0081,
  ep_Q2_002_partial_12_0082,
  ep_Q2_002_partial_12_0083,
  ep_Q2_002_partial_12_0084,
  ep_Q2_002_partial_12_0085,
  ep_Q2_002_partial_12_0086,
  ep_Q2_002_partial_12_0087,
  ep_Q2_002_partial_12_0088,
  ep_Q2_002_partial_12_0089,
  ep_Q2_002_partial_12_0090,
  ep_Q2_002_partial_12_0091,
  ep_Q2_002_partial_12_0092,
  ep_Q2_002_partial_12_0093,
  ep_Q2_002_partial_12_0094,
  ep_Q2_002_partial_12_0095,
  ep_Q2_002_partial_12_0096,
  ep_Q2_002_partial_12_0097,
  ep_Q2_002_partial_12_0098,
  ep_Q2_002_partial_12_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_12_0000_0099 : Poly :=
[
  term ((17718225388654825635616275584512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (3, 1), (4, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (3, 1), (4, 1), (12, 1)],
  term ((-3219219663420374034121964082048 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (7, 1)],
  term ((-650985607840403286133370105856 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (2, 1), (4, 1), (9, 1)],
  term ((-73270918151764402578708334477728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-3571962974896880561887324454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((114596561496629637764935760093184 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1)],
  term ((32263767509013142921248316760907107430656 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-8859112694327412817808137792256 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (3, 1), (12, 1)],
  term ((1609609831710187017060982041024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-57298280748314818882467880046592 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-16131883754506571460624158380453553715328 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-621830788 : Rat) / 211466207) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-3219219663420374034121964082048 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1)],
  term ((-650985607840403286133370105856 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-73270918151764402578708334477728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-3571962974896880561887324454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((114596561496629637764935760093184 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1)],
  term ((32263767509013142921248316760907107430656 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((17718225388654825635616275584512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1), (12, 1)],
  term ((1609609831710187017060982041024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-57298280748314818882467880046592 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-16131883754506571460624158380453553715328 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-621830788 : Rat) / 211466207) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-8859112694327412817808137792256 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 3)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 3), (12, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (2, 1), (4, 1)],
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (2, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (3, 1), (5, 1)],
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (3, 2)],
  term ((-250503563409957781366171634769024 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((471745122154566266275266710942208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1)],
  term ((255869178842745582722500853948600104550352 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((170062828916 : Rat) / 7401317245) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (4, 1)],
  term ((45513925881232554949697525064096 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-85711245909256526307447958664832 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-704914962314142099940954021430109541485216 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-47870384928 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((9203755506859992031558737011712 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-17332395223292207667121978773504 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1)],
  term ((125680104643955935309051620326730908775264 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-1711121560 : Rat) / 211466207) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((50501076374897323053093218908800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-241661112093252317642749934181408 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-7355456738985474959252061552650324018784 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-90542333872 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (4, 1), (12, 1)],
  term ((-95102984241484859831569410009600 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((3126378296085979937560778491909406058975552 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (12, 1), (15, 2)],
  term ((52408372336 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((122907962904280127200096247348191716577776 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-6064909324 : Rat) / 1480263449) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6444754217188023218354442283392 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (13, 2)],
  term ((-7759602580048302587010197752823507075311056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((3059364932 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (2, 2)],
  term ((125251781704978890683085817384512 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (12, 1), (13, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (3, 1), (12, 1), (15, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-235872561077283133137633355471104 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-127934589421372791361250426974300052275176 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-85031414458 : Rat) / 7401317245) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-22756962940616277474848762532048 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((42855622954628263153723979332416 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((352457481157071049970477010715054770742608 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((23935192464 : Rat) / 7401317245) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((855560780 : Rat) / 211466207) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((120830556046626158821374967090704 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((3677728369492737479626030776325162009392 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((45271166936 : Rat) / 7401317245) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (2, 2), (12, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-61453981452140063600048123674095858288888 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((3032454662 : Rat) / 1480263449) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((3222377108594011609177221141696 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 2), (13, 2)],
  term ((3879801290024151293505098876411753537655528 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (15, 2)],
  term ((-1529682466 : Rat) / 7401317245) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (3, 1), (5, 1)],
  term ((45513925881232554949697525064096 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-85711245909256526307447958664832 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-704914962314142099940954021430109541485216 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-47870384928 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((9203755506859992031558737011712 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-17332395223292207667121978773504 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((125680104643955935309051620326730908775264 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-1711121560 : Rat) / 211466207) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((50501076374897323053093218908800 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-241661112093252317642749934181408 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-7355456738985474959252061552650324018784 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-90542333872 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (11, 2)],
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((-95102984241484859831569410009600 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((3126378296085979937560778491909406058975552 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((52408372336 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((122907962904280127200096247348191716577776 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-6064909324 : Rat) / 1480263449) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6444754217188023218354442283392 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((-7759602580048302587010197752823507075311056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((3059364932 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (3, 2)],
  term ((-250503563409957781366171634769024 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1), (12, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((471745122154566266275266710942208 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((255869178842745582722500853948600104550352 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((170062828916 : Rat) / 7401317245) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-22756962940616277474848762532048 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((42855622954628263153723979332416 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((352457481157071049970477010715054770742608 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((23935192464 : Rat) / 7401317245) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((-62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((855560780 : Rat) / 211466207) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((120830556046626158821374967090704 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((3677728369492737479626030776325162009392 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((45271166936 : Rat) / 7401317245) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (3, 2), (12, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-61453981452140063600048123674095858288888 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((3032454662 : Rat) / 1480263449) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((3222377108594011609177221141696 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 2), (13, 2)],
  term ((3879801290024151293505098876411753537655528 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (15, 2)],
  term ((-1529682466 : Rat) / 7401317245) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((125251781704978890683085817384512 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (11, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (11, 1), (12, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (12, 1), (13, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 3), (12, 1), (15, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-235872561077283133137633355471104 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (13, 1)],
  term ((-127934589421372791361250426974300052275176 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 3), (15, 1)],
  term ((-85031414458 : Rat) / 7401317245) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-450182696866469800707934518896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (7, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (9, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (13, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 2)],
  term ((-2003449625319891114127186942464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (8, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((-369903456344807940831862580160 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-9757278269996770788224779828832 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2), (12, 1)],
  term ((-372188256750817613649722355408 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 1), (5, 1)],
  term ((-2345622979022214119647616213376 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (8, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)],
  term ((-8312954790988180052920072534144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (15, 2)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (7, 1)],
  term ((10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (9, 1)],
  term ((52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1)],
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (13, 1)],
  term ((140060571574798453595094685452684858547872 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-42550769848553787077849707184192 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1)],
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (8, 1)],
  term ((-32047189985581250176232147123712 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-390155114549454292952617578029568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (12, 1)],
  term ((720599635165750640467369997931264 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((2244206414374987957333299333783500317696256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2)],
  term ((305920653408 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-57633634447981455265059241442688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 2), (15, 1)],
  term ((-6138492155487164145886210713600 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (9, 1)],
  term ((28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1)],
  term ((-4594908401476729035822348179232 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (8, 1), (13, 1)],
  term ((-142493434163863615157138430603601659374496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1)],
  term ((-21962661328 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-38932048696683055712527358714496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((32714022639284573960692291260000 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (12, 1)],
  term ((10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (15, 2)],
  term ((-174200306558694596410738520034624 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((208738186299466223416143766305408 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((-388028617503576671401578300363648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 2), (5, 1)],
  term ((35267280416301816461560565308128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (7, 1)],
  term ((674271974722956393410992560000 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 2), (9, 1)],
  term ((201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((-21971709299870815468377193874688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (12, 1), (15, 1)],
  term ((-354806890257907616366590700496960 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (13, 1)],
  term ((-1074902460651818093740374466355518454041568 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((225091348433234900353967259448 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1)],
  term ((4878639134998385394112389914416 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1), (12, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1), (5, 1), (7, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (9, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (11, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (13, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 2)],
  term ((1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1)],
  term ((184951728172403970415931290080 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (4, 1), (5, 1)],
  term ((-17633640208150908230780282654064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1)],
  term ((-337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((-100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((177403445128953808183295350248480 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((537451230325909046870187233177759227020784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((186094128375408806824861177704 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (5, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1)],
  term ((1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (8, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-70030285787399226797547342726342429273936 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((21275384924276893538924853592096 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (8, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (12, 1)],
  term ((-360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (7, 1), (15, 2)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 2), (15, 1)],
  term ((3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (9, 1)],
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (11, 1)],
  term ((2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (8, 1), (13, 1)],
  term ((71246717081931807578569215301800829687248 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((19466024348341527856263679357248 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1)],
  term ((-16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1), (15, 2)],
  term ((87100153279347298205369260017312 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1)],
  term ((-104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((35267280416301816461560565308128 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (7, 1)],
  term ((674271974722956393410992560000 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (5, 1), (9, 1)],
  term ((201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((-21971709299870815468377193874688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-354806890257907616366590700496960 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (13, 1)],
  term ((-1074902460651818093740374466355518454041568 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (4, 1), (5, 2)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1)],
  term ((10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (9, 1)],
  term ((52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1)],
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((140060571574798453595094685452684858547872 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-42550769848553787077849707184192 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1)],
  term ((-32047189985581250176232147123712 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-390155114549454292952617578029568 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1)],
  term ((720599635165750640467369997931264 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((2244206414374987957333299333783500317696256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((305920653408 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-57633634447981455265059241442688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1)],
  term ((-6138492155487164145886210713600 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)],
  term ((28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1)],
  term ((-4594908401476729035822348179232 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)],
  term ((-142493434163863615157138430603601659374496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)],
  term ((-21962661328 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-38932048696683055712527358714496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((32714022639284573960692291260000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1)],
  term ((10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2)],
  term ((-174200306558694596410738520034624 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((208738186299466223416143766305408 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((-388028617503576671401578300363648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((-372188256750817613649722355408 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (5, 2)],
  term ((-2345622979022214119647616213376 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 2), (7, 1), (15, 1)],
  term ((-3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (8, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (12, 1)],
  term ((-8312954790988180052920072534144 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (15, 2)],
  term ((-16207741462307859617255724415616 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1), (12, 1)],
  term ((-17633640208150908230780282654064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (7, 1)],
  term ((-337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((-100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1)],
  term ((177403445128953808183295350248480 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((537451230325909046870187233177759227020784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((1969040972013844688015260791256 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 1), (9, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 1), (11, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1)],
  term ((-1108462657340782603479497213517806210765248 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 2)],
  term ((-12686541913480293992679419520 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 1), (8, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1)],
  term ((-8342622577997358180535347875328 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((377299609735057481543147029134610246091136 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 2), (7, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 2), (15, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-70030285787399226797547342726342429273936 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((21275384924276893538924853592096 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (8, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (12, 1)],
  term ((-360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (7, 1), (15, 2)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 2), (15, 1)],
  term ((3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (8, 1), (9, 1)],
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (8, 1), (11, 1)],
  term ((2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((71246717081931807578569215301800829687248 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((19466024348341527856263679357248 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1)],
  term ((-16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1), (15, 2)],
  term ((87100153279347298205369260017312 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (11, 1)],
  term ((-104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((225091348433234900353967259448 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3)],
  term ((4878639134998385394112389914416 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1), (12, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3), (5, 1), (7, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (5, 1), (15, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (9, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (11, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (13, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (7, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 3), (7, 1), (15, 1), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 2)],
  term ((1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (8, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (9, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (11, 1), (15, 1)],
  term ((184951728172403970415931290080 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (12, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 3), (15, 2), (16, 1)],
  term ((7421491014476506720248 : Rat) / 253528477699481291099) [(2, 1), (4, 1)],
  term ((-3710745507238253360124 : Rat) / 253528477699481291099) [(2, 2)],
  term ((7421491014476506720248 : Rat) / 253528477699481291099) [(3, 1), (5, 1)],
  term ((-3710745507238253360124 : Rat) / 253528477699481291099) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 99. -/
theorem ep_Q2_002_block_12_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_12_0000_0099
      ep_Q2_002_block_12_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
