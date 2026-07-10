/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 10:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 10 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_10_0000_0099 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0000 : Poly :=
[
  term ((-3710745507238253360124 : Rat) / 253528477699481291099) []
]

/-- Partial product 0 for generator 10. -/
def ep_Q2_002_partial_10_0000 : Poly :=
[
  term ((-7421491014476506720248 : Rat) / 253528477699481291099) [(2, 1), (4, 1)],
  term ((-7421491014476506720248 : Rat) / 253528477699481291099) [(3, 1), (5, 1)],
  term ((3710745507238253360124 : Rat) / 253528477699481291099) [(4, 2)],
  term ((3710745507238253360124 : Rat) / 253528477699481291099) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem ep_Q2_002_partial_10_0000_valid :
    mulPoly ep_Q2_002_coefficient_10_0000
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0001 : Poly :=
[
  term ((11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1)]
]

/-- Partial product 1 for generator 10. -/
def ep_Q2_002_partial_10_0001 : Poly :=
[
  term ((22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (4, 1)],
  term ((22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (3, 1), (5, 1)],
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (4, 2)],
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem ep_Q2_002_partial_10_0001_valid :
    mulPoly ep_Q2_002_coefficient_10_0001
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0002 : Poly :=
[
  term ((-6616744137156904017040301079744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 10. -/
def ep_Q2_002_partial_10_0002 : Poly :=
[
  term ((-13233488274313808034080602159488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (3, 1), (4, 1)],
  term ((6616744137156904017040301079744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (4, 2)],
  term ((6616744137156904017040301079744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 2)],
  term ((-13233488274313808034080602159488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem ep_Q2_002_partial_10_0002_valid :
    mulPoly ep_Q2_002_coefficient_10_0002
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0003 : Poly :=
[
  term ((325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 3 for generator 10. -/
def ep_Q2_002_partial_10_0003 : Poly :=
[
  term ((650985607840403286133370105856 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (2, 1), (4, 1), (9, 1)],
  term ((650985607840403286133370105856 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (4, 2), (9, 1)],
  term ((-325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (5, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem ep_Q2_002_partial_10_0003_valid :
    mulPoly ep_Q2_002_coefficient_10_0003
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0004 : Poly :=
[
  term ((36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 4 for generator 10. -/
def ep_Q2_002_partial_10_0004 : Poly :=
[
  term ((73270918151764402578708334477728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((73270918151764402578708334477728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 2), (11, 1)],
  term ((-36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem ep_Q2_002_partial_10_0004_valid :
    mulPoly ep_Q2_002_coefficient_10_0004
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0005 : Poly :=
[
  term ((-56851785376452708812231964489792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 5 for generator 10. -/
def ep_Q2_002_partial_10_0005 : Poly :=
[
  term ((-113703570752905417624463928979584 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-113703570752905417624463928979584 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1)],
  term ((56851785376452708812231964489792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 2), (13, 1)],
  term ((56851785376452708812231964489792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem ep_Q2_002_partial_10_0005_valid :
    mulPoly ep_Q2_002_coefficient_10_0005
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0006 : Poly :=
[
  term ((-15030007138876823424363352543974226852800 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 6 for generator 10. -/
def ep_Q2_002_partial_10_0006 : Poly :=
[
  term ((-30060014277753646848726705087948453705600 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-30060014277753646848726705087948453705600 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((15030007138876823424363352543974226852800 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term ((15030007138876823424363352543974226852800 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem ep_Q2_002_partial_10_0006_valid :
    mulPoly ep_Q2_002_coefficient_10_0006
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0007 : Poly :=
[
  term ((-621830788 : Rat) / 211466207) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 10. -/
def ep_Q2_002_partial_10_0007 : Poly :=
[
  term ((-1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (4, 2), (15, 1), (16, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem ep_Q2_002_partial_10_0007_valid :
    mulPoly ep_Q2_002_coefficient_10_0007
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0008 : Poly :=
[
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)]
]

/-- Partial product 8 for generator 10. -/
def ep_Q2_002_partial_10_0008 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (2, 1), (4, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (3, 1), (5, 1)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (4, 2)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem ep_Q2_002_partial_10_0008_valid :
    mulPoly ep_Q2_002_coefficient_10_0008
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0009 : Poly :=
[
  term ((93548758307989346790328441609488 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 9 for generator 10. -/
def ep_Q2_002_partial_10_0009 : Poly :=
[
  term ((187097516615978693580656883218976 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-93548758307989346790328441609488 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((-93548758307989346790328441609488 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((187097516615978693580656883218976 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem ep_Q2_002_partial_10_0009_valid :
    mulPoly ep_Q2_002_coefficient_10_0009
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0010 : Poly :=
[
  term ((-176169830938445523138041673976896 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 10 for generator 10. -/
def ep_Q2_002_partial_10_0010 : Poly :=
[
  term ((-352339661876891046276083347953792 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1)],
  term ((176169830938445523138041673976896 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 2), (13, 1)],
  term ((176169830938445523138041673976896 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((-352339661876891046276083347953792 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem ep_Q2_002_partial_10_0010_valid :
    mulPoly ep_Q2_002_coefficient_10_0010
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0011 : Poly :=
[
  term ((10903394335100843341459199485164209458392 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 11 for generator 10. -/
def ep_Q2_002_partial_10_0011 : Poly :=
[
  term ((21806788670201686682918398970328418916784 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-10903394335100843341459199485164209458392 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((-10903394335100843341459199485164209458392 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((21806788670201686682918398970328418916784 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 10. -/
theorem ep_Q2_002_partial_10_0011_valid :
    mulPoly ep_Q2_002_coefficient_10_0011
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0012 : Poly :=
[
  term ((-8114825986 : Rat) / 1057331035) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 10. -/
def ep_Q2_002_partial_10_0012 : Poly :=
[
  term ((-16229651972 : Rat) / 1057331035) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((8114825986 : Rat) / 1057331035) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((8114825986 : Rat) / 1057331035) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-16229651972 : Rat) / 1057331035) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 10. -/
theorem ep_Q2_002_partial_10_0012_valid :
    mulPoly ep_Q2_002_coefficient_10_0012
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0013 : Poly :=
[
  term ((-4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 13 for generator 10. -/
def ep_Q2_002_partial_10_0013 : Poly :=
[
  term ((-9203755506859992031558737011712 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-9203755506859992031558737011712 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (4, 2), (9, 1), (11, 1)],
  term ((4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 10. -/
theorem ep_Q2_002_partial_10_0013_valid :
    mulPoly ep_Q2_002_coefficient_10_0013
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0014 : Poly :=
[
  term ((8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 14 for generator 10. -/
def ep_Q2_002_partial_10_0014 : Poly :=
[
  term ((17332395223292207667121978773504 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1)],
  term ((17332395223292207667121978773504 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((-8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 10. -/
theorem ep_Q2_002_partial_10_0014_valid :
    mulPoly ep_Q2_002_coefficient_10_0014
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0015 : Poly :=
[
  term ((-62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 15 for generator 10. -/
def ep_Q2_002_partial_10_0015 : Poly :=
[
  term ((-125680104643955935309051620326730908775264 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-125680104643955935309051620326730908775264 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 10. -/
theorem ep_Q2_002_partial_10_0015_valid :
    mulPoly ep_Q2_002_coefficient_10_0015
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0016 : Poly :=
[
  term ((855560780 : Rat) / 211466207) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 10. -/
def ep_Q2_002_partial_10_0016 : Poly :=
[
  term ((1711121560 : Rat) / 211466207) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1711121560 : Rat) / 211466207) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-855560780 : Rat) / 211466207) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-855560780 : Rat) / 211466207) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 10. -/
theorem ep_Q2_002_partial_10_0016_valid :
    mulPoly ep_Q2_002_coefficient_10_0016
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0017 : Poly :=
[
  term ((8809070884597230264595254979008 : Rat) / 97983883872014706756151952089) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 17 for generator 10. -/
def ep_Q2_002_partial_10_0017 : Poly :=
[
  term ((17618141769194460529190509958016 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((17618141769194460529190509958016 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-8809070884597230264595254979008 : Rat) / 97983883872014706756151952089) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((-8809070884597230264595254979008 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 10. -/
theorem ep_Q2_002_partial_10_0017_valid :
    mulPoly ep_Q2_002_coefficient_10_0017
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0018 : Poly :=
[
  term ((-37437669792448430561804079980006659771968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 18 for generator 10. -/
def ep_Q2_002_partial_10_0018 : Poly :=
[
  term ((-74875339584896861123608159960013319543936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-74875339584896861123608159960013319543936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((37437669792448430561804079980006659771968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((37437669792448430561804079980006659771968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 10. -/
theorem ep_Q2_002_partial_10_0018_valid :
    mulPoly ep_Q2_002_coefficient_10_0018
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0019 : Poly :=
[
  term ((45271166936 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 10. -/
def ep_Q2_002_partial_10_0019 : Poly :=
[
  term ((90542333872 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((90542333872 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 10. -/
theorem ep_Q2_002_partial_10_0019_valid :
    mulPoly ep_Q2_002_coefficient_10_0019
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0020 : Poly :=
[
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 20 for generator 10. -/
def ep_Q2_002_partial_10_0020 : Poly :=
[
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (11, 2)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 2), (11, 2)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 10. -/
theorem ep_Q2_002_partial_10_0020_valid :
    mulPoly ep_Q2_002_coefficient_10_0020
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0021 : Poly :=
[
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (12, 1)]
]

/-- Partial product 21 for generator 10. -/
def ep_Q2_002_partial_10_0021 : Poly :=
[
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (4, 1), (12, 1)],
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (4, 2), (12, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 10. -/
theorem ep_Q2_002_partial_10_0021_valid :
    mulPoly ep_Q2_002_coefficient_10_0021
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0022 : Poly :=
[
  term ((-551380687232105047228291448138216944050624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 22 for generator 10. -/
def ep_Q2_002_partial_10_0022 : Poly :=
[
  term ((-1102761374464210094456582896276433888101248 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-1102761374464210094456582896276433888101248 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((551380687232105047228291448138216944050624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((551380687232105047228291448138216944050624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 10. -/
theorem ep_Q2_002_partial_10_0022_valid :
    mulPoly ep_Q2_002_coefficient_10_0022
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0023 : Poly :=
[
  term ((8611226768 : Rat) / 7401317245) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 10. -/
def ep_Q2_002_partial_10_0023 : Poly :=
[
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8611226768 : Rat) / 7401317245) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8611226768 : Rat) / 7401317245) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 10. -/
theorem ep_Q2_002_partial_10_0023_valid :
    mulPoly ep_Q2_002_coefficient_10_0023
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0024 : Poly :=
[
  term ((53778775441907758398250051093248 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 24 for generator 10. -/
def ep_Q2_002_partial_10_0024 : Poly :=
[
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (13, 2)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((-53778775441907758398250051093248 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 2), (13, 2)],
  term ((-53778775441907758398250051093248 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 10. -/
theorem ep_Q2_002_partial_10_0024_valid :
    mulPoly ep_Q2_002_coefficient_10_0024
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0025 : Poly :=
[
  term ((3017317768580053624434133256329323302815392 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 25 for generator 10. -/
def ep_Q2_002_partial_10_0025 : Poly :=
[
  term ((6034635537160107248868266512658646605630784 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((6034635537160107248868266512658646605630784 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-3017317768580053624434133256329323302815392 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 2), (15, 2)],
  term ((-3017317768580053624434133256329323302815392 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 10. -/
theorem ep_Q2_002_partial_10_0025_valid :
    mulPoly ep_Q2_002_coefficient_10_0025
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0026 : Poly :=
[
  term ((21798952136 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 10. -/
def ep_Q2_002_partial_10_0026 : Poly :=
[
  term ((43597904272 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((43597904272 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-21798952136 : Rat) / 7401317245) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-21798952136 : Rat) / 7401317245) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 10. -/
theorem ep_Q2_002_partial_10_0026_valid :
    mulPoly ep_Q2_002_coefficient_10_0026
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0027 : Poly :=
[
  term ((-1551348894801550572741347446448 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1)]
]

/-- Partial product 27 for generator 10. -/
def ep_Q2_002_partial_10_0027 : Poly :=
[
  term ((-3102697789603101145482694892896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((1551348894801550572741347446448 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2)],
  term ((1551348894801550572741347446448 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2)],
  term ((-3102697789603101145482694892896 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 10. -/
theorem ep_Q2_002_partial_10_0027_valid :
    mulPoly ep_Q2_002_coefficient_10_0027
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0028 : Poly :=
[
  term ((2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 28 for generator 10. -/
def ep_Q2_002_partial_10_0028 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2)],
  term ((-2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 2)],
  term ((-2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 3)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 10. -/
theorem ep_Q2_002_partial_10_0028_valid :
    mulPoly ep_Q2_002_coefficient_10_0028
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0029 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 29 for generator 10. -/
def ep_Q2_002_partial_10_0029 : Poly :=
[
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (8, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2), (8, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (8, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 10. -/
theorem ep_Q2_002_partial_10_0029_valid :
    mulPoly ep_Q2_002_coefficient_10_0029
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0030 : Poly :=
[
  term ((-220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 30 for generator 10. -/
def ep_Q2_002_partial_10_0030 : Poly :=
[
  term ((-441524184446328388600478033664 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 2), (12, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (5, 2), (12, 1)],
  term ((-441524184446328388600478033664 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 10. -/
theorem ep_Q2_002_partial_10_0030_valid :
    mulPoly ep_Q2_002_coefficient_10_0030
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0031 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1)]
]

/-- Partial product 31 for generator 10. -/
def ep_Q2_002_partial_10_0031 : Poly :=
[
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 2), (5, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (4, 1), (5, 2)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 3)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 10. -/
theorem ep_Q2_002_partial_10_0031_valid :
    mulPoly ep_Q2_002_coefficient_10_0031
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0032 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 32 for generator 10. -/
def ep_Q2_002_partial_10_0032 : Poly :=
[
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (7, 1)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (7, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 2), (7, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 10. -/
theorem ep_Q2_002_partial_10_0032_valid :
    mulPoly ep_Q2_002_coefficient_10_0032
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0033 : Poly :=
[
  term ((-337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 33 for generator 10. -/
def ep_Q2_002_partial_10_0033 : Poly :=
[
  term ((-674271974722956393410992560000 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 2), (9, 1)],
  term ((-674271974722956393410992560000 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (5, 1), (9, 1)],
  term ((337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (5, 2), (9, 1)],
  term ((337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 10. -/
theorem ep_Q2_002_partial_10_0033_valid :
    mulPoly ep_Q2_002_coefficient_10_0033
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0034 : Poly :=
[
  term ((-100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 34 for generator 10. -/
def ep_Q2_002_partial_10_0034 : Poly :=
[
  term ((-201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((-201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 2), (11, 1)],
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 10. -/
theorem ep_Q2_002_partial_10_0034_valid :
    mulPoly ep_Q2_002_coefficient_10_0034
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0035 : Poly :=
[
  term ((180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 35 for generator 10. -/
def ep_Q2_002_partial_10_0035 : Poly :=
[
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (13, 1)],
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (13, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 2), (13, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 10. -/
theorem ep_Q2_002_partial_10_0035_valid :
    mulPoly ep_Q2_002_coefficient_10_0035
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0036 : Poly :=
[
  term ((48959083951140183136927479550987220051424 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 36 for generator 10. -/
def ep_Q2_002_partial_10_0036 : Poly :=
[
  term ((97918167902280366273854959101974440102848 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((97918167902280366273854959101974440102848 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((-48959083951140183136927479550987220051424 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (5, 2), (15, 1)],
  term ((-48959083951140183136927479550987220051424 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 10. -/
theorem ep_Q2_002_partial_10_0036_valid :
    mulPoly ep_Q2_002_coefficient_10_0036
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0037 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 10. -/
def ep_Q2_002_partial_10_0037 : Poly :=
[
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 10. -/
theorem ep_Q2_002_partial_10_0037_valid :
    mulPoly ep_Q2_002_coefficient_10_0037
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0038 : Poly :=
[
  term ((123012357511186159858234088192 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1)]
]

/-- Partial product 38 for generator 10. -/
def ep_Q2_002_partial_10_0038 : Poly :=
[
  term ((246024715022372319716468176384 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (5, 1)],
  term ((246024715022372319716468176384 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 2)],
  term ((-123012357511186159858234088192 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (5, 1)],
  term ((-123012357511186159858234088192 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 10. -/
theorem ep_Q2_002_partial_10_0038_valid :
    mulPoly ep_Q2_002_coefficient_10_0038
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0039 : Poly :=
[
  term ((1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 39 for generator 10. -/
def ep_Q2_002_partial_10_0039 : Poly :=
[
  term ((3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (8, 1)],
  term ((3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (8, 1)],
  term ((-1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (5, 1), (8, 1)],
  term ((-1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 10. -/
theorem ep_Q2_002_partial_10_0039_valid :
    mulPoly ep_Q2_002_coefficient_10_0039
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0040 : Poly :=
[
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 40 for generator 10. -/
def ep_Q2_002_partial_10_0040 : Poly :=
[
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (12, 1)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (5, 1), (12, 1)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 10. -/
theorem ep_Q2_002_partial_10_0040_valid :
    mulPoly ep_Q2_002_coefficient_10_0040
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0041 : Poly :=
[
  term ((-5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 41 for generator 10. -/
def ep_Q2_002_partial_10_0041 : Poly :=
[
  term ((-10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (9, 1)],
  term ((-10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (9, 1)],
  term ((5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (9, 1)],
  term ((5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 10. -/
theorem ep_Q2_002_partial_10_0041_valid :
    mulPoly ep_Q2_002_coefficient_10_0041
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0042 : Poly :=
[
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 42 for generator 10. -/
def ep_Q2_002_partial_10_0042 : Poly :=
[
  term ((-52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1)],
  term ((-52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (11, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 10. -/
theorem ep_Q2_002_partial_10_0042_valid :
    mulPoly ep_Q2_002_coefficient_10_0042
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0043 : Poly :=
[
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 43 for generator 10. -/
def ep_Q2_002_partial_10_0043 : Poly :=
[
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (13, 1)],
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (13, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 10. -/
theorem ep_Q2_002_partial_10_0043_valid :
    mulPoly ep_Q2_002_coefficient_10_0043
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0044 : Poly :=
[
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 44 for generator 10. -/
def ep_Q2_002_partial_10_0044 : Poly :=
[
  term ((-148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((-148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 2), (6, 1), (15, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 2), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 10. -/
theorem ep_Q2_002_partial_10_0044_valid :
    mulPoly ep_Q2_002_coefficient_10_0044
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0045 : Poly :=
[
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 10. -/
def ep_Q2_002_partial_10_0045 : Poly :=
[
  term ((28609778424 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((28609778424 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(1, 1), (5, 2), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 10. -/
theorem ep_Q2_002_partial_10_0045_valid :
    mulPoly ep_Q2_002_coefficient_10_0045
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0046 : Poly :=
[
  term ((13859132629071240089231281011264 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 46 for generator 10. -/
def ep_Q2_002_partial_10_0046 : Poly :=
[
  term ((27718265258142480178462562022528 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1)],
  term ((27718265258142480178462562022528 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((-13859132629071240089231281011264 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (7, 1)],
  term ((-13859132629071240089231281011264 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 10. -/
theorem ep_Q2_002_partial_10_0046_valid :
    mulPoly ep_Q2_002_coefficient_10_0046
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0047 : Poly :=
[
  term ((3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 47 for generator 10. -/
def ep_Q2_002_partial_10_0047 : Poly :=
[
  term ((6138492155487164145886210713600 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (9, 1)],
  term ((6138492155487164145886210713600 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)],
  term ((-3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (8, 1), (9, 1)],
  term ((-3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 10. -/
theorem ep_Q2_002_partial_10_0047_valid :
    mulPoly ep_Q2_002_coefficient_10_0047
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0048 : Poly :=
[
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 48 for generator 10. -/
def ep_Q2_002_partial_10_0048 : Poly :=
[
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1)],
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (8, 1), (11, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 10. -/
theorem ep_Q2_002_partial_10_0048_valid :
    mulPoly ep_Q2_002_coefficient_10_0048
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0049 : Poly :=
[
  term ((2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 49 for generator 10. -/
def ep_Q2_002_partial_10_0049 : Poly :=
[
  term ((4594908401476729035822348179232 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (8, 1), (13, 1)],
  term ((4594908401476729035822348179232 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)],
  term ((-2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (8, 1), (13, 1)],
  term ((-2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 10. -/
theorem ep_Q2_002_partial_10_0049_valid :
    mulPoly ep_Q2_002_coefficient_10_0049
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0050 : Poly :=
[
  term ((69834863392086130148342987446859717937168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 50 for generator 10. -/
def ep_Q2_002_partial_10_0050 : Poly :=
[
  term ((139669726784172260296685974893719435874336 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1)],
  term ((139669726784172260296685974893719435874336 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)],
  term ((-69834863392086130148342987446859717937168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 2), (8, 1), (15, 1)],
  term ((-69834863392086130148342987446859717937168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 10. -/
theorem ep_Q2_002_partial_10_0050_valid :
    mulPoly ep_Q2_002_coefficient_10_0050
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0051 : Poly :=
[
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 10. -/
def ep_Q2_002_partial_10_0051 : Poly :=
[
  term ((21962661328 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((21962661328 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(1, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 10. -/
theorem ep_Q2_002_partial_10_0051_valid :
    mulPoly ep_Q2_002_coefficient_10_0051
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0052 : Poly :=
[
  term ((19299070212898203596753080445376 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 52 for generator 10. -/
def ep_Q2_002_partial_10_0052 : Poly :=
[
  term ((38598140425796407193506160890752 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((38598140425796407193506160890752 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-19299070212898203596753080445376 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (9, 1)],
  term ((-19299070212898203596753080445376 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 10. -/
theorem ep_Q2_002_partial_10_0052_valid :
    mulPoly ep_Q2_002_coefficient_10_0052
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0053 : Poly :=
[
  term ((-16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 53 for generator 10. -/
def ep_Q2_002_partial_10_0053 : Poly :=
[
  term ((-32714022639284573960692291260000 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (12, 1)],
  term ((-32714022639284573960692291260000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1)],
  term ((16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (9, 1), (12, 1)],
  term ((16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 10. -/
theorem ep_Q2_002_partial_10_0053_valid :
    mulPoly ep_Q2_002_coefficient_10_0053
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0054 : Poly :=
[
  term ((81291737340826660930365254536512 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

/-- Partial product 54 for generator 10. -/
def ep_Q2_002_partial_10_0054 : Poly :=
[
  term ((162583474681653321860730509073024 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((162583474681653321860730509073024 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-81291737340826660930365254536512 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (11, 1)],
  term ((-81291737340826660930365254536512 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 10. -/
theorem ep_Q2_002_partial_10_0054_valid :
    mulPoly ep_Q2_002_coefficient_10_0054
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0055 : Poly :=
[
  term ((-104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 55 for generator 10. -/
def ep_Q2_002_partial_10_0055 : Poly :=
[
  term ((-208738186299466223416143766305408 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((-208738186299466223416143766305408 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 10. -/
theorem ep_Q2_002_partial_10_0055_valid :
    mulPoly ep_Q2_002_coefficient_10_0055
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0056 : Poly :=
[
  term ((194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 56 for generator 10. -/
def ep_Q2_002_partial_10_0056 : Poly :=
[
  term ((388028617503576671401578300363648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((388028617503576671401578300363648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((-194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (12, 1), (13, 1)],
  term ((-194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 10. -/
theorem ep_Q2_002_partial_10_0056_valid :
    mulPoly ep_Q2_002_coefficient_10_0056
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0057 : Poly :=
[
  term ((978480514612818897900441953014673879114928 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 57 for generator 10. -/
def ep_Q2_002_partial_10_0057 : Poly :=
[
  term ((1956961029225637795800883906029347758229856 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((1956961029225637795800883906029347758229856 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-978480514612818897900441953014673879114928 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((-978480514612818897900441953014673879114928 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 10. -/
theorem ep_Q2_002_partial_10_0057_valid :
    mulPoly ep_Q2_002_coefficient_10_0057
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0058 : Poly :=
[
  term ((93561253224 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 10. -/
def ep_Q2_002_partial_10_0058 : Poly :=
[
  term ((187122506448 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((187122506448 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-93561253224 : Rat) / 7401317245) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-93561253224 : Rat) / 7401317245) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 10. -/
theorem ep_Q2_002_partial_10_0058_valid :
    mulPoly ep_Q2_002_coefficient_10_0058
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0059 : Poly :=
[
  term ((-200099850015214617952494061942104 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 59 for generator 10. -/
def ep_Q2_002_partial_10_0059 : Poly :=
[
  term ((-400199700030429235904988123884208 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-400199700030429235904988123884208 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((200099850015214617952494061942104 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (13, 1)],
  term ((200099850015214617952494061942104 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 10. -/
theorem ep_Q2_002_partial_10_0059_valid :
    mulPoly ep_Q2_002_coefficient_10_0059
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0060 : Poly :=
[
  term ((-12180213129176865820706989340582625766968 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (15, 1)]
]

/-- Partial product 60 for generator 10. -/
def ep_Q2_002_partial_10_0060 : Poly :=
[
  term ((-24360426258353731641413978681165251533936 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-24360426258353731641413978681165251533936 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((12180213129176865820706989340582625766968 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (4, 2), (15, 1)],
  term ((12180213129176865820706989340582625766968 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 10. -/
theorem ep_Q2_002_partial_10_0060_valid :
    mulPoly ep_Q2_002_coefficient_10_0060
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0061 : Poly :=
[
  term ((-1423808994 : Rat) / 157474835) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 10. -/
def ep_Q2_002_partial_10_0061 : Poly :=
[
  term ((-2847617988 : Rat) / 157474835) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-2847617988 : Rat) / 157474835) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((1423808994 : Rat) / 157474835) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((1423808994 : Rat) / 157474835) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 10. -/
theorem ep_Q2_002_partial_10_0061_valid :
    mulPoly ep_Q2_002_coefficient_10_0061
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0062 : Poly :=
[
  term ((-5767320608556325581589593691008 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 62 for generator 10. -/
def ep_Q2_002_partial_10_0062 : Poly :=
[
  term ((-11534641217112651163179187382016 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1)],
  term ((-11534641217112651163179187382016 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1)],
  term ((5767320608556325581589593691008 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2)],
  term ((5767320608556325581589593691008 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 10. -/
theorem ep_Q2_002_partial_10_0062_valid :
    mulPoly ep_Q2_002_coefficient_10_0062
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0063 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)]
]

/-- Partial product 63 for generator 10. -/
def ep_Q2_002_partial_10_0063 : Poly :=
[
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 2)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (5, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (5, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 10. -/
theorem ep_Q2_002_partial_10_0063_valid :
    mulPoly ep_Q2_002_coefficient_10_0063
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0064 : Poly :=
[
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1)]
]

/-- Partial product 64 for generator 10. -/
def ep_Q2_002_partial_10_0064 : Poly :=
[
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (6, 1)],
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (6, 1)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2), (6, 1)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 10. -/
theorem ep_Q2_002_partial_10_0064_valid :
    mulPoly ep_Q2_002_coefficient_10_0064
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0065 : Poly :=
[
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1)]
]

/-- Partial product 65 for generator 10. -/
def ep_Q2_002_partial_10_0065 : Poly :=
[
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (8, 1)],
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (8, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2), (8, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 10. -/
theorem ep_Q2_002_partial_10_0065_valid :
    mulPoly ep_Q2_002_coefficient_10_0065
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0066 : Poly :=
[
  term ((7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 66 for generator 10. -/
def ep_Q2_002_partial_10_0066 : Poly :=
[
  term ((14764142201124254450439772552704 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (12, 1)],
  term ((14764142201124254450439772552704 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (12, 1)],
  term ((-7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2), (12, 1)],
  term ((-7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 10. -/
theorem ep_Q2_002_partial_10_0066_valid :
    mulPoly ep_Q2_002_coefficient_10_0066
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0067 : Poly :=
[
  term ((-38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 67 for generator 10. -/
def ep_Q2_002_partial_10_0067 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 3), (11, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 10. -/
theorem ep_Q2_002_partial_10_0067_valid :
    mulPoly ep_Q2_002_coefficient_10_0067
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0068 : Poly :=
[
  term ((73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 68 for generator 10. -/
def ep_Q2_002_partial_10_0068 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (13, 1)],
  term ((-73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 2), (13, 1)],
  term ((-73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 3), (13, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 10. -/
theorem ep_Q2_002_partial_10_0068_valid :
    mulPoly ep_Q2_002_coefficient_10_0068
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0069 : Poly :=
[
  term ((463683485706429756570198543557597587069404 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 69 for generator 10. -/
def ep_Q2_002_partial_10_0069 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((-463683485706429756570198543557597587069404 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((-463683485706429756570198543557597587069404 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 3), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 10. -/
theorem ep_Q2_002_partial_10_0069_valid :
    mulPoly ep_Q2_002_coefficient_10_0069
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0070 : Poly :=
[
  term ((37512558977 : Rat) / 7401317245) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 10. -/
def ep_Q2_002_partial_10_0070 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-37512558977 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-37512558977 : Rat) / 7401317245) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 10. -/
theorem ep_Q2_002_partial_10_0070_valid :
    mulPoly ep_Q2_002_coefficient_10_0070
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0071 : Poly :=
[
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (7, 1)]
]

/-- Partial product 71 for generator 10. -/
def ep_Q2_002_partial_10_0071 : Poly :=
[
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (4, 1), (7, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (4, 2), (7, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (5, 2), (7, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(3, 2), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 10. -/
theorem ep_Q2_002_partial_10_0071_valid :
    mulPoly ep_Q2_002_coefficient_10_0071
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0072 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 72 for generator 10. -/
def ep_Q2_002_partial_10_0072 : Poly :=
[
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (8, 1), (11, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (11, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 10. -/
theorem ep_Q2_002_partial_10_0072_valid :
    mulPoly ep_Q2_002_coefficient_10_0072
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0073 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 73 for generator 10. -/
def ep_Q2_002_partial_10_0073 : Poly :=
[
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (8, 1), (13, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (13, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 10. -/
theorem ep_Q2_002_partial_10_0073_valid :
    mulPoly ep_Q2_002_coefficient_10_0073
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0074 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 74 for generator 10. -/
def ep_Q2_002_partial_10_0074 : Poly :=
[
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (8, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (8, 1), (15, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 10. -/
theorem ep_Q2_002_partial_10_0074_valid :
    mulPoly ep_Q2_002_coefficient_10_0074
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0075 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 10. -/
def ep_Q2_002_partial_10_0075 : Poly :=
[
  term ((21084059056 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((21084059056 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 10. -/
theorem ep_Q2_002_partial_10_0075_valid :
    mulPoly ep_Q2_002_coefficient_10_0075
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0076 : Poly :=
[
  term ((21933258987027267133711650855396 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1)]
]

/-- Partial product 76 for generator 10. -/
def ep_Q2_002_partial_10_0076 : Poly :=
[
  term ((43866517974054534267423301710792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-21933258987027267133711650855396 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (11, 1)],
  term ((-21933258987027267133711650855396 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1)],
  term ((43866517974054534267423301710792 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 10. -/
theorem ep_Q2_002_partial_10_0076_valid :
    mulPoly ep_Q2_002_coefficient_10_0076
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0077 : Poly :=
[
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 77 for generator 10. -/
def ep_Q2_002_partial_10_0077 : Poly :=
[
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 10. -/
theorem ep_Q2_002_partial_10_0077_valid :
    mulPoly ep_Q2_002_coefficient_10_0077
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0078 : Poly :=
[
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 78 for generator 10. -/
def ep_Q2_002_partial_10_0078 : Poly :=
[
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 2), (12, 1), (13, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 10. -/
theorem ep_Q2_002_partial_10_0078_valid :
    mulPoly ep_Q2_002_coefficient_10_0078
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0079 : Poly :=
[
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 79 for generator 10. -/
def ep_Q2_002_partial_10_0079 : Poly :=
[
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 10. -/
theorem ep_Q2_002_partial_10_0079_valid :
    mulPoly ep_Q2_002_coefficient_10_0079
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0080 : Poly :=
[
  term ((-37861474304 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 10. -/
def ep_Q2_002_partial_10_0080 : Poly :=
[
  term ((-75722948608 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-75722948608 : Rat) / 7401317245) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 10. -/
theorem ep_Q2_002_partial_10_0080_valid :
    mulPoly ep_Q2_002_coefficient_10_0080
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0081 : Poly :=
[
  term ((-41304434153496819979522424364432 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1)]
]

/-- Partial product 81 for generator 10. -/
def ep_Q2_002_partial_10_0081 : Poly :=
[
  term ((-82608868306993639959044848728864 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((41304434153496819979522424364432 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (13, 1)],
  term ((41304434153496819979522424364432 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (13, 1)],
  term ((-82608868306993639959044848728864 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 10. -/
theorem ep_Q2_002_partial_10_0081_valid :
    mulPoly ep_Q2_002_coefficient_10_0081
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0082 : Poly :=
[
  term ((-1646856460851577181067014829782215277313226 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 1)]
]

/-- Partial product 82 for generator 10. -/
def ep_Q2_002_partial_10_0082 : Poly :=
[
  term ((-3293712921703154362134029659564430554626452 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((1646856460851577181067014829782215277313226 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (15, 1)],
  term ((1646856460851577181067014829782215277313226 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (15, 1)],
  term ((-3293712921703154362134029659564430554626452 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 10. -/
theorem ep_Q2_002_partial_10_0082_valid :
    mulPoly ep_Q2_002_coefficient_10_0082
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0083 : Poly :=
[
  term ((-363192967633 : Rat) / 44407903470) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 10. -/
def ep_Q2_002_partial_10_0083 : Poly :=
[
  term ((-363192967633 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((363192967633 : Rat) / 44407903470) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((363192967633 : Rat) / 44407903470) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-363192967633 : Rat) / 22203951735) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 10. -/
theorem ep_Q2_002_partial_10_0083_valid :
    mulPoly ep_Q2_002_coefficient_10_0083
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0084 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 84 for generator 10. -/
def ep_Q2_002_partial_10_0084 : Poly :=
[
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 3), (11, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 10. -/
theorem ep_Q2_002_partial_10_0084_valid :
    mulPoly ep_Q2_002_coefficient_10_0084
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0085 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 85 for generator 10. -/
def ep_Q2_002_partial_10_0085 : Poly :=
[
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (5, 1), (13, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 2), (13, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 3), (13, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 10. -/
theorem ep_Q2_002_partial_10_0085_valid :
    mulPoly ep_Q2_002_coefficient_10_0085
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0086 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 86 for generator 10. -/
def ep_Q2_002_partial_10_0086 : Poly :=
[
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 3), (15, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 10. -/
theorem ep_Q2_002_partial_10_0086_valid :
    mulPoly ep_Q2_002_coefficient_10_0086
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0087 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 10. -/
def ep_Q2_002_partial_10_0087 : Poly :=
[
  term ((-381790635174 : Rat) / 7401317245) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 3), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 10. -/
theorem ep_Q2_002_partial_10_0087_valid :
    mulPoly ep_Q2_002_coefficient_10_0087
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0088 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 88 for generator 10. -/
def ep_Q2_002_partial_10_0088 : Poly :=
[
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (7, 1), (11, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 10. -/
theorem ep_Q2_002_partial_10_0088_valid :
    mulPoly ep_Q2_002_coefficient_10_0088
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0089 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 89 for generator 10. -/
def ep_Q2_002_partial_10_0089 : Poly :=
[
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (7, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 10. -/
theorem ep_Q2_002_partial_10_0089_valid :
    mulPoly ep_Q2_002_coefficient_10_0089
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0090 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 90 for generator 10. -/
def ep_Q2_002_partial_10_0090 : Poly :=
[
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 2), (7, 1), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 10. -/
theorem ep_Q2_002_partial_10_0090_valid :
    mulPoly ep_Q2_002_coefficient_10_0090
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0091 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 10. -/
def ep_Q2_002_partial_10_0091 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 10. -/
theorem ep_Q2_002_partial_10_0091_valid :
    mulPoly ep_Q2_002_coefficient_10_0091
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0092 : Poly :=
[
  term ((4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 92 for generator 10. -/
def ep_Q2_002_partial_10_0092 : Poly :=
[
  term ((9532982489528714641716547620000 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 2), (9, 1), (11, 1)],
  term ((9532982489528714641716547620000 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1)],
  term ((-4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(4, 1), (5, 2), (9, 1), (11, 1)],
  term ((-4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(4, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 10. -/
theorem ep_Q2_002_partial_10_0092_valid :
    mulPoly ep_Q2_002_coefficient_10_0092
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0093 : Poly :=
[
  term ((-8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 93 for generator 10. -/
def ep_Q2_002_partial_10_0093 : Poly :=
[
  term ((-17952391286587577275165841040000 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((-17952391286587577275165841040000 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(4, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 10. -/
theorem ep_Q2_002_partial_10_0093_valid :
    mulPoly ep_Q2_002_coefficient_10_0093
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0094 : Poly :=
[
  term ((-71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 94 for generator 10. -/
def ep_Q2_002_partial_10_0094 : Poly :=
[
  term ((-143080304186968136566776420717611394434016 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((-143080304186968136566776420717611394434016 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(4, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 10. -/
theorem ep_Q2_002_partial_10_0094_valid :
    mulPoly ep_Q2_002_coefficient_10_0094
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0095 : Poly :=
[
  term ((-10062159336 : Rat) / 1480263449) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 10. -/
def ep_Q2_002_partial_10_0095 : Poly :=
[
  term ((-20124318672 : Rat) / 1480263449) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-20124318672 : Rat) / 1480263449) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((10062159336 : Rat) / 1480263449) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((10062159336 : Rat) / 1480263449) [(4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 10. -/
theorem ep_Q2_002_partial_10_0095_valid :
    mulPoly ep_Q2_002_coefficient_10_0095
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0096 : Poly :=
[
  term ((-30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 96 for generator 10. -/
def ep_Q2_002_partial_10_0096 : Poly :=
[
  term ((-60063891619813708566081797671968 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((-60063891619813708566081797671968 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1)],
  term ((30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term ((30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 10. -/
theorem ep_Q2_002_partial_10_0096_valid :
    mulPoly ep_Q2_002_coefficient_10_0096
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0097 : Poly :=
[
  term ((-28016394201383116223453332639156907503968 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 97 for generator 10. -/
def ep_Q2_002_partial_10_0097 : Poly :=
[
  term ((-56032788402766232446906665278313815007936 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-56032788402766232446906665278313815007936 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((28016394201383116223453332639156907503968 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 2), (11, 1), (15, 1)],
  term ((28016394201383116223453332639156907503968 : Rat) / 269363643504064505317229453910785233499) [(4, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 10. -/
theorem ep_Q2_002_partial_10_0097_valid :
    mulPoly ep_Q2_002_coefficient_10_0097
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0098 : Poly :=
[
  term ((-7555141124 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 10. -/
def ep_Q2_002_partial_10_0098 : Poly :=
[
  term ((-15110282248 : Rat) / 1480263449) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 10. -/
theorem ep_Q2_002_partial_10_0098_valid :
    mulPoly ep_Q2_002_coefficient_10_0098
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0099 : Poly :=
[
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 99 for generator 10. -/
def ep_Q2_002_partial_10_0099 : Poly :=
[
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 2)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (11, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 10. -/
theorem ep_Q2_002_partial_10_0099_valid :
    mulPoly ep_Q2_002_coefficient_10_0099
        ep_Q2_002_generator_10_0000_0099 =
      ep_Q2_002_partial_10_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_10_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_10_0000,
  ep_Q2_002_partial_10_0001,
  ep_Q2_002_partial_10_0002,
  ep_Q2_002_partial_10_0003,
  ep_Q2_002_partial_10_0004,
  ep_Q2_002_partial_10_0005,
  ep_Q2_002_partial_10_0006,
  ep_Q2_002_partial_10_0007,
  ep_Q2_002_partial_10_0008,
  ep_Q2_002_partial_10_0009,
  ep_Q2_002_partial_10_0010,
  ep_Q2_002_partial_10_0011,
  ep_Q2_002_partial_10_0012,
  ep_Q2_002_partial_10_0013,
  ep_Q2_002_partial_10_0014,
  ep_Q2_002_partial_10_0015,
  ep_Q2_002_partial_10_0016,
  ep_Q2_002_partial_10_0017,
  ep_Q2_002_partial_10_0018,
  ep_Q2_002_partial_10_0019,
  ep_Q2_002_partial_10_0020,
  ep_Q2_002_partial_10_0021,
  ep_Q2_002_partial_10_0022,
  ep_Q2_002_partial_10_0023,
  ep_Q2_002_partial_10_0024,
  ep_Q2_002_partial_10_0025,
  ep_Q2_002_partial_10_0026,
  ep_Q2_002_partial_10_0027,
  ep_Q2_002_partial_10_0028,
  ep_Q2_002_partial_10_0029,
  ep_Q2_002_partial_10_0030,
  ep_Q2_002_partial_10_0031,
  ep_Q2_002_partial_10_0032,
  ep_Q2_002_partial_10_0033,
  ep_Q2_002_partial_10_0034,
  ep_Q2_002_partial_10_0035,
  ep_Q2_002_partial_10_0036,
  ep_Q2_002_partial_10_0037,
  ep_Q2_002_partial_10_0038,
  ep_Q2_002_partial_10_0039,
  ep_Q2_002_partial_10_0040,
  ep_Q2_002_partial_10_0041,
  ep_Q2_002_partial_10_0042,
  ep_Q2_002_partial_10_0043,
  ep_Q2_002_partial_10_0044,
  ep_Q2_002_partial_10_0045,
  ep_Q2_002_partial_10_0046,
  ep_Q2_002_partial_10_0047,
  ep_Q2_002_partial_10_0048,
  ep_Q2_002_partial_10_0049,
  ep_Q2_002_partial_10_0050,
  ep_Q2_002_partial_10_0051,
  ep_Q2_002_partial_10_0052,
  ep_Q2_002_partial_10_0053,
  ep_Q2_002_partial_10_0054,
  ep_Q2_002_partial_10_0055,
  ep_Q2_002_partial_10_0056,
  ep_Q2_002_partial_10_0057,
  ep_Q2_002_partial_10_0058,
  ep_Q2_002_partial_10_0059,
  ep_Q2_002_partial_10_0060,
  ep_Q2_002_partial_10_0061,
  ep_Q2_002_partial_10_0062,
  ep_Q2_002_partial_10_0063,
  ep_Q2_002_partial_10_0064,
  ep_Q2_002_partial_10_0065,
  ep_Q2_002_partial_10_0066,
  ep_Q2_002_partial_10_0067,
  ep_Q2_002_partial_10_0068,
  ep_Q2_002_partial_10_0069,
  ep_Q2_002_partial_10_0070,
  ep_Q2_002_partial_10_0071,
  ep_Q2_002_partial_10_0072,
  ep_Q2_002_partial_10_0073,
  ep_Q2_002_partial_10_0074,
  ep_Q2_002_partial_10_0075,
  ep_Q2_002_partial_10_0076,
  ep_Q2_002_partial_10_0077,
  ep_Q2_002_partial_10_0078,
  ep_Q2_002_partial_10_0079,
  ep_Q2_002_partial_10_0080,
  ep_Q2_002_partial_10_0081,
  ep_Q2_002_partial_10_0082,
  ep_Q2_002_partial_10_0083,
  ep_Q2_002_partial_10_0084,
  ep_Q2_002_partial_10_0085,
  ep_Q2_002_partial_10_0086,
  ep_Q2_002_partial_10_0087,
  ep_Q2_002_partial_10_0088,
  ep_Q2_002_partial_10_0089,
  ep_Q2_002_partial_10_0090,
  ep_Q2_002_partial_10_0091,
  ep_Q2_002_partial_10_0092,
  ep_Q2_002_partial_10_0093,
  ep_Q2_002_partial_10_0094,
  ep_Q2_002_partial_10_0095,
  ep_Q2_002_partial_10_0096,
  ep_Q2_002_partial_10_0097,
  ep_Q2_002_partial_10_0098,
  ep_Q2_002_partial_10_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_10_0000_0099 : Poly :=
[
  term ((-13233488274313808034080602159488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (3, 1), (4, 1)],
  term ((650985607840403286133370105856 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (2, 1), (4, 1), (9, 1)],
  term ((73270918151764402578708334477728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-113703570752905417624463928979584 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-30060014277753646848726705087948453705600 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((6616744137156904017040301079744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (4, 2)],
  term ((650985607840403286133370105856 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1)],
  term ((73270918151764402578708334477728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-113703570752905417624463928979584 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-30060014277753646848726705087948453705600 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((6616744137156904017040301079744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (5, 2)],
  term ((-13233488274313808034080602159488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1)],
  term ((-325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (4, 2), (9, 1)],
  term ((-36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 2), (11, 1)],
  term ((56851785376452708812231964489792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 2), (13, 1)],
  term ((15030007138876823424363352543974226852800 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-325492803920201643066685052928 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (5, 2), (9, 1)],
  term ((-36635459075882201289354167238864 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 2), (11, 1)],
  term ((56851785376452708812231964489792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 2), (13, 1)],
  term ((15030007138876823424363352543974226852800 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (2, 1), (4, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (3, 1), (5, 1)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (4, 2)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 2)],
  term ((187097516615978693580656883218976 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-352339661876891046276083347953792 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1)],
  term ((21806788670201686682918398970328418916784 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-16229651972 : Rat) / 1057331035) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (4, 1)],
  term ((-9203755506859992031558737011712 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1)],
  term ((17332395223292207667121978773504 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-125680104643955935309051620326730908775264 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((1711121560 : Rat) / 211466207) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((17618141769194460529190509958016 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-74875339584896861123608159960013319543936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((90542333872 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (4, 1), (12, 1)],
  term ((-1102761374464210094456582896276433888101248 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (4, 1), (13, 2)],
  term ((6034635537160107248868266512658646605630784 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((43597904272 : Rat) / 7401317245) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-93548758307989346790328441609488 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((176169830938445523138041673976896 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 2), (13, 1)],
  term ((-10903394335100843341459199485164209458392 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((8114825986 : Rat) / 1057331035) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((22040545240000606645968 : Rat) / 253528477699481291099) [(0, 1), (3, 1), (5, 1)],
  term ((-9203755506859992031558737011712 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((17332395223292207667121978773504 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-125680104643955935309051620326730908775264 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((1711121560 : Rat) / 211466207) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((17618141769194460529190509958016 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-74875339584896861123608159960013319543936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((90542333872 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (11, 2)],
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((-1102761374464210094456582896276433888101248 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((6034635537160107248868266512658646605630784 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((43597904272 : Rat) / 7401317245) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-93548758307989346790328441609488 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((176169830938445523138041673976896 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((-10903394335100843341459199485164209458392 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((8114825986 : Rat) / 1057331035) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((187097516615978693580656883218976 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-352339661876891046276083347953792 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((21806788670201686682918398970328418916784 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-16229651972 : Rat) / 1057331035) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (4, 2)],
  term ((4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (4, 2), (9, 1), (11, 1)],
  term ((-8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((-855560780 : Rat) / 211466207) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8809070884597230264595254979008 : Rat) / 97983883872014706756151952089) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((37437669792448430561804079980006659771968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 2), (11, 2)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (4, 2), (12, 1)],
  term ((551380687232105047228291448138216944050624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((-8611226768 : Rat) / 7401317245) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53778775441907758398250051093248 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 2), (13, 2)],
  term ((-3017317768580053624434133256329323302815392 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 2), (15, 2)],
  term ((-21798952136 : Rat) / 7401317245) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-11020272620000303322984 : Rat) / 253528477699481291099) [(0, 1), (5, 2)],
  term ((4601877753429996015779368505856 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 2), (9, 1), (11, 1)],
  term ((-8666197611646103833560989386752 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 2), (9, 1), (13, 1)],
  term ((62840052321977967654525810163365454387632 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((-855560780 : Rat) / 211466207) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8809070884597230264595254979008 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((37437669792448430561804079980006659771968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 2), (11, 1), (15, 1)],
  term ((-45271166936 : Rat) / 7401317245) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 2), (11, 2)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (5, 2), (12, 1)],
  term ((551380687232105047228291448138216944050624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((-8611226768 : Rat) / 7401317245) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53778775441907758398250051093248 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 2), (13, 2)],
  term ((-3017317768580053624434133256329323302815392 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 2), (15, 2)],
  term ((-21798952136 : Rat) / 7401317245) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-3102697789603101145482694892896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (8, 1)],
  term ((-441524184446328388600478033664 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2)],
  term ((246024715022372319716468176384 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (5, 1)],
  term ((3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (8, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)],
  term ((-10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (9, 1)],
  term ((-52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1)],
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (13, 1)],
  term ((-148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((28609778424 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((27718265258142480178462562022528 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1)],
  term ((6138492155487164145886210713600 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (9, 1)],
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1)],
  term ((4594908401476729035822348179232 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (8, 1), (13, 1)],
  term ((139669726784172260296685974893719435874336 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1)],
  term ((21962661328 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((38598140425796407193506160890752 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((-32714022639284573960692291260000 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (12, 1)],
  term ((162583474681653321860730509073024 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-208738186299466223416143766305408 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((388028617503576671401578300363648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((1956961029225637795800883906029347758229856 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((187122506448 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-400199700030429235904988123884208 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-24360426258353731641413978681165251533936 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-2847617988 : Rat) / 157474835) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 2), (5, 1)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (7, 1)],
  term ((-674271974722956393410992560000 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 2), (9, 1)],
  term ((-201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (13, 1)],
  term ((97918167902280366273854959101974440102848 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (7, 1)],
  term ((-674271974722956393410992560000 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (5, 1), (9, 1)],
  term ((-201086572147430651877056542516224 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (13, 1)],
  term ((97918167902280366273854959101974440102848 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-15647390047106029591609038407904 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 2)],
  term ((1551348894801550572741347446448 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2), (8, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 2), (12, 1)],
  term ((-2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 3)],
  term ((-10747495628440285586296902438144 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (9, 1)],
  term ((-52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1)],
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((-148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((28609778424 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((27718265258142480178462562022528 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((6138492155487164145886210713600 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)],
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1)],
  term ((4594908401476729035822348179232 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)],
  term ((139669726784172260296685974893719435874336 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)],
  term ((21962661328 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((38598140425796407193506160890752 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-32714022639284573960692291260000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1)],
  term ((162583474681653321860730509073024 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-208738186299466223416143766305408 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((388028617503576671401578300363648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((1956961029225637795800883906029347758229856 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((187122506448 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-400199700030429235904988123884208 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-24360426258353731641413978681165251533936 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-2847617988 : Rat) / 157474835) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((4257620760047646089622497386672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2)],
  term ((3059978786769918722373031008000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (8, 1)],
  term ((-4197848092128575373539161447680 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1)],
  term ((-3102697789603101145482694892896 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (8, 1)],
  term ((-441524184446328388600478033664 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 2), (7, 1)],
  term ((337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (5, 2), (9, 1)],
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 2), (11, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 2), (13, 1)],
  term ((-48959083951140183136927479550987220051424 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (5, 2), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 3)],
  term ((-123012357511186159858234088192 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (5, 1)],
  term ((-1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (5, 1), (8, 1)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (5, 1), (12, 1)],
  term ((5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (9, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (11, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (6, 1), (13, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 2), (6, 1), (15, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-13859132629071240089231281011264 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (7, 1)],
  term ((-3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (8, 1), (9, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (8, 1), (11, 1)],
  term ((-2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (8, 1), (13, 1)],
  term ((-69834863392086130148342987446859717937168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 2), (8, 1), (15, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(1, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-19299070212898203596753080445376 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (9, 1)],
  term ((16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (9, 1), (12, 1)],
  term ((-81291737340826660930365254536512 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (11, 1)],
  term ((104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((-194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (12, 1), (13, 1)],
  term ((-978480514612818897900441953014673879114928 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((-93561253224 : Rat) / 7401317245) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((200099850015214617952494061942104 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (13, 1)],
  term ((12180213129176865820706989340582625766968 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (4, 2), (15, 1)],
  term ((1423808994 : Rat) / 157474835) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 3), (5, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 3), (7, 1)],
  term ((337135987361478196705496280000 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 3), (9, 1)],
  term ((100543286073715325938528271258112 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 3), (11, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 3), (13, 1)],
  term ((-48959083951140183136927479550987220051424 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 3), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 3), (15, 1), (16, 1)],
  term ((5373747814220142793148451219072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (6, 1), (9, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (6, 1), (11, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (6, 1), (13, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 2), (6, 1), (15, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(1, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((-13859132629071240089231281011264 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (7, 1)],
  term ((-3069246077743582072943105356800 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (8, 1), (9, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (8, 1), (11, 1)],
  term ((-2297454200738364517911174089616 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (8, 1), (13, 1)],
  term ((-69834863392086130148342987446859717937168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-19299070212898203596753080445376 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (9, 1)],
  term ((16357011319642286980346145630000 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (9, 1), (12, 1)],
  term ((-81291737340826660930365254536512 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (11, 1)],
  term ((104369093149733111708071883152704 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((-194014308751788335700789150181824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (12, 1), (13, 1)],
  term ((-978480514612818897900441953014673879114928 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((-93561253224 : Rat) / 7401317245) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((200099850015214617952494061942104 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (13, 1)],
  term ((12180213129176865820706989340582625766968 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (5, 2), (15, 1)],
  term ((1423808994 : Rat) / 157474835) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-123012357511186159858234088192 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 3)],
  term ((-1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 3), (8, 1)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 3), (12, 1)],
  term ((-11534641217112651163179187382016 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1)],
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (6, 1)],
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (8, 1)],
  term ((14764142201124254450439772552704 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (12, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 2)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (5, 1)],
  term ((-11534641217112651163179187382016 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1)],
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (6, 1)],
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (8, 1)],
  term ((14764142201124254450439772552704 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (12, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (5, 2)],
  term ((5767320608556325581589593691008 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2), (6, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2), (8, 1)],
  term ((-7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 2), (12, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 3)],
  term ((5767320608556325581589593691008 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 2)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 2), (6, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 2), (8, 1)],
  term ((-7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 2), (12, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (4, 1), (7, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((21084059056 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((43866517974054534267423301710792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-75722948608 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-82608868306993639959044848728864 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-3293712921703154362134029659564430554626452 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-363192967633 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (13, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-7421491014476506720248 : Rat) / 253528477699481291099) [(2, 1), (4, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (5, 1), (13, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((9532982489528714641716547620000 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 2), (9, 1), (11, 1)],
  term ((-17952391286587577275165841040000 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((-143080304186968136566776420717611394434016 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((-20124318672 : Rat) / 1480263449) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-60063891619813708566081797671968 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((-56032788402766232446906665278313815007936 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 2)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((9532982489528714641716547620000 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1)],
  term ((-17952391286587577275165841040000 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((-143080304186968136566776420717611394434016 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-20124318672 : Rat) / 1480263449) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-60063891619813708566081797671968 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1)],
  term ((-56032788402766232446906665278313815007936 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 2)],
  term ((221225708494227181245562873640808 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((-416609438431609807493348846418336 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 2), (13, 1)],
  term ((-10357440538561179627648251600198404176381732 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((-419303194151 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (4, 2), (7, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (8, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (8, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (8, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-21933258987027267133711650855396 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (11, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 2), (12, 1), (13, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((41304434153496819979522424364432 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (13, 1)],
  term ((1646856460851577181067014829782215277313226 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (15, 1)],
  term ((363192967633 : Rat) / 44407903470) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 3), (11, 1)],
  term ((-73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 3), (13, 1)],
  term ((-463683485706429756570198543557597587069404 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 3), (15, 1)],
  term ((-37512558977 : Rat) / 7401317245) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((-7421491014476506720248 : Rat) / 253528477699481291099) [(3, 1), (5, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (5, 2), (7, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (8, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-21933258987027267133711650855396 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((41304434153496819979522424364432 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (13, 1)],
  term ((1646856460851577181067014829782215277313226 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (15, 1)],
  term ((363192967633 : Rat) / 44407903470) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(3, 2), (5, 1), (7, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (11, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((21084059056 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((43866517974054534267423301710792 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-75722948608 : Rat) / 7401317245) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-82608868306993639959044848728864 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1)],
  term ((-3293712921703154362134029659564430554626452 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 1)],
  term ((-363192967633 : Rat) / 22203951735) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (7, 1), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (7, 1), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 2), (7, 1), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(4, 1), (5, 2), (9, 1), (11, 1)],
  term ((8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((10062159336 : Rat) / 1480263449) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term ((28016394201383116223453332639156907503968 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 2), (11, 1), (15, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (11, 2)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 3), (11, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 3), (13, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 3), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 3), (15, 1), (16, 1)],
  term ((3710745507238253360124 : Rat) / 253528477699481291099) [(4, 2)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 3), (5, 1), (11, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 3), (5, 1), (13, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 3), (5, 1), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 3), (5, 1), (15, 1), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 3), (7, 1), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 3), (7, 1), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 3), (7, 1), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 3), (7, 1), (15, 1), (16, 1)],
  term ((-4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(4, 3), (9, 1), (11, 1)],
  term ((8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(4, 3), (9, 1), (13, 1)],
  term ((71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(4, 3), (9, 1), (15, 1)],
  term ((10062159336 : Rat) / 1480263449) [(4, 3), (9, 1), (15, 1), (16, 1)],
  term ((30031945809906854283040898835984 : Rat) / 1273790490336191187829975377157) [(4, 3), (11, 1), (13, 1)],
  term ((28016394201383116223453332639156907503968 : Rat) / 269363643504064505317229453910785233499) [(4, 3), (11, 1), (15, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 3), (11, 2)],
  term ((3710745507238253360124 : Rat) / 253528477699481291099) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 99. -/
theorem ep_Q2_002_block_10_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_10_0000_0099
      ep_Q2_002_block_10_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
