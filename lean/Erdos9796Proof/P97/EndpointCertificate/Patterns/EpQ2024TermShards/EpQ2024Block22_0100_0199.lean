/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 22:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_22_0100_0199 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0100 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 100 for generator 22. -/
def ep_Q2_024_partial_22_0100 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 2), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 22. -/
theorem ep_Q2_024_partial_22_0100_valid :
    mulPoly ep_Q2_024_coefficient_22_0100
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0101 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 22. -/
def ep_Q2_024_partial_22_0101 : Poly :=
[
  term ((-26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 22. -/
theorem ep_Q2_024_partial_22_0101_valid :
    mulPoly ep_Q2_024_coefficient_22_0101
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0102 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 102 for generator 22. -/
def ep_Q2_024_partial_22_0102 : Poly :=
[
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 22. -/
theorem ep_Q2_024_partial_22_0102_valid :
    mulPoly ep_Q2_024_coefficient_22_0102
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0103 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 22. -/
def ep_Q2_024_partial_22_0103 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 22. -/
theorem ep_Q2_024_partial_22_0103_valid :
    mulPoly ep_Q2_024_coefficient_22_0103
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0104 : Poly :=
[
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 104 for generator 22. -/
def ep_Q2_024_partial_22_0104 : Poly :=
[
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1)],
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 22. -/
theorem ep_Q2_024_partial_22_0104_valid :
    mulPoly ep_Q2_024_coefficient_22_0104
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0105 : Poly :=
[
  term ((50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 22. -/
def ep_Q2_024_partial_22_0105 : Poly :=
[
  term ((50972133270704143 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((50972133270704143 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 22. -/
theorem ep_Q2_024_partial_22_0105_valid :
    mulPoly ep_Q2_024_coefficient_22_0105
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0106 : Poly :=
[
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (13, 2)]
]

/-- Partial product 106 for generator 22. -/
def ep_Q2_024_partial_22_0106 : Poly :=
[
  term ((-16827039493084580281707108413782983104 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 2)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 2), (13, 2)],
  term ((-16827039493084580281707108413782983104 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 22. -/
theorem ep_Q2_024_partial_22_0106_valid :
    mulPoly ep_Q2_024_coefficient_22_0106
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0107 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 1)]
]

/-- Partial product 107 for generator 22. -/
def ep_Q2_024_partial_22_0107 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (13, 2), (14, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 22. -/
theorem ep_Q2_024_partial_22_0107_valid :
    mulPoly ep_Q2_024_coefficient_22_0107
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0108 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 108 for generator 22. -/
def ep_Q2_024_partial_22_0108 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 22. -/
theorem ep_Q2_024_partial_22_0108_valid :
    mulPoly ep_Q2_024_coefficient_22_0108
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0109 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 109 for generator 22. -/
def ep_Q2_024_partial_22_0109 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 2), (14, 1), (15, 2)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 22. -/
theorem ep_Q2_024_partial_22_0109_valid :
    mulPoly ep_Q2_024_coefficient_22_0109
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0110 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 22. -/
def ep_Q2_024_partial_22_0110 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 22. -/
theorem ep_Q2_024_partial_22_0110_valid :
    mulPoly ep_Q2_024_coefficient_22_0110
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0111 : Poly :=
[
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (5, 1), (15, 2)]
]

/-- Partial product 111 for generator 22. -/
def ep_Q2_024_partial_22_0111 : Poly :=
[
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2)],
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (5, 1), (8, 2), (15, 2)],
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (5, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 22. -/
theorem ep_Q2_024_partial_22_0111_valid :
    mulPoly ep_Q2_024_coefficient_22_0111
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0112 : Poly :=
[
  term ((-18569425277969695 : Rat) / 6976681326919158) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 22. -/
def ep_Q2_024_partial_22_0112 : Poly :=
[
  term ((-18569425277969695 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((18569425277969695 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((-18569425277969695 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((18569425277969695 : Rat) / 6976681326919158) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 22. -/
theorem ep_Q2_024_partial_22_0112_valid :
    mulPoly ep_Q2_024_coefficient_22_0112
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0113 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1)]
]

/-- Partial product 113 for generator 22. -/
def ep_Q2_024_partial_22_0113 : Poly :=
[
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 2), (9, 1)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 2), (11, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 22. -/
theorem ep_Q2_024_partial_22_0113_valid :
    mulPoly ep_Q2_024_coefficient_22_0113
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0114 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1)]
]

/-- Partial product 114 for generator 22. -/
def ep_Q2_024_partial_22_0114 : Poly :=
[
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (10, 1), (13, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 2), (13, 1)],
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 22. -/
theorem ep_Q2_024_partial_22_0114_valid :
    mulPoly ep_Q2_024_coefficient_22_0114
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0115 : Poly :=
[
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (15, 1)]
]

/-- Partial product 115 for generator 22. -/
def ep_Q2_024_partial_22_0115 : Poly :=
[
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 2), (15, 1)],
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 22. -/
theorem ep_Q2_024_partial_22_0115_valid :
    mulPoly ep_Q2_024_coefficient_22_0115
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0116 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 22. -/
def ep_Q2_024_partial_22_0116 : Poly :=
[
  term ((5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 2), (15, 1), (16, 1)],
  term ((5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 22. -/
theorem ep_Q2_024_partial_22_0116_valid :
    mulPoly ep_Q2_024_coefficient_22_0116
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0117 : Poly :=
[
  term ((-11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 117 for generator 22. -/
def ep_Q2_024_partial_22_0117 : Poly :=
[
  term ((-22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 3)],
  term ((-22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1), (10, 1)],
  term ((11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 22. -/
theorem ep_Q2_024_partial_22_0117_valid :
    mulPoly ep_Q2_024_coefficient_22_0117
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0118 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 118 for generator 22. -/
def ep_Q2_024_partial_22_0118 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 2), (10, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 22. -/
theorem ep_Q2_024_partial_22_0118_valid :
    mulPoly ep_Q2_024_coefficient_22_0118
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0119 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 119 for generator 22. -/
def ep_Q2_024_partial_22_0119 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (9, 2), (12, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 22. -/
theorem ep_Q2_024_partial_22_0119_valid :
    mulPoly ep_Q2_024_coefficient_22_0119
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0120 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 22. -/
def ep_Q2_024_partial_22_0120 : Poly :=
[
  term ((-2172308402631610 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 22. -/
theorem ep_Q2_024_partial_22_0120_valid :
    mulPoly ep_Q2_024_coefficient_22_0120
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0121 : Poly :=
[
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 121 for generator 22. -/
def ep_Q2_024_partial_22_0121 : Poly :=
[
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 22. -/
theorem ep_Q2_024_partial_22_0121_valid :
    mulPoly ep_Q2_024_coefficient_22_0121
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0122 : Poly :=
[
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 122 for generator 22. -/
def ep_Q2_024_partial_22_0122 : Poly :=
[
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 22. -/
theorem ep_Q2_024_partial_22_0122_valid :
    mulPoly ep_Q2_024_coefficient_22_0122
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0123 : Poly :=
[
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 22. -/
def ep_Q2_024_partial_22_0123 : Poly :=
[
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 22. -/
theorem ep_Q2_024_partial_22_0123_valid :
    mulPoly ep_Q2_024_coefficient_22_0123
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0124 : Poly :=
[
  term ((-709891983423132512425701016598283247877 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1)]
]

/-- Partial product 124 for generator 22. -/
def ep_Q2_024_partial_22_0124 : Poly :=
[
  term ((-1419783966846265024851402033196566495754 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((709891983423132512425701016598283247877 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 2), (9, 1)],
  term ((-1419783966846265024851402033196566495754 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 2), (11, 1)],
  term ((709891983423132512425701016598283247877 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 22. -/
theorem ep_Q2_024_partial_22_0124_valid :
    mulPoly ep_Q2_024_coefficient_22_0124
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0125 : Poly :=
[
  term ((-268900419930076167133268781742444633706 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 125 for generator 22. -/
def ep_Q2_024_partial_22_0125 : Poly :=
[
  term ((-537800839860152334266537563484889267412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((268900419930076167133268781742444633706 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (9, 1), (12, 1)],
  term ((-537800839860152334266537563484889267412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((268900419930076167133268781742444633706 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 22. -/
theorem ep_Q2_024_partial_22_0125_valid :
    mulPoly ep_Q2_024_coefficient_22_0125
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0126 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 126 for generator 22. -/
def ep_Q2_024_partial_22_0126 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 22. -/
theorem ep_Q2_024_partial_22_0126_valid :
    mulPoly ep_Q2_024_coefficient_22_0126
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0127 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 127 for generator 22. -/
def ep_Q2_024_partial_22_0127 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 2), (9, 1), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 22. -/
theorem ep_Q2_024_partial_22_0127_valid :
    mulPoly ep_Q2_024_coefficient_22_0127
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0128 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 22. -/
def ep_Q2_024_partial_22_0128 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (8, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 22. -/
theorem ep_Q2_024_partial_22_0128_valid :
    mulPoly ep_Q2_024_coefficient_22_0128
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0129 : Poly :=
[
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 129 for generator 22. -/
def ep_Q2_024_partial_22_0129 : Poly :=
[
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 22. -/
theorem ep_Q2_024_partial_22_0129_valid :
    mulPoly ep_Q2_024_coefficient_22_0129
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0130 : Poly :=
[
  term ((-5546629823834425 : Rat) / 3488340663459579) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 22. -/
def ep_Q2_024_partial_22_0130 : Poly :=
[
  term ((-11093259647668850 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5546629823834425 : Rat) / 3488340663459579) [(1, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11093259647668850 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5546629823834425 : Rat) / 3488340663459579) [(1, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 22. -/
theorem ep_Q2_024_partial_22_0130_valid :
    mulPoly ep_Q2_024_coefficient_22_0130
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0131 : Poly :=
[
  term ((572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 131 for generator 22. -/
def ep_Q2_024_partial_22_0131 : Poly :=
[
  term ((1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((-572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1), (13, 2)],
  term ((1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((-572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 22. -/
theorem ep_Q2_024_partial_22_0131_valid :
    mulPoly ep_Q2_024_coefficient_22_0131
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0132 : Poly :=
[
  term ((-11154942474783490019806576401546751128841 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 132 for generator 22. -/
def ep_Q2_024_partial_22_0132 : Poly :=
[
  term ((-22309884949566980039613152803093502257682 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((11154942474783490019806576401546751128841 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1), (14, 1)],
  term ((-22309884949566980039613152803093502257682 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((11154942474783490019806576401546751128841 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 22. -/
theorem ep_Q2_024_partial_22_0132_valid :
    mulPoly ep_Q2_024_coefficient_22_0132
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0133 : Poly :=
[
  term ((-12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 133 for generator 22. -/
def ep_Q2_024_partial_22_0133 : Poly :=
[
  term ((-24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 2), (9, 1), (15, 2)],
  term ((-24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 22. -/
theorem ep_Q2_024_partial_22_0133_valid :
    mulPoly ep_Q2_024_coefficient_22_0133
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0134 : Poly :=
[
  term ((5481382992466540 : Rat) / 3488340663459579) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 134 for generator 22. -/
def ep_Q2_024_partial_22_0134 : Poly :=
[
  term ((10962765984933080 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5481382992466540 : Rat) / 3488340663459579) [(1, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((10962765984933080 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5481382992466540 : Rat) / 3488340663459579) [(1, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 22. -/
theorem ep_Q2_024_partial_22_0134_valid :
    mulPoly ep_Q2_024_coefficient_22_0134
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0135 : Poly :=
[
  term ((-388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (13, 1)]
]

/-- Partial product 135 for generator 22. -/
def ep_Q2_024_partial_22_0135 : Poly :=
[
  term ((-777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 2), (10, 1), (13, 1)],
  term ((388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (9, 2), (13, 1)],
  term ((-777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (11, 1), (13, 1)],
  term ((388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 22. -/
theorem ep_Q2_024_partial_22_0135_valid :
    mulPoly ep_Q2_024_coefficient_22_0135
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0136 : Poly :=
[
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (9, 2), (15, 1)]
]

/-- Partial product 136 for generator 22. -/
def ep_Q2_024_partial_22_0136 : Poly :=
[
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (8, 2), (9, 2), (15, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 3), (11, 1), (15, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (9, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 22. -/
theorem ep_Q2_024_partial_22_0136_valid :
    mulPoly ep_Q2_024_coefficient_22_0136
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0137 : Poly :=
[
  term ((-4111658236248574 : Rat) / 3488340663459579) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 22. -/
def ep_Q2_024_partial_22_0137 : Poly :=
[
  term ((-8223316472497148 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-8223316472497148 : Rat) / 3488340663459579) [(1, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 22. -/
theorem ep_Q2_024_partial_22_0137_valid :
    mulPoly ep_Q2_024_coefficient_22_0137
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0138 : Poly :=
[
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3)]
]

/-- Partial product 138 for generator 22. -/
def ep_Q2_024_partial_22_0138 : Poly :=
[
  term ((-694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 3), (10, 1)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (9, 3)],
  term ((-694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 4), (11, 1)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 22. -/
theorem ep_Q2_024_partial_22_0138_valid :
    mulPoly ep_Q2_024_coefficient_22_0138
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0139 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1)]
]

/-- Partial product 139 for generator 22. -/
def ep_Q2_024_partial_22_0139 : Poly :=
[
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (11, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 22. -/
theorem ep_Q2_024_partial_22_0139_valid :
    mulPoly ep_Q2_024_coefficient_22_0139
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0140 : Poly :=
[
  term ((-1898371868100087743594411361506379069742 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 140 for generator 22. -/
def ep_Q2_024_partial_22_0140 : Poly :=
[
  term ((-3796743736200175487188822723012758139484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((1898371868100087743594411361506379069742 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((-3796743736200175487188822723012758139484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((1898371868100087743594411361506379069742 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 22. -/
theorem ep_Q2_024_partial_22_0140_valid :
    mulPoly ep_Q2_024_coefficient_22_0140
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0141 : Poly :=
[
  term ((-42909472764549491911562600027119346908 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 141 for generator 22. -/
def ep_Q2_024_partial_22_0141 : Poly :=
[
  term ((-85818945529098983823125200054238693816 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((42909472764549491911562600027119346908 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-85818945529098983823125200054238693816 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((42909472764549491911562600027119346908 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 22. -/
theorem ep_Q2_024_partial_22_0141_valid :
    mulPoly ep_Q2_024_coefficient_22_0141
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0142 : Poly :=
[
  term ((1403410586911539101722818996254767804704436022321238011 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 142 for generator 22. -/
def ep_Q2_024_partial_22_0142 : Poly :=
[
  term ((1403410586911539101722818996254767804704436022321238011 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1403410586911539101722818996254767804704436022321238011 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((1403410586911539101722818996254767804704436022321238011 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1403410586911539101722818996254767804704436022321238011 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (9, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 22. -/
theorem ep_Q2_024_partial_22_0142_valid :
    mulPoly ep_Q2_024_coefficient_22_0142
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0143 : Poly :=
[
  term ((-1920121942356757 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 22. -/
def ep_Q2_024_partial_22_0143 : Poly :=
[
  term ((-3840243884713514 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1920121942356757 : Rat) / 1162780221153193) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3840243884713514 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1920121942356757 : Rat) / 1162780221153193) [(1, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 22. -/
theorem ep_Q2_024_partial_22_0143_valid :
    mulPoly ep_Q2_024_coefficient_22_0143
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0144 : Poly :=
[
  term ((364768916546188383918646812989369681079497077398027885109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 144 for generator 22. -/
def ep_Q2_024_partial_22_0144 : Poly :=
[
  term ((364768916546188383918646812989369681079497077398027885109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-364768916546188383918646812989369681079497077398027885109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((364768916546188383918646812989369681079497077398027885109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-364768916546188383918646812989369681079497077398027885109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 22. -/
theorem ep_Q2_024_partial_22_0144_valid :
    mulPoly ep_Q2_024_coefficient_22_0144
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0145 : Poly :=
[
  term ((-16839460218917375 : Rat) / 2325560442306386) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 22. -/
def ep_Q2_024_partial_22_0145 : Poly :=
[
  term ((-16839460218917375 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16839460218917375 : Rat) / 2325560442306386) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16839460218917375 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16839460218917375 : Rat) / 2325560442306386) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 22. -/
theorem ep_Q2_024_partial_22_0145_valid :
    mulPoly ep_Q2_024_coefficient_22_0145
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0146 : Poly :=
[
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 146 for generator 22. -/
def ep_Q2_024_partial_22_0146 : Poly :=
[
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (12, 2), (13, 1)],
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 22. -/
theorem ep_Q2_024_partial_22_0146_valid :
    mulPoly ep_Q2_024_coefficient_22_0146
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0147 : Poly :=
[
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 147 for generator 22. -/
def ep_Q2_024_partial_22_0147 : Poly :=
[
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (12, 2), (15, 1)],
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (9, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 22. -/
theorem ep_Q2_024_partial_22_0147_valid :
    mulPoly ep_Q2_024_coefficient_22_0147
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0148 : Poly :=
[
  term ((4786310756398640 : Rat) / 1162780221153193) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 22. -/
def ep_Q2_024_partial_22_0148 : Poly :=
[
  term ((9572621512797280 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((9572621512797280 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 22. -/
theorem ep_Q2_024_partial_22_0148_valid :
    mulPoly ep_Q2_024_coefficient_22_0148
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0149 : Poly :=
[
  term ((94876219863891650688646675071813891412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1)]
]

/-- Partial product 149 for generator 22. -/
def ep_Q2_024_partial_22_0149 : Poly :=
[
  term ((189752439727783301377293350143627782824 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-94876219863891650688646675071813891412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (13, 1)],
  term ((189752439727783301377293350143627782824 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-94876219863891650688646675071813891412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 22. -/
theorem ep_Q2_024_partial_22_0149_valid :
    mulPoly ep_Q2_024_coefficient_22_0149
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0150 : Poly :=
[
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 150 for generator 22. -/
def ep_Q2_024_partial_22_0150 : Poly :=
[
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (13, 1), (14, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 22. -/
theorem ep_Q2_024_partial_22_0150_valid :
    mulPoly ep_Q2_024_coefficient_22_0150
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0151 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 151 for generator 22. -/
def ep_Q2_024_partial_22_0151 : Poly :=
[
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 2), (13, 1), (15, 2)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 22. -/
theorem ep_Q2_024_partial_22_0151_valid :
    mulPoly ep_Q2_024_coefficient_22_0151
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0152 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 152 for generator 22. -/
def ep_Q2_024_partial_22_0152 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 22. -/
theorem ep_Q2_024_partial_22_0152_valid :
    mulPoly ep_Q2_024_coefficient_22_0152
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0153 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 153 for generator 22. -/
def ep_Q2_024_partial_22_0153 : Poly :=
[
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (13, 2), (15, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 22. -/
theorem ep_Q2_024_partial_22_0153_valid :
    mulPoly ep_Q2_024_coefficient_22_0153
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0154 : Poly :=
[
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 154 for generator 22. -/
def ep_Q2_024_partial_22_0154 : Poly :=
[
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 22. -/
theorem ep_Q2_024_partial_22_0154_valid :
    mulPoly ep_Q2_024_coefficient_22_0154
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0155 : Poly :=
[
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 22. -/
def ep_Q2_024_partial_22_0155 : Poly :=
[
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 22. -/
theorem ep_Q2_024_partial_22_0155_valid :
    mulPoly ep_Q2_024_coefficient_22_0155
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0156 : Poly :=
[
  term ((-29850748666056569877892383898972042709119844136625216543 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (15, 1)]
]

/-- Partial product 156 for generator 22. -/
def ep_Q2_024_partial_22_0156 : Poly :=
[
  term ((-59701497332113139755784767797944085418239688273250433086 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((29850748666056569877892383898972042709119844136625216543 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 2), (15, 1)],
  term ((-59701497332113139755784767797944085418239688273250433086 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((29850748666056569877892383898972042709119844136625216543 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 22. -/
theorem ep_Q2_024_partial_22_0156_valid :
    mulPoly ep_Q2_024_coefficient_22_0156
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0157 : Poly :=
[
  term ((4534706418544402 : Rat) / 1162780221153193) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 22. -/
def ep_Q2_024_partial_22_0157 : Poly :=
[
  term ((9069412837088804 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4534706418544402 : Rat) / 1162780221153193) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((9069412837088804 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4534706418544402 : Rat) / 1162780221153193) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 22. -/
theorem ep_Q2_024_partial_22_0157_valid :
    mulPoly ep_Q2_024_coefficient_22_0157
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0158 : Poly :=
[
  term ((-6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2)]
]

/-- Partial product 158 for generator 22. -/
def ep_Q2_024_partial_22_0158 : Poly :=
[
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 1), (10, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 2)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (9, 1), (11, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 22. -/
theorem ep_Q2_024_partial_22_0158_valid :
    mulPoly ep_Q2_024_coefficient_22_0158
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0159 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1)]
]

/-- Partial product 159 for generator 22. -/
def ep_Q2_024_partial_22_0159 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 1), (10, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 22. -/
theorem ep_Q2_024_partial_22_0159_valid :
    mulPoly ep_Q2_024_coefficient_22_0159
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0160 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1)]
]

/-- Partial product 160 for generator 22. -/
def ep_Q2_024_partial_22_0160 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 1), (10, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 22. -/
theorem ep_Q2_024_partial_22_0160_valid :
    mulPoly ep_Q2_024_coefficient_22_0160
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0161 : Poly :=
[
  term ((113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 1)]
]

/-- Partial product 161 for generator 22. -/
def ep_Q2_024_partial_22_0161 : Poly :=
[
  term ((226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 2), (9, 1)],
  term ((226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 2), (11, 1)],
  term ((-113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 22. -/
theorem ep_Q2_024_partial_22_0161_valid :
    mulPoly ep_Q2_024_coefficient_22_0161
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0162 : Poly :=
[
  term ((127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (13, 1)]
]

/-- Partial product 162 for generator 22. -/
def ep_Q2_024_partial_22_0162 : Poly :=
[
  term ((254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 2), (13, 1)],
  term ((254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 22. -/
theorem ep_Q2_024_partial_22_0162_valid :
    mulPoly ep_Q2_024_coefficient_22_0162
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0163 : Poly :=
[
  term ((121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (15, 1)]
]

/-- Partial product 163 for generator 22. -/
def ep_Q2_024_partial_22_0163 : Poly :=
[
  term ((243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 2), (15, 1)],
  term ((243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 22. -/
theorem ep_Q2_024_partial_22_0163_valid :
    mulPoly ep_Q2_024_coefficient_22_0163
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0164 : Poly :=
[
  term ((-3108648400624064 : Rat) / 3488340663459579) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 22. -/
def ep_Q2_024_partial_22_0164 : Poly :=
[
  term ((-6217296801248128 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3108648400624064 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-6217296801248128 : Rat) / 3488340663459579) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3108648400624064 : Rat) / 3488340663459579) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 22. -/
theorem ep_Q2_024_partial_22_0164_valid :
    mulPoly ep_Q2_024_coefficient_22_0164
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0165 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1)]
]

/-- Partial product 165 for generator 22. -/
def ep_Q2_024_partial_22_0165 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (9, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2), (10, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 22. -/
theorem ep_Q2_024_partial_22_0165_valid :
    mulPoly ep_Q2_024_coefficient_22_0165
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0166 : Poly :=
[
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 1), (13, 1)]
]

/-- Partial product 166 for generator 22. -/
def ep_Q2_024_partial_22_0166 : Poly :=
[
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 2), (9, 1), (13, 1)],
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 22. -/
theorem ep_Q2_024_partial_22_0166_valid :
    mulPoly ep_Q2_024_coefficient_22_0166
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0167 : Poly :=
[
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (9, 1), (15, 1)]
]

/-- Partial product 167 for generator 22. -/
def ep_Q2_024_partial_22_0167 : Poly :=
[
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 2), (9, 1), (15, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 22. -/
theorem ep_Q2_024_partial_22_0167_valid :
    mulPoly ep_Q2_024_coefficient_22_0167
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0168 : Poly :=
[
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 22. -/
def ep_Q2_024_partial_22_0168 : Poly :=
[
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 22. -/
theorem ep_Q2_024_partial_22_0168_valid :
    mulPoly ep_Q2_024_coefficient_22_0168
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0169 : Poly :=
[
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 2)]
]

/-- Partial product 169 for generator 22. -/
def ep_Q2_024_partial_22_0169 : Poly :=
[
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 2), (10, 1)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 2), (9, 2)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 3), (11, 1)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 22. -/
theorem ep_Q2_024_partial_22_0169_valid :
    mulPoly ep_Q2_024_coefficient_22_0169
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0170 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (12, 1)]
]

/-- Partial product 170 for generator 22. -/
def ep_Q2_024_partial_22_0170 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 2), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 22. -/
theorem ep_Q2_024_partial_22_0170_valid :
    mulPoly ep_Q2_024_coefficient_22_0170
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0171 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 171 for generator 22. -/
def ep_Q2_024_partial_22_0171 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 22. -/
theorem ep_Q2_024_partial_22_0171_valid :
    mulPoly ep_Q2_024_coefficient_22_0171
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0172 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (12, 1), (15, 2)]
]

/-- Partial product 172 for generator 22. -/
def ep_Q2_024_partial_22_0172 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 2), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 22. -/
theorem ep_Q2_024_partial_22_0172_valid :
    mulPoly ep_Q2_024_coefficient_22_0172
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0173 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 173 for generator 22. -/
def ep_Q2_024_partial_22_0173 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 2), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 2), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 2), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 22. -/
theorem ep_Q2_024_partial_22_0173_valid :
    mulPoly ep_Q2_024_coefficient_22_0173
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0174 : Poly :=
[
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 2), (13, 1), (15, 1)]
]

/-- Partial product 174 for generator 22. -/
def ep_Q2_024_partial_22_0174 : Poly :=
[
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 2), (8, 2), (13, 1), (15, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 22. -/
theorem ep_Q2_024_partial_22_0174_valid :
    mulPoly ep_Q2_024_coefficient_22_0174
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0175 : Poly :=
[
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 22. -/
def ep_Q2_024_partial_22_0175 : Poly :=
[
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 22. -/
theorem ep_Q2_024_partial_22_0175_valid :
    mulPoly ep_Q2_024_coefficient_22_0175
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0176 : Poly :=
[
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (13, 2)]
]

/-- Partial product 176 for generator 22. -/
def ep_Q2_024_partial_22_0176 : Poly :=
[
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 1), (10, 1), (13, 2)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 2), (13, 2)],
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 22. -/
theorem ep_Q2_024_partial_22_0176_valid :
    mulPoly ep_Q2_024_coefficient_22_0176
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0177 : Poly :=
[
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (14, 1)]
]

/-- Partial product 177 for generator 22. -/
def ep_Q2_024_partial_22_0177 : Poly :=
[
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2), (14, 1)],
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 22. -/
theorem ep_Q2_024_partial_22_0177_valid :
    mulPoly ep_Q2_024_coefficient_22_0177
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0178 : Poly :=
[
  term ((183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (15, 2)]
]

/-- Partial product 178 for generator 22. -/
def ep_Q2_024_partial_22_0178 : Poly :=
[
  term ((366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 2), (15, 2)],
  term ((366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 22. -/
theorem ep_Q2_024_partial_22_0178_valid :
    mulPoly ep_Q2_024_coefficient_22_0178
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0179 : Poly :=
[
  term ((-25488046036701884 : Rat) / 3488340663459579) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 179 for generator 22. -/
def ep_Q2_024_partial_22_0179 : Poly :=
[
  term ((-50976092073403768 : Rat) / 3488340663459579) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((25488046036701884 : Rat) / 3488340663459579) [(1, 2), (8, 2), (15, 2), (16, 1)],
  term ((-50976092073403768 : Rat) / 3488340663459579) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((25488046036701884 : Rat) / 3488340663459579) [(1, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 22. -/
theorem ep_Q2_024_partial_22_0179_valid :
    mulPoly ep_Q2_024_coefficient_22_0179
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0180 : Poly :=
[
  term ((8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1)]
]

/-- Partial product 180 for generator 22. -/
def ep_Q2_024_partial_22_0180 : Poly :=
[
  term ((8838886483165088967005567625924723984461 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (8, 1), (10, 1)],
  term ((-8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (8, 2)],
  term ((8838886483165088967005567625924723984461 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (11, 1)],
  term ((-8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 22. -/
theorem ep_Q2_024_partial_22_0180_valid :
    mulPoly ep_Q2_024_coefficient_22_0180
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0181 : Poly :=
[
  term ((-1110841326159505488463936782069110285432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 181 for generator 22. -/
def ep_Q2_024_partial_22_0181 : Poly :=
[
  term ((-2221682652319010976927873564138220570864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (8, 1), (9, 1), (10, 1)],
  term ((1110841326159505488463936782069110285432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (8, 2), (9, 1)],
  term ((-2221682652319010976927873564138220570864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 2), (11, 1)],
  term ((1110841326159505488463936782069110285432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 22. -/
theorem ep_Q2_024_partial_22_0181_valid :
    mulPoly ep_Q2_024_coefficient_22_0181
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0182 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 182 for generator 22. -/
def ep_Q2_024_partial_22_0182 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (8, 2), (12, 1), (13, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 22. -/
theorem ep_Q2_024_partial_22_0182_valid :
    mulPoly ep_Q2_024_coefficient_22_0182
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0183 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 183 for generator 22. -/
def ep_Q2_024_partial_22_0183 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (8, 2), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 22. -/
theorem ep_Q2_024_partial_22_0183_valid :
    mulPoly ep_Q2_024_coefficient_22_0183
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0184 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 22. -/
def ep_Q2_024_partial_22_0184 : Poly :=
[
  term ((2606770083157932 : Rat) / 1162780221153193) [(2, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((2606770083157932 : Rat) / 1162780221153193) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 22. -/
theorem ep_Q2_024_partial_22_0184_valid :
    mulPoly ep_Q2_024_coefficient_22_0184
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0185 : Poly :=
[
  term ((-1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 185 for generator 22. -/
def ep_Q2_024_partial_22_0185 : Poly :=
[
  term ((-3504485659930053500775475367129999833064 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (8, 1), (10, 1), (13, 1)],
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (8, 2), (13, 1)],
  term ((-3504485659930053500775475367129999833064 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1)],
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 22. -/
theorem ep_Q2_024_partial_22_0185_valid :
    mulPoly ep_Q2_024_coefficient_22_0185
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0186 : Poly :=
[
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 186 for generator 22. -/
def ep_Q2_024_partial_22_0186 : Poly :=
[
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (8, 2), (15, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 22. -/
theorem ep_Q2_024_partial_22_0186_valid :
    mulPoly ep_Q2_024_coefficient_22_0186
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0187 : Poly :=
[
  term ((966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 22. -/
def ep_Q2_024_partial_22_0187 : Poly :=
[
  term ((1932218386597130 : Rat) / 3488340663459579) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((1932218386597130 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 22. -/
theorem ep_Q2_024_partial_22_0187_valid :
    mulPoly ep_Q2_024_coefficient_22_0187
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0188 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2)]
]

/-- Partial product 188 for generator 22. -/
def ep_Q2_024_partial_22_0188 : Poly :=
[
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (8, 1), (10, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (8, 2)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 22. -/
theorem ep_Q2_024_partial_22_0188_valid :
    mulPoly ep_Q2_024_coefficient_22_0188
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0189 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1)]
]

/-- Partial product 189 for generator 22. -/
def ep_Q2_024_partial_22_0189 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (8, 1), (10, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (8, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 22. -/
theorem ep_Q2_024_partial_22_0189_valid :
    mulPoly ep_Q2_024_coefficient_22_0189
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0190 : Poly :=
[
  term ((-6816985141994252313096503774600108644 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 190 for generator 22. -/
def ep_Q2_024_partial_22_0190 : Poly :=
[
  term ((-13633970283988504626193007549200217288 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((6816985141994252313096503774600108644 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (8, 2), (9, 1)],
  term ((-13633970283988504626193007549200217288 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (9, 2), (11, 1)],
  term ((6816985141994252313096503774600108644 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 22. -/
theorem ep_Q2_024_partial_22_0190_valid :
    mulPoly ep_Q2_024_coefficient_22_0190
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0191 : Poly :=
[
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 191 for generator 22. -/
def ep_Q2_024_partial_22_0191 : Poly :=
[
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 2), (11, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (11, 2)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 22. -/
theorem ep_Q2_024_partial_22_0191_valid :
    mulPoly ep_Q2_024_coefficient_22_0191
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0192 : Poly :=
[
  term ((-8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 192 for generator 22. -/
def ep_Q2_024_partial_22_0192 : Poly :=
[
  term ((-17957837051705303744531236616307816752 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 2), (13, 1)],
  term ((-17957837051705303744531236616307816752 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 22. -/
theorem ep_Q2_024_partial_22_0192_valid :
    mulPoly ep_Q2_024_coefficient_22_0192
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0193 : Poly :=
[
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 193 for generator 22. -/
def ep_Q2_024_partial_22_0193 : Poly :=
[
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 22. -/
theorem ep_Q2_024_partial_22_0193_valid :
    mulPoly ep_Q2_024_coefficient_22_0193
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0194 : Poly :=
[
  term ((895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 22. -/
def ep_Q2_024_partial_22_0194 : Poly :=
[
  term ((1791984949037708 : Rat) / 1162780221153193) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((1791984949037708 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 22. -/
theorem ep_Q2_024_partial_22_0194_valid :
    mulPoly ep_Q2_024_coefficient_22_0194
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0195 : Poly :=
[
  term ((-1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 195 for generator 22. -/
def ep_Q2_024_partial_22_0195 : Poly :=
[
  term ((-3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 2), (9, 1)],
  term ((-3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 2), (11, 1)],
  term ((1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 22. -/
theorem ep_Q2_024_partial_22_0195_valid :
    mulPoly ep_Q2_024_coefficient_22_0195
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0196 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 196 for generator 22. -/
def ep_Q2_024_partial_22_0196 : Poly :=
[
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 2), (11, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 22. -/
theorem ep_Q2_024_partial_22_0196_valid :
    mulPoly ep_Q2_024_coefficient_22_0196
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0197 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 197 for generator 22. -/
def ep_Q2_024_partial_22_0197 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 22. -/
theorem ep_Q2_024_partial_22_0197_valid :
    mulPoly ep_Q2_024_coefficient_22_0197
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0198 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 198 for generator 22. -/
def ep_Q2_024_partial_22_0198 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 22. -/
theorem ep_Q2_024_partial_22_0198_valid :
    mulPoly ep_Q2_024_coefficient_22_0198
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0199 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 22. -/
def ep_Q2_024_partial_22_0199 : Poly :=
[
  term ((-868923361052644 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 22. -/
theorem ep_Q2_024_partial_22_0199_valid :
    mulPoly ep_Q2_024_coefficient_22_0199
        ep_Q2_024_generator_22_0100_0199 =
      ep_Q2_024_partial_22_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_22_0100_0199 : List Poly :=
[
  ep_Q2_024_partial_22_0100,
  ep_Q2_024_partial_22_0101,
  ep_Q2_024_partial_22_0102,
  ep_Q2_024_partial_22_0103,
  ep_Q2_024_partial_22_0104,
  ep_Q2_024_partial_22_0105,
  ep_Q2_024_partial_22_0106,
  ep_Q2_024_partial_22_0107,
  ep_Q2_024_partial_22_0108,
  ep_Q2_024_partial_22_0109,
  ep_Q2_024_partial_22_0110,
  ep_Q2_024_partial_22_0111,
  ep_Q2_024_partial_22_0112,
  ep_Q2_024_partial_22_0113,
  ep_Q2_024_partial_22_0114,
  ep_Q2_024_partial_22_0115,
  ep_Q2_024_partial_22_0116,
  ep_Q2_024_partial_22_0117,
  ep_Q2_024_partial_22_0118,
  ep_Q2_024_partial_22_0119,
  ep_Q2_024_partial_22_0120,
  ep_Q2_024_partial_22_0121,
  ep_Q2_024_partial_22_0122,
  ep_Q2_024_partial_22_0123,
  ep_Q2_024_partial_22_0124,
  ep_Q2_024_partial_22_0125,
  ep_Q2_024_partial_22_0126,
  ep_Q2_024_partial_22_0127,
  ep_Q2_024_partial_22_0128,
  ep_Q2_024_partial_22_0129,
  ep_Q2_024_partial_22_0130,
  ep_Q2_024_partial_22_0131,
  ep_Q2_024_partial_22_0132,
  ep_Q2_024_partial_22_0133,
  ep_Q2_024_partial_22_0134,
  ep_Q2_024_partial_22_0135,
  ep_Q2_024_partial_22_0136,
  ep_Q2_024_partial_22_0137,
  ep_Q2_024_partial_22_0138,
  ep_Q2_024_partial_22_0139,
  ep_Q2_024_partial_22_0140,
  ep_Q2_024_partial_22_0141,
  ep_Q2_024_partial_22_0142,
  ep_Q2_024_partial_22_0143,
  ep_Q2_024_partial_22_0144,
  ep_Q2_024_partial_22_0145,
  ep_Q2_024_partial_22_0146,
  ep_Q2_024_partial_22_0147,
  ep_Q2_024_partial_22_0148,
  ep_Q2_024_partial_22_0149,
  ep_Q2_024_partial_22_0150,
  ep_Q2_024_partial_22_0151,
  ep_Q2_024_partial_22_0152,
  ep_Q2_024_partial_22_0153,
  ep_Q2_024_partial_22_0154,
  ep_Q2_024_partial_22_0155,
  ep_Q2_024_partial_22_0156,
  ep_Q2_024_partial_22_0157,
  ep_Q2_024_partial_22_0158,
  ep_Q2_024_partial_22_0159,
  ep_Q2_024_partial_22_0160,
  ep_Q2_024_partial_22_0161,
  ep_Q2_024_partial_22_0162,
  ep_Q2_024_partial_22_0163,
  ep_Q2_024_partial_22_0164,
  ep_Q2_024_partial_22_0165,
  ep_Q2_024_partial_22_0166,
  ep_Q2_024_partial_22_0167,
  ep_Q2_024_partial_22_0168,
  ep_Q2_024_partial_22_0169,
  ep_Q2_024_partial_22_0170,
  ep_Q2_024_partial_22_0171,
  ep_Q2_024_partial_22_0172,
  ep_Q2_024_partial_22_0173,
  ep_Q2_024_partial_22_0174,
  ep_Q2_024_partial_22_0175,
  ep_Q2_024_partial_22_0176,
  ep_Q2_024_partial_22_0177,
  ep_Q2_024_partial_22_0178,
  ep_Q2_024_partial_22_0179,
  ep_Q2_024_partial_22_0180,
  ep_Q2_024_partial_22_0181,
  ep_Q2_024_partial_22_0182,
  ep_Q2_024_partial_22_0183,
  ep_Q2_024_partial_22_0184,
  ep_Q2_024_partial_22_0185,
  ep_Q2_024_partial_22_0186,
  ep_Q2_024_partial_22_0187,
  ep_Q2_024_partial_22_0188,
  ep_Q2_024_partial_22_0189,
  ep_Q2_024_partial_22_0190,
  ep_Q2_024_partial_22_0191,
  ep_Q2_024_partial_22_0192,
  ep_Q2_024_partial_22_0193,
  ep_Q2_024_partial_22_0194,
  ep_Q2_024_partial_22_0195,
  ep_Q2_024_partial_22_0196,
  ep_Q2_024_partial_22_0197,
  ep_Q2_024_partial_22_0198,
  ep_Q2_024_partial_22_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_22_0100_0199 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((50972133270704143 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16827039493084580281707108413782983104 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 2)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2)],
  term ((-18569425277969695 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 2), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 2), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (13, 2), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 2), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (5, 1), (8, 2), (15, 2)],
  term ((18569425277969695 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((50972133270704143 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16827039493084580281707108413782983104 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-18569425277969695 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (9, 2), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (13, 2), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (9, 2), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (5, 1), (9, 2), (15, 2)],
  term ((18569425277969695 : Rat) / 6976681326919158) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 1)],
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (10, 1), (13, 1)],
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1)],
  term ((5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 2), (9, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 2), (13, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 2), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 2), (15, 1), (16, 1)],
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1)],
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1)],
  term ((5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 2), (11, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (9, 2), (13, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (9, 2), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 3)],
  term ((-1419783966846265024851402033196566495754 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((-537800839860152334266537563484889267412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-11093259647668850 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((-22309884949566980039613152803093502257682 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((10962765984933080 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 2), (10, 1), (13, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1)],
  term ((-8223316472497148 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (9, 2), (12, 1), (15, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 3)],
  term ((-694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 3), (10, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-3796743736200175487188822723012758139484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-85818945529098983823125200054238693816 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1403410586911539101722818996254767804704436022321238011 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3840243884713514 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((364768916546188383918646812989369681079497077398027885109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16839460218917375 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((9572621512797280 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((189752439727783301377293350143627782824 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59701497332113139755784767797944085418239688273250433086 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((9069412837088804 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((709891983423132512425701016598283247877 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 2), (9, 1)],
  term ((-22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1), (10, 1)],
  term ((268900419930076167133268781742444633706 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (9, 1), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 2), (9, 1), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (8, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((5546629823834425 : Rat) / 3488340663459579) [(1, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1), (13, 2)],
  term ((11154942474783490019806576401546751128841 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1), (14, 1)],
  term ((12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 2), (9, 1), (15, 2)],
  term ((-5481382992466540 : Rat) / 3488340663459579) [(1, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (9, 2), (13, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (8, 2), (9, 2), (15, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (9, 3)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 2), (10, 1), (12, 1), (13, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (11, 1)],
  term ((1898371868100087743594411361506379069742 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((42909472764549491911562600027119346908 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-1403410586911539101722818996254767804704436022321238011 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((1920121942356757 : Rat) / 1162780221153193) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-364768916546188383918646812989369681079497077398027885109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((16839460218917375 : Rat) / 2325560442306386) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (12, 2), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (12, 2), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-94876219863891650688646675071813891412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (13, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (13, 1), (14, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 2), (13, 1), (15, 2)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 2), (13, 2), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((29850748666056569877892383898972042709119844136625216543 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 2), (15, 1)],
  term ((-4534706418544402 : Rat) / 1162780221153193) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 3), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 3), (12, 1), (13, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 3), (12, 1), (15, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 3), (12, 1), (15, 1), (16, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 3), (13, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 3), (15, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 3), (15, 1), (16, 1)],
  term ((-3796743736200175487188822723012758139484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-85818945529098983823125200054238693816 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1403410586911539101722818996254767804704436022321238011 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3840243884713514 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((364768916546188383918646812989369681079497077398027885109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16839460218917375 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((9572621512797280 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((189752439727783301377293350143627782824 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59701497332113139755784767797944085418239688273250433086 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((9069412837088804 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2)],
  term ((7155309201289561491440784038424741251132 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 2), (11, 1)],
  term ((-537800839860152334266537563484889267412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-11093259647668850 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((-22309884949566980039613152803093502257682 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((-24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((10962765984933080 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((1898371868100087743594411361506379069742 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((42909472764549491911562600027119346908 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((-1403410586911539101722818996254767804704436022321238011 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((1920121942356757 : Rat) / 1162780221153193) [(1, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-364768916546188383918646812989369681079497077398027885109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((16839460218917375 : Rat) / 2325560442306386) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (12, 2), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (9, 2), (12, 2), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-94876219863891650688646675071813891412 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (13, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (13, 2), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((29850748666056569877892383898972042709119844136625216543 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (15, 1)],
  term ((-4534706418544402 : Rat) / 1162780221153193) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((709891983423132512425701016598283247877 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 3)],
  term ((-777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (11, 1), (13, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 3), (11, 1), (15, 1)],
  term ((-8223316472497148 : Rat) / 3488340663459579) [(1, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((268900419930076167133268781742444633706 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 3), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 3), (13, 1), (15, 1)],
  term ((5546629823834425 : Rat) / 3488340663459579) [(1, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 3), (13, 2)],
  term ((11154942474783490019806576401546751128841 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 3), (14, 1)],
  term ((12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 3), (15, 2)],
  term ((-5481382992466540 : Rat) / 3488340663459579) [(1, 1), (9, 3), (15, 2), (16, 1)],
  term ((-694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 4), (11, 1)],
  term ((388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 4), (13, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (9, 4), (15, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (9, 4), (15, 1), (16, 1)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 5)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 1), (10, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (9, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 1), (10, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (9, 2)],
  term ((226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-6217296801248128 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 2), (9, 1)],
  term ((-127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 2), (13, 1)],
  term ((-121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 2), (15, 1)],
  term ((3108648400624064 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6217296801248128 : Rat) / 3488340663459579) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 2), (11, 1)],
  term ((-127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 2), (13, 1)],
  term ((-121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (9, 2), (15, 1)],
  term ((3108648400624064 : Rat) / 3488340663459579) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 3)],
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (9, 2)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (9, 2), (10, 1)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 1), (10, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 2), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 1), (10, 1), (13, 2)],
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-50976092073403768 : Rat) / 3488340663459579) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (8, 2)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 2), (9, 1), (13, 1)],
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (8, 2), (9, 1), (15, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 2), (9, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2), (10, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (8, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (8, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 2), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 2), (8, 2), (13, 1), (15, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (8, 2), (13, 2)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 2), (14, 1)],
  term ((-183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (8, 2), (15, 2)],
  term ((25488046036701884 : Rat) / 3488340663459579) [(1, 2), (8, 2), (15, 2), (16, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 3)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (9, 1), (11, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-50976092073403768 : Rat) / 3488340663459579) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (9, 2)],
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (9, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 2), (9, 2), (13, 1), (15, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (9, 2), (13, 2)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (9, 2), (14, 1)],
  term ((-183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (9, 2), (15, 2)],
  term ((25488046036701884 : Rat) / 3488340663459579) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 3), (11, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 3), (13, 1)],
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (9, 3), (15, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 2), (9, 3), (15, 1), (16, 1)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 4)],
  term ((-2221682652319010976927873564138220570864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (8, 1), (9, 1), (10, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((2606770083157932 : Rat) / 1162780221153193) [(2, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3504485659930053500775475367129999833064 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((1932218386597130 : Rat) / 3488340663459579) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1110841326159505488463936782069110285432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (8, 2), (9, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (8, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (8, 2), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (8, 2), (13, 1)],
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (8, 2), (15, 1)],
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2606770083157932 : Rat) / 1162780221153193) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3504485659930053500775475367129999833064 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((1932218386597130 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2221682652319010976927873564138220570864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 2), (11, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (9, 2), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (9, 2), (13, 1)],
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (9, 2), (15, 1)],
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((1110841326159505488463936782069110285432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (9, 3)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (8, 1), (10, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (8, 2)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (9, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (8, 1), (10, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (8, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (9, 2)],
  term ((-13633970283988504626193007549200217288 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-17957837051705303744531236616307816752 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((1791984949037708 : Rat) / 1162780221153193) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((6816985141994252313096503774600108644 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (8, 2), (9, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 2), (11, 1)],
  term ((8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 2), (13, 1)],
  term ((13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((-895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-17957837051705303744531236616307816752 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((1791984949037708 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (11, 2)],
  term ((175905215983731963736908235666359537236 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 2), (11, 1)],
  term ((8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 2), (13, 1)],
  term ((13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((-895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((6816985141994252313096503774600108644 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (9, 3)],
  term ((-3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 2), (9, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 2), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-248803817893532431802476213416155484248 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (9, 2), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (9, 2), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 3)],
  term ((8838886483165088967005567625924723984461 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (8, 1), (10, 1)],
  term ((-8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (8, 2)],
  term ((8838886483165088967005567625924723984461 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (11, 1)],
  term ((-8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 100 through 199. -/
theorem ep_Q2_024_block_22_0100_0199_valid :
    checkProductSumEq ep_Q2_024_partials_22_0100_0199
      ep_Q2_024_block_22_0100_0199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
