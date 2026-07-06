/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 14:0-73

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 14 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_14_0000_0073 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0000 : Poly :=
[
  term ((-2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 0 for generator 14. -/
def ep_Q2_002_partial_14_0000 : Poly :=
[
  term ((-4343962172078347478826566635776 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1)],
  term ((-4343962172078347478826566635776 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 2)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem ep_Q2_002_partial_14_0000_valid :
    mulPoly ep_Q2_002_coefficient_14_0000
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0001 : Poly :=
[
  term ((33770792182696798759242357279504 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 1 for generator 14. -/
def ep_Q2_002_partial_14_0001 : Poly :=
[
  term ((67541584365393597518484714559008 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1)],
  term ((67541584365393597518484714559008 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-33770792182696798759242357279504 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (11, 1)],
  term ((-33770792182696798759242357279504 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem ep_Q2_002_partial_14_0001_valid :
    mulPoly ep_Q2_002_coefficient_14_0001
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0002 : Poly :=
[
  term ((-54531849723613019284804345942656 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 2 for generator 14. -/
def ep_Q2_002_partial_14_0002 : Poly :=
[
  term ((-109063699447226038569608691885312 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-109063699447226038569608691885312 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 1), (13, 1)],
  term ((54531849723613019284804345942656 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((54531849723613019284804345942656 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem ep_Q2_002_partial_14_0002_valid :
    mulPoly ep_Q2_002_coefficient_14_0002
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0003 : Poly :=
[
  term ((-13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 3 for generator 14. -/
def ep_Q2_002_partial_14_0003 : Poly :=
[
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1)],
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem ep_Q2_002_partial_14_0003_valid :
    mulPoly ep_Q2_002_coefficient_14_0003
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0004 : Poly :=
[
  term ((-621830788 : Rat) / 211466207) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def ep_Q2_002_partial_14_0004 : Poly :=
[
  term ((-1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem ep_Q2_002_partial_14_0004_valid :
    mulPoly ep_Q2_002_coefficient_14_0004
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0005 : Poly :=
[
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)]
]

/-- Partial product 5 for generator 14. -/
def ep_Q2_002_partial_14_0005 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (4, 1), (8, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (9, 1)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 2)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem ep_Q2_002_partial_14_0005_valid :
    mulPoly ep_Q2_002_coefficient_14_0005
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0006 : Poly :=
[
  term ((30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 6 for generator 14. -/
def ep_Q2_002_partial_14_0006 : Poly :=
[
  term ((61415744497779026055717781071552 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((61415744497779026055717781071552 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (11, 1)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem ep_Q2_002_partial_14_0006_valid :
    mulPoly ep_Q2_002_coefficient_14_0006
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0007 : Poly :=
[
  term ((-57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 7 for generator 14. -/
def ep_Q2_002_partial_14_0007 : Poly :=
[
  term ((-115657348326433855053127110998784 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-115657348326433855053127110998784 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (13, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem ep_Q2_002_partial_14_0007_valid :
    mulPoly ep_Q2_002_coefficient_14_0007
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0008 : Poly :=
[
  term ((65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 8 for generator 14. -/
def ep_Q2_002_partial_14_0008 : Poly :=
[
  term ((131933703589237654381819223291143646430192 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((131933703589237654381819223291143646430192 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem ep_Q2_002_partial_14_0008_valid :
    mulPoly ep_Q2_002_coefficient_14_0008
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0009 : Poly :=
[
  term ((-18196285962 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def ep_Q2_002_partial_14_0009 : Poly :=
[
  term ((-36392571924 : Rat) / 7401317245) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-36392571924 : Rat) / 7401317245) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((18196285962 : Rat) / 7401317245) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((18196285962 : Rat) / 7401317245) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem ep_Q2_002_partial_14_0009_valid :
    mulPoly ep_Q2_002_coefficient_14_0009
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0010 : Poly :=
[
  term ((5446909082602386919813022300592 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 10 for generator 14. -/
def ep_Q2_002_partial_14_0010 : Poly :=
[
  term ((10893818165204773839626044601184 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((10893818165204773839626044601184 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5446909082602386919813022300592 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-5446909082602386919813022300592 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem ep_Q2_002_partial_14_0010_valid :
    mulPoly ep_Q2_002_coefficient_14_0010
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0011 : Poly :=
[
  term ((-24645709800957294802019553391820053076472 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 11 for generator 14. -/
def ep_Q2_002_partial_14_0011 : Poly :=
[
  term ((-49291419601914589604039106783640106152944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-49291419601914589604039106783640106152944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((24645709800957294802019553391820053076472 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((24645709800957294802019553391820053076472 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem ep_Q2_002_partial_14_0011_valid :
    mulPoly ep_Q2_002_coefficient_14_0011
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0012 : Poly :=
[
  term ((3906079158 : Rat) / 1480263449) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 14. -/
def ep_Q2_002_partial_14_0012 : Poly :=
[
  term ((7812158316 : Rat) / 1480263449) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7812158316 : Rat) / 1480263449) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3906079158 : Rat) / 1480263449) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3906079158 : Rat) / 1480263449) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem ep_Q2_002_partial_14_0012_valid :
    mulPoly ep_Q2_002_coefficient_14_0012
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0013 : Poly :=
[
  term ((-35473852364785830683739332369424 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 13 for generator 14. -/
def ep_Q2_002_partial_14_0013 : Poly :=
[
  term ((-70947704729571661367478664738848 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (11, 2)],
  term ((-70947704729571661367478664738848 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((35473852364785830683739332369424 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 2)],
  term ((35473852364785830683739332369424 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem ep_Q2_002_partial_14_0013_valid :
    mulPoly ep_Q2_002_coefficient_14_0013
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0014 : Poly :=
[
  term ((539140928449078286429195165342481447163056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 14 for generator 14. -/
def ep_Q2_002_partial_14_0014 : Poly :=
[
  term ((1078281856898156572858390330684962894326112 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((1078281856898156572858390330684962894326112 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-539140928449078286429195165342481447163056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((-539140928449078286429195165342481447163056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem ep_Q2_002_partial_14_0014_valid :
    mulPoly ep_Q2_002_coefficient_14_0014
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0015 : Poly :=
[
  term ((54028051048 : Rat) / 7401317245) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 14. -/
def ep_Q2_002_partial_14_0015 : Poly :=
[
  term ((108056102096 : Rat) / 7401317245) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((108056102096 : Rat) / 7401317245) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54028051048 : Rat) / 7401317245) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54028051048 : Rat) / 7401317245) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem ep_Q2_002_partial_14_0015_valid :
    mulPoly ep_Q2_002_coefficient_14_0015
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0016 : Poly :=
[
  term ((115546717994459373008859056542272 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 16 for generator 14. -/
def ep_Q2_002_partial_14_0016 : Poly :=
[
  term ((231093435988918746017718113084544 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (13, 2)],
  term ((231093435988918746017718113084544 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (13, 2)],
  term ((-115546717994459373008859056542272 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (13, 2)],
  term ((-115546717994459373008859056542272 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem ep_Q2_002_partial_14_0016_valid :
    mulPoly ep_Q2_002_coefficient_14_0016
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0017 : Poly :=
[
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1)]
]

/-- Partial product 17 for generator 14. -/
def ep_Q2_002_partial_14_0017 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (8, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 2)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem ep_Q2_002_partial_14_0017_valid :
    mulPoly ep_Q2_002_coefficient_14_0017
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0018 : Poly :=
[
  term ((3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 18 for generator 14. -/
def ep_Q2_002_partial_14_0018 : Poly :=
[
  term ((6342589642776111934360499493696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (9, 2)],
  term ((-3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (9, 1)],
  term ((-3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 3)],
  term ((6342589642776111934360499493696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem ep_Q2_002_partial_14_0018_valid :
    mulPoly ep_Q2_002_coefficient_14_0018
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0019 : Poly :=
[
  term ((-1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 19 for generator 14. -/
def ep_Q2_002_partial_14_0019 : Poly :=
[
  term ((-3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (13, 1)],
  term ((1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (13, 1)],
  term ((-3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem ep_Q2_002_partial_14_0019_valid :
    mulPoly ep_Q2_002_coefficient_14_0019
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0020 : Poly :=
[
  term ((3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 20 for generator 14. -/
def ep_Q2_002_partial_14_0020 : Poly :=
[
  term ((6342589642776111934360499493696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (8, 2)],
  term ((-3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((-3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 3)],
  term ((6342589642776111934360499493696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 14. -/
theorem ep_Q2_002_partial_14_0020_valid :
    mulPoly ep_Q2_002_coefficient_14_0020
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0021 : Poly :=
[
  term ((-3629029660696095986886585140928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 21 for generator 14. -/
def ep_Q2_002_partial_14_0021 : Poly :=
[
  term ((-7258059321392191973773170281856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1)],
  term ((3629029660696095986886585140928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((3629029660696095986886585140928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2), (12, 1)],
  term ((-7258059321392191973773170281856 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 14. -/
theorem ep_Q2_002_partial_14_0021_valid :
    mulPoly ep_Q2_002_coefficient_14_0021
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0022 : Poly :=
[
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 22 for generator 14. -/
def ep_Q2_002_partial_14_0022 : Poly :=
[
  term ((-6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (8, 1), (11, 1)],
  term ((-6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 2), (11, 1)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 14. -/
theorem ep_Q2_002_partial_14_0022_valid :
    mulPoly ep_Q2_002_coefficient_14_0022
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0023 : Poly :=
[
  term ((-500695655922951785827570819872 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 23 for generator 14. -/
def ep_Q2_002_partial_14_0023 : Poly :=
[
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (8, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((500695655922951785827570819872 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 2)],
  term ((500695655922951785827570819872 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 14. -/
theorem ep_Q2_002_partial_14_0023_valid :
    mulPoly ep_Q2_002_coefficient_14_0023
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0024 : Poly :=
[
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 24 for generator 14. -/
def ep_Q2_002_partial_14_0024 : Poly :=
[
  term ((-2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (13, 1)],
  term ((-2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 14. -/
theorem ep_Q2_002_partial_14_0024_valid :
    mulPoly ep_Q2_002_coefficient_14_0024
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0025 : Poly :=
[
  term ((1799777882550993637011965436240 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

/-- Partial product 25 for generator 14. -/
def ep_Q2_002_partial_14_0025 : Poly :=
[
  term ((3599555765101987274023930872480 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (11, 1)],
  term ((3599555765101987274023930872480 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-1799777882550993637011965436240 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (11, 1)],
  term ((-1799777882550993637011965436240 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 14. -/
theorem ep_Q2_002_partial_14_0025_valid :
    mulPoly ep_Q2_002_coefficient_14_0025
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0026 : Poly :=
[
  term ((-4861513572552869650106801228736 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 26 for generator 14. -/
def ep_Q2_002_partial_14_0026 : Poly :=
[
  term ((-9723027145105739300213602457472 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1)],
  term ((-9723027145105739300213602457472 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((4861513572552869650106801228736 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((4861513572552869650106801228736 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 14. -/
theorem ep_Q2_002_partial_14_0026_valid :
    mulPoly ep_Q2_002_coefficient_14_0026
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0027 : Poly :=
[
  term ((2599436164501261818653737711392 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 27 for generator 14. -/
def ep_Q2_002_partial_14_0027 : Poly :=
[
  term ((5198872329002523637307475422784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((5198872329002523637307475422784 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-2599436164501261818653737711392 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)],
  term ((-2599436164501261818653737711392 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 14. -/
theorem ep_Q2_002_partial_14_0027_valid :
    mulPoly ep_Q2_002_coefficient_14_0027
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0028 : Poly :=
[
  term ((-1202710990653814026377884627045488620472 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (15, 1)]
]

/-- Partial product 28 for generator 14. -/
def ep_Q2_002_partial_14_0028 : Poly :=
[
  term ((-2405421981307628052755769254090977240944 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (4, 1), (8, 1), (15, 1)],
  term ((-2405421981307628052755769254090977240944 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((1202710990653814026377884627045488620472 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (8, 2), (15, 1)],
  term ((1202710990653814026377884627045488620472 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 14. -/
theorem ep_Q2_002_partial_14_0028_valid :
    mulPoly ep_Q2_002_coefficient_14_0028
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0029 : Poly :=
[
  term ((-5917002858 : Rat) / 7401317245) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 14. -/
def ep_Q2_002_partial_14_0029 : Poly :=
[
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((5917002858 : Rat) / 7401317245) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((5917002858 : Rat) / 7401317245) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 14. -/
theorem ep_Q2_002_partial_14_0029_valid :
    mulPoly ep_Q2_002_coefficient_14_0029
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0030 : Poly :=
[
  term ((-127299068078992532494224093120 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 30 for generator 14. -/
def ep_Q2_002_partial_14_0030 : Poly :=
[
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1)],
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1)],
  term ((127299068078992532494224093120 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2)],
  term ((127299068078992532494224093120 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 14. -/
theorem ep_Q2_002_partial_14_0030_valid :
    mulPoly ep_Q2_002_coefficient_14_0030
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0031 : Poly :=
[
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1)]
]

/-- Partial product 31 for generator 14. -/
def ep_Q2_002_partial_14_0031 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (11, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 2), (11, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 14. -/
theorem ep_Q2_002_partial_14_0031_valid :
    mulPoly ep_Q2_002_coefficient_14_0031
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0032 : Poly :=
[
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1)]
]

/-- Partial product 32 for generator 14. -/
def ep_Q2_002_partial_14_0032 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 2), (13, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 14. -/
theorem ep_Q2_002_partial_14_0032_valid :
    mulPoly ep_Q2_002_coefficient_14_0032
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0033 : Poly :=
[
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 1)]
]

/-- Partial product 33 for generator 14. -/
def ep_Q2_002_partial_14_0033 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (8, 1), (15, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 2), (15, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 14. -/
theorem ep_Q2_002_partial_14_0033_valid :
    mulPoly ep_Q2_002_coefficient_14_0033
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0034 : Poly :=
[
  term ((2635507382 : Rat) / 7401317245) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 14. -/
def ep_Q2_002_partial_14_0034 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 14. -/
theorem ep_Q2_002_partial_14_0034_valid :
    mulPoly ep_Q2_002_coefficient_14_0034
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0035 : Poly :=
[
  term ((-44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 35 for generator 14. -/
def ep_Q2_002_partial_14_0035 : Poly :=
[
  term ((-89672711115858124947947791537392 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 2), (11, 1)],
  term ((44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (9, 1), (11, 1)],
  term ((44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 3), (11, 1)],
  term ((-89672711115858124947947791537392 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 14. -/
theorem ep_Q2_002_partial_14_0035_valid :
    mulPoly ep_Q2_002_coefficient_14_0035
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0036 : Poly :=
[
  term ((84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 36 for generator 14. -/
def ep_Q2_002_partial_14_0036 : Poly :=
[
  term ((168870508201321849269776150576064 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((-84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (9, 1), (13, 1)],
  term ((-84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 3), (13, 1)],
  term ((168870508201321849269776150576064 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 14. -/
theorem ep_Q2_002_partial_14_0036_valid :
    mulPoly ep_Q2_002_coefficient_14_0036
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0037 : Poly :=
[
  term ((26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 37 for generator 14. -/
def ep_Q2_002_partial_14_0037 : Poly :=
[
  term ((52510320040309582080958027054338142759824 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (5, 1), (9, 2), (15, 1)],
  term ((-26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (8, 2), (9, 1), (15, 1)],
  term ((-26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 3), (15, 1)],
  term ((52510320040309582080958027054338142759824 : Rat) / 103601401347717117429703636119532782115) [(4, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 14. -/
theorem ep_Q2_002_partial_14_0037_valid :
    mulPoly ep_Q2_002_coefficient_14_0037
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0038 : Poly :=
[
  term ((37995356188 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 14. -/
def ep_Q2_002_partial_14_0038 : Poly :=
[
  term ((75990712376 : Rat) / 7401317245) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-37995356188 : Rat) / 7401317245) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-37995356188 : Rat) / 7401317245) [(4, 1), (9, 3), (15, 1), (16, 1)],
  term ((75990712376 : Rat) / 7401317245) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 14. -/
theorem ep_Q2_002_partial_14_0038_valid :
    mulPoly ep_Q2_002_coefficient_14_0038
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0039 : Poly :=
[
  term ((26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 39 for generator 14. -/
def ep_Q2_002_partial_14_0039 : Poly :=
[
  term ((52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((-26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 14. -/
theorem ep_Q2_002_partial_14_0039_valid :
    mulPoly ep_Q2_002_coefficient_14_0039
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0040 : Poly :=
[
  term ((-368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 14. -/
def ep_Q2_002_partial_14_0040 : Poly :=
[
  term ((-737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 2), (13, 1), (15, 1)],
  term ((-737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 14. -/
theorem ep_Q2_002_partial_14_0040_valid :
    mulPoly ep_Q2_002_coefficient_14_0040
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0041 : Poly :=
[
  term ((-27821842066 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 14. -/
def ep_Q2_002_partial_14_0041 : Poly :=
[
  term ((-55643684132 : Rat) / 7401317245) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27821842066 : Rat) / 7401317245) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((27821842066 : Rat) / 7401317245) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-55643684132 : Rat) / 7401317245) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 14. -/
theorem ep_Q2_002_partial_14_0041_valid :
    mulPoly ep_Q2_002_coefficient_14_0041
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0042 : Poly :=
[
  term ((-49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 42 for generator 14. -/
def ep_Q2_002_partial_14_0042 : Poly :=
[
  term ((-99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 1), (13, 2)],
  term ((49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (13, 2)],
  term ((49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (13, 2)],
  term ((-99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 14. -/
theorem ep_Q2_002_partial_14_0042_valid :
    mulPoly ep_Q2_002_coefficient_14_0042
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0043 : Poly :=
[
  term ((-44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 43 for generator 14. -/
def ep_Q2_002_partial_14_0043 : Poly :=
[
  term ((-89672711115858124947947791537392 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 2), (11, 1)],
  term ((44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (11, 1)],
  term ((-89672711115858124947947791537392 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 14. -/
theorem ep_Q2_002_partial_14_0043_valid :
    mulPoly ep_Q2_002_coefficient_14_0043
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0044 : Poly :=
[
  term ((84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 44 for generator 14. -/
def ep_Q2_002_partial_14_0044 : Poly :=
[
  term ((168870508201321849269776150576064 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 2), (13, 1)],
  term ((-84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (13, 1)],
  term ((168870508201321849269776150576064 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 14. -/
theorem ep_Q2_002_partial_14_0044_valid :
    mulPoly ep_Q2_002_coefficient_14_0044
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0045 : Poly :=
[
  term ((26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 45 for generator 14. -/
def ep_Q2_002_partial_14_0045 : Poly :=
[
  term ((52510320040309582080958027054338142759824 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (5, 1), (8, 2), (15, 1)],
  term ((-26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((-26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 3), (15, 1)],
  term ((52510320040309582080958027054338142759824 : Rat) / 103601401347717117429703636119532782115) [(5, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 14. -/
theorem ep_Q2_002_partial_14_0045_valid :
    mulPoly ep_Q2_002_coefficient_14_0045
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0046 : Poly :=
[
  term ((37995356188 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 14. -/
def ep_Q2_002_partial_14_0046 : Poly :=
[
  term ((75990712376 : Rat) / 7401317245) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-37995356188 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-37995356188 : Rat) / 7401317245) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((75990712376 : Rat) / 7401317245) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 14. -/
theorem ep_Q2_002_partial_14_0046_valid :
    mulPoly ep_Q2_002_coefficient_14_0046
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0047 : Poly :=
[
  term ((51307895784354288497719474931856 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 47 for generator 14. -/
def ep_Q2_002_partial_14_0047 : Poly :=
[
  term ((102615791568708576995438949863712 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-51307895784354288497719474931856 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((-51307895784354288497719474931856 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((102615791568708576995438949863712 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 14. -/
theorem ep_Q2_002_partial_14_0047_valid :
    mulPoly ep_Q2_002_coefficient_14_0047
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0048 : Poly :=
[
  term ((-96622376284016664420398438578752 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 48 for generator 14. -/
def ep_Q2_002_partial_14_0048 : Poly :=
[
  term ((-193244752568033328840796877157504 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((96622376284016664420398438578752 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((96622376284016664420398438578752 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-193244752568033328840796877157504 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 14. -/
theorem ep_Q2_002_partial_14_0048_valid :
    mulPoly ep_Q2_002_coefficient_14_0048
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0049 : Poly :=
[
  term ((-558630556262406798694296085992629491195536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 49 for generator 14. -/
def ep_Q2_002_partial_14_0049 : Poly :=
[
  term ((-1117261112524813597388592171985258982391072 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((558630556262406798694296085992629491195536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((558630556262406798694296085992629491195536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-1117261112524813597388592171985258982391072 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 14. -/
theorem ep_Q2_002_partial_14_0049_valid :
    mulPoly ep_Q2_002_coefficient_14_0049
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0050 : Poly :=
[
  term ((-47203275888 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 14. -/
def ep_Q2_002_partial_14_0050 : Poly :=
[
  term ((-94406551776 : Rat) / 7401317245) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((47203275888 : Rat) / 7401317245) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((47203275888 : Rat) / 7401317245) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-94406551776 : Rat) / 7401317245) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 14. -/
theorem ep_Q2_002_partial_14_0050_valid :
    mulPoly ep_Q2_002_coefficient_14_0050
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0051 : Poly :=
[
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 51 for generator 14. -/
def ep_Q2_002_partial_14_0051 : Poly :=
[
  term ((-159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 14. -/
theorem ep_Q2_002_partial_14_0051_valid :
    mulPoly ep_Q2_002_coefficient_14_0051
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0052 : Poly :=
[
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 52 for generator 14. -/
def ep_Q2_002_partial_14_0052 : Poly :=
[
  term ((-154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 14. -/
theorem ep_Q2_002_partial_14_0052_valid :
    mulPoly ep_Q2_002_coefficient_14_0052
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0053 : Poly :=
[
  term ((-7555141124 : Rat) / 1480263449) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 14. -/
def ep_Q2_002_partial_14_0053 : Poly :=
[
  term ((-15110282248 : Rat) / 1480263449) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 14. -/
theorem ep_Q2_002_partial_14_0053_valid :
    mulPoly ep_Q2_002_coefficient_14_0053
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0054 : Poly :=
[
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

/-- Partial product 54 for generator 14. -/
def ep_Q2_002_partial_14_0054 : Poly :=
[
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (8, 1), (11, 2)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 14. -/
theorem ep_Q2_002_partial_14_0054_valid :
    mulPoly ep_Q2_002_coefficient_14_0054
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0055 : Poly :=
[
  term ((7078928235832084584348217614744 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 55 for generator 14. -/
def ep_Q2_002_partial_14_0055 : Poly :=
[
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (11, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-7078928235832084584348217614744 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 2), (11, 1)],
  term ((-7078928235832084584348217614744 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 14. -/
theorem ep_Q2_002_partial_14_0055_valid :
    mulPoly ep_Q2_002_coefficient_14_0055
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0056 : Poly :=
[
  term ((-13330947551715619065229273508448 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 56 for generator 14. -/
def ep_Q2_002_partial_14_0056 : Poly :=
[
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((13330947551715619065229273508448 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 2), (13, 1)],
  term ((13330947551715619065229273508448 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 14. -/
theorem ep_Q2_002_partial_14_0056_valid :
    mulPoly ep_Q2_002_coefficient_14_0056
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0057 : Poly :=
[
  term ((-35873308018736570155814796590978602178664 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 57 for generator 14. -/
def ep_Q2_002_partial_14_0057 : Poly :=
[
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((35873308018736570155814796590978602178664 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 2), (15, 1)],
  term ((35873308018736570155814796590978602178664 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 14. -/
theorem ep_Q2_002_partial_14_0057_valid :
    mulPoly ep_Q2_002_coefficient_14_0057
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0058 : Poly :=
[
  term ((-5490665332 : Rat) / 7401317245) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 14. -/
def ep_Q2_002_partial_14_0058 : Poly :=
[
  term ((-10981330664 : Rat) / 7401317245) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((5490665332 : Rat) / 7401317245) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((5490665332 : Rat) / 7401317245) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 14. -/
theorem ep_Q2_002_partial_14_0058_valid :
    mulPoly ep_Q2_002_coefficient_14_0058
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0059 : Poly :=
[
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 59 for generator 14. -/
def ep_Q2_002_partial_14_0059 : Poly :=
[
  term ((31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 14. -/
theorem ep_Q2_002_partial_14_0059_valid :
    mulPoly ep_Q2_002_coefficient_14_0059
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0060 : Poly :=
[
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 60 for generator 14. -/
def ep_Q2_002_partial_14_0060 : Poly :=
[
  term ((1713683577970808379391201839843529699126368 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((1713683577970808379391201839843529699126368 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 14. -/
theorem ep_Q2_002_partial_14_0060_valid :
    mulPoly ep_Q2_002_coefficient_14_0060
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0061 : Poly :=
[
  term ((13300676832 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 14. -/
def ep_Q2_002_partial_14_0061 : Poly :=
[
  term ((26601353664 : Rat) / 7401317245) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((26601353664 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 14. -/
theorem ep_Q2_002_partial_14_0061_valid :
    mulPoly ep_Q2_002_coefficient_14_0061
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0062 : Poly :=
[
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 62 for generator 14. -/
def ep_Q2_002_partial_14_0062 : Poly :=
[
  term ((-58647225192412125545659641250944 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (13, 2)],
  term ((-58647225192412125545659641250944 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 1), (13, 2)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (13, 2)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(8, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 14. -/
theorem ep_Q2_002_partial_14_0062_valid :
    mulPoly ep_Q2_002_coefficient_14_0062
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0063 : Poly :=
[
  term ((68732982382657568021850944507472 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 63 for generator 14. -/
def ep_Q2_002_partial_14_0063 : Poly :=
[
  term ((137465964765315136043701889014944 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((137465964765315136043701889014944 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-68732982382657568021850944507472 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-68732982382657568021850944507472 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 14. -/
theorem ep_Q2_002_partial_14_0063_valid :
    mulPoly ep_Q2_002_coefficient_14_0063
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0064 : Poly :=
[
  term ((-84670130682499489726708645255944 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 64 for generator 14. -/
def ep_Q2_002_partial_14_0064 : Poly :=
[
  term ((-169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((84670130682499489726708645255944 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (13, 1)],
  term ((84670130682499489726708645255944 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 14. -/
theorem ep_Q2_002_partial_14_0064_valid :
    mulPoly ep_Q2_002_coefficient_14_0064
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0065 : Poly :=
[
  term ((-9439356830524244472406419538488 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 1)]
]

/-- Partial product 65 for generator 14. -/
def ep_Q2_002_partial_14_0065 : Poly :=
[
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((9439356830524244472406419538488 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (15, 1)],
  term ((9439356830524244472406419538488 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 14. -/
theorem ep_Q2_002_partial_14_0065_valid :
    mulPoly ep_Q2_002_coefficient_14_0065
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0066 : Poly :=
[
  term ((385170418308721990489175744675276380682688 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 66 for generator 14. -/
def ep_Q2_002_partial_14_0066 : Poly :=
[
  term ((770340836617443980978351489350552761365376 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((770340836617443980978351489350552761365376 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-385170418308721990489175744675276380682688 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-385170418308721990489175744675276380682688 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 14. -/
theorem ep_Q2_002_partial_14_0066_valid :
    mulPoly ep_Q2_002_coefficient_14_0066
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0067 : Poly :=
[
  term ((-33466769596 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 14. -/
def ep_Q2_002_partial_14_0067 : Poly :=
[
  term ((-66933539192 : Rat) / 7401317245) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66933539192 : Rat) / 7401317245) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33466769596 : Rat) / 7401317245) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33466769596 : Rat) / 7401317245) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 14. -/
theorem ep_Q2_002_partial_14_0067_valid :
    mulPoly ep_Q2_002_coefficient_14_0067
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0068 : Poly :=
[
  term ((-129437077575981258270454684463424 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

/-- Partial product 68 for generator 14. -/
def ep_Q2_002_partial_14_0068 : Poly :=
[
  term ((-258874155151962516540909368926848 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (12, 1), (13, 2)],
  term ((-258874155151962516540909368926848 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (12, 1), (13, 2)],
  term ((129437077575981258270454684463424 : Rat) / 1273790490336191187829975377157) [(8, 2), (12, 1), (13, 2)],
  term ((129437077575981258270454684463424 : Rat) / 1273790490336191187829975377157) [(9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 14. -/
theorem ep_Q2_002_partial_14_0068_valid :
    mulPoly ep_Q2_002_coefficient_14_0068
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0069 : Poly :=
[
  term ((-600683093810445067457285592379185093829044 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 1)]
]

/-- Partial product 69 for generator 14. -/
def ep_Q2_002_partial_14_0069 : Poly :=
[
  term ((-1201366187620890134914571184758370187658088 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1201366187620890134914571184758370187658088 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((600683093810445067457285592379185093829044 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (13, 1), (15, 1)],
  term ((600683093810445067457285592379185093829044 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 14. -/
theorem ep_Q2_002_partial_14_0069_valid :
    mulPoly ep_Q2_002_coefficient_14_0069
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0070 : Poly :=
[
  term ((37314964633 : Rat) / 7401317245) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 14. -/
def ep_Q2_002_partial_14_0070 : Poly :=
[
  term ((74629929266 : Rat) / 7401317245) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((74629929266 : Rat) / 7401317245) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37314964633 : Rat) / 7401317245) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37314964633 : Rat) / 7401317245) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 14. -/
theorem ep_Q2_002_partial_14_0070_valid :
    mulPoly ep_Q2_002_coefficient_14_0070
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0071 : Poly :=
[
  term ((159449712403057359605161496098848 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

/-- Partial product 71 for generator 14. -/
def ep_Q2_002_partial_14_0071 : Poly :=
[
  term ((318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (13, 2)],
  term ((318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 2)],
  term ((-159449712403057359605161496098848 : Rat) / 1273790490336191187829975377157) [(8, 2), (13, 2)],
  term ((-159449712403057359605161496098848 : Rat) / 1273790490336191187829975377157) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 14. -/
theorem ep_Q2_002_partial_14_0071_valid :
    mulPoly ep_Q2_002_coefficient_14_0071
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0072 : Poly :=
[
  term ((76360943060818928342603094815554831440048 : Rat) / 1346818217520322526586147269553926167495) [(15, 2)]
]

/-- Partial product 72 for generator 14. -/
def ep_Q2_002_partial_14_0072 : Poly :=
[
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (15, 2)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (15, 2)],
  term ((-76360943060818928342603094815554831440048 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (15, 2)],
  term ((-76360943060818928342603094815554831440048 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 14. -/
theorem ep_Q2_002_partial_14_0072_valid :
    mulPoly ep_Q2_002_coefficient_14_0072
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 14. -/
def ep_Q2_002_coefficient_14_0073 : Poly :=
[
  term ((8126172714 : Rat) / 7401317245) [(15, 2), (16, 1)]
]

/-- Partial product 73 for generator 14. -/
def ep_Q2_002_partial_14_0073 : Poly :=
[
  term ((16252345428 : Rat) / 7401317245) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((16252345428 : Rat) / 7401317245) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-8126172714 : Rat) / 7401317245) [(8, 2), (15, 2), (16, 1)],
  term ((-8126172714 : Rat) / 7401317245) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 14. -/
theorem ep_Q2_002_partial_14_0073_valid :
    mulPoly ep_Q2_002_coefficient_14_0073
        ep_Q2_002_generator_14_0000_0073 =
      ep_Q2_002_partial_14_0073 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_14_0000_0073 : List Poly :=
[
  ep_Q2_002_partial_14_0000,
  ep_Q2_002_partial_14_0001,
  ep_Q2_002_partial_14_0002,
  ep_Q2_002_partial_14_0003,
  ep_Q2_002_partial_14_0004,
  ep_Q2_002_partial_14_0005,
  ep_Q2_002_partial_14_0006,
  ep_Q2_002_partial_14_0007,
  ep_Q2_002_partial_14_0008,
  ep_Q2_002_partial_14_0009,
  ep_Q2_002_partial_14_0010,
  ep_Q2_002_partial_14_0011,
  ep_Q2_002_partial_14_0012,
  ep_Q2_002_partial_14_0013,
  ep_Q2_002_partial_14_0014,
  ep_Q2_002_partial_14_0015,
  ep_Q2_002_partial_14_0016,
  ep_Q2_002_partial_14_0017,
  ep_Q2_002_partial_14_0018,
  ep_Q2_002_partial_14_0019,
  ep_Q2_002_partial_14_0020,
  ep_Q2_002_partial_14_0021,
  ep_Q2_002_partial_14_0022,
  ep_Q2_002_partial_14_0023,
  ep_Q2_002_partial_14_0024,
  ep_Q2_002_partial_14_0025,
  ep_Q2_002_partial_14_0026,
  ep_Q2_002_partial_14_0027,
  ep_Q2_002_partial_14_0028,
  ep_Q2_002_partial_14_0029,
  ep_Q2_002_partial_14_0030,
  ep_Q2_002_partial_14_0031,
  ep_Q2_002_partial_14_0032,
  ep_Q2_002_partial_14_0033,
  ep_Q2_002_partial_14_0034,
  ep_Q2_002_partial_14_0035,
  ep_Q2_002_partial_14_0036,
  ep_Q2_002_partial_14_0037,
  ep_Q2_002_partial_14_0038,
  ep_Q2_002_partial_14_0039,
  ep_Q2_002_partial_14_0040,
  ep_Q2_002_partial_14_0041,
  ep_Q2_002_partial_14_0042,
  ep_Q2_002_partial_14_0043,
  ep_Q2_002_partial_14_0044,
  ep_Q2_002_partial_14_0045,
  ep_Q2_002_partial_14_0046,
  ep_Q2_002_partial_14_0047,
  ep_Q2_002_partial_14_0048,
  ep_Q2_002_partial_14_0049,
  ep_Q2_002_partial_14_0050,
  ep_Q2_002_partial_14_0051,
  ep_Q2_002_partial_14_0052,
  ep_Q2_002_partial_14_0053,
  ep_Q2_002_partial_14_0054,
  ep_Q2_002_partial_14_0055,
  ep_Q2_002_partial_14_0056,
  ep_Q2_002_partial_14_0057,
  ep_Q2_002_partial_14_0058,
  ep_Q2_002_partial_14_0059,
  ep_Q2_002_partial_14_0060,
  ep_Q2_002_partial_14_0061,
  ep_Q2_002_partial_14_0062,
  ep_Q2_002_partial_14_0063,
  ep_Q2_002_partial_14_0064,
  ep_Q2_002_partial_14_0065,
  ep_Q2_002_partial_14_0066,
  ep_Q2_002_partial_14_0067,
  ep_Q2_002_partial_14_0068,
  ep_Q2_002_partial_14_0069,
  ep_Q2_002_partial_14_0070,
  ep_Q2_002_partial_14_0071,
  ep_Q2_002_partial_14_0072,
  ep_Q2_002_partial_14_0073
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_14_0000_0073 : Poly :=
[
  term ((-4343962172078347478826566635776 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1)],
  term ((67541584365393597518484714559008 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1)],
  term ((-109063699447226038569608691885312 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((67541584365393597518484714559008 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-109063699447226038569608691885312 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4343962172078347478826566635776 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 2)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((-33770792182696798759242357279504 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (11, 1)],
  term ((54531849723613019284804345942656 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-33770792182696798759242357279504 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((54531849723613019284804345942656 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 3)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (4, 1), (8, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (9, 1)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 2)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 2)],
  term ((61415744497779026055717781071552 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-115657348326433855053127110998784 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((131933703589237654381819223291143646430192 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-36392571924 : Rat) / 7401317245) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((10893818165204773839626044601184 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-49291419601914589604039106783640106152944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((7812158316 : Rat) / 1480263449) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70947704729571661367478664738848 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (11, 2)],
  term ((1078281856898156572858390330684962894326112 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((108056102096 : Rat) / 7401317245) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((231093435988918746017718113084544 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (8, 1), (13, 2)],
  term ((10893818165204773839626044601184 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-49291419601914589604039106783640106152944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((7812158316 : Rat) / 1480263449) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70947704729571661367478664738848 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((1078281856898156572858390330684962894326112 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((108056102096 : Rat) / 7401317245) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((231093435988918746017718113084544 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (13, 2)],
  term ((61415744497779026055717781071552 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (11, 1)],
  term ((-115657348326433855053127110998784 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (13, 1)],
  term ((131933703589237654381819223291143646430192 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((-36392571924 : Rat) / 7401317245) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((18196285962 : Rat) / 7401317245) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5446909082602386919813022300592 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((24645709800957294802019553391820053076472 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-3906079158 : Rat) / 1480263449) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((35473852364785830683739332369424 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 2)],
  term ((-539140928449078286429195165342481447163056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((-54028051048 : Rat) / 7401317245) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-115546717994459373008859056542272 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (13, 2)],
  term ((-5446909082602386919813022300592 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((24645709800957294802019553391820053076472 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((-3906079158 : Rat) / 1480263449) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((35473852364785830683739332369424 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 2)],
  term ((-539140928449078286429195165342481447163056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((-54028051048 : Rat) / 7401317245) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-115546717994459373008859056542272 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (13, 2)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (11, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (13, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 3), (15, 1)],
  term ((18196285962 : Rat) / 7401317245) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (8, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 2)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 2)],
  term ((-7258059321392191973773170281856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1)],
  term ((6342589642776111934360499493696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (8, 2)],
  term ((-3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((6342589642776111934360499493696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (9, 2)],
  term ((-6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (8, 1), (11, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (8, 1)],
  term ((3599555765101987274023930872480 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (11, 1)],
  term ((-9723027145105739300213602457472 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1)],
  term ((5198872329002523637307475422784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-2405421981307628052755769254090977240944 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (4, 1), (8, 1), (15, 1)],
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (9, 1)],
  term ((-338827293715104363800508310272 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (13, 1)],
  term ((1863897664271607880207713327744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (13, 1)],
  term ((-3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 3)],
  term ((6342589642776111934360499493696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (8, 1), (9, 1)],
  term ((-3727795328543215760415426655488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (8, 1), (13, 1)],
  term ((-6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((-2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((-3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((3629029660696095986886585140928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((-3171294821388055967180249746848 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 3)],
  term ((3599555765101987274023930872480 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-9723027145105739300213602457472 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((5198872329002523637307475422784 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-2405421981307628052755769254090977240944 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((3629029660696095986886585140928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2), (12, 1)],
  term ((6342589642776111934360499493696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (8, 1), (9, 1)],
  term ((-7258059321392191973773170281856 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (9, 1), (12, 1)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 2), (11, 1)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((500695655922951785827570819872 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 2)],
  term ((500695655922951785827570819872 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 2)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((-1799777882550993637011965436240 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (11, 1)],
  term ((4861513572552869650106801228736 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((-2599436164501261818653737711392 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)],
  term ((1202710990653814026377884627045488620472 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (8, 2), (15, 1)],
  term ((5917002858 : Rat) / 7401317245) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (13, 1)],
  term ((-1799777882550993637011965436240 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1)],
  term ((4861513572552869650106801228736 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((-2599436164501261818653737711392 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1)],
  term ((1202710990653814026377884627045488620472 : Rat) / 9418309213428828857245785101775707465) [(1, 1), (9, 2), (15, 1)],
  term ((5917002858 : Rat) / 7401317245) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1)],
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1)],
  term ((127299068078992532494224093120 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2)],
  term ((127299068078992532494224093120 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (11, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (8, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 2), (11, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 2), (13, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 2), (15, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 2), (11, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 2), (13, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 2), (15, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((102615791568708576995438949863712 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-193244752568033328840796877157504 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-1117261112524813597388592171985258982391072 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-94406551776 : Rat) / 7401317245) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-89672711115858124947947791537392 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 2), (11, 1)],
  term ((168870508201321849269776150576064 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 2), (13, 1)],
  term ((52510320040309582080958027054338142759824 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (5, 1), (8, 2), (15, 1)],
  term ((75990712376 : Rat) / 7401317245) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-55643684132 : Rat) / 7401317245) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 1), (13, 2)],
  term ((-89672711115858124947947791537392 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 2), (11, 1)],
  term ((168870508201321849269776150576064 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((52510320040309582080958027054338142759824 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (5, 1), (9, 2), (15, 1)],
  term ((75990712376 : Rat) / 7401317245) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (8, 1), (11, 2)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (11, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((137465964765315136043701889014944 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((770340836617443980978351489350552761365376 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-66933539192 : Rat) / 7401317245) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-258874155151962516540909368926848 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (12, 1), (13, 2)],
  term ((-1201366187620890134914571184758370187658088 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((74629929266 : Rat) / 7401317245) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (13, 2)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (15, 2)],
  term ((16252345428 : Rat) / 7401317245) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (9, 1), (11, 1)],
  term ((-84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (9, 1), (13, 1)],
  term ((-26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (8, 2), (9, 1), (15, 1)],
  term ((-37995356188 : Rat) / 7401317245) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((4790403248314811243707603220544 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((416483998624252218767460568193219076413928 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((10884639146 : Rat) / 1480263449) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9021226424023277060615220642048 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (13, 2)],
  term ((-26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 2), (13, 1), (15, 1)],
  term ((27821842066 : Rat) / 7401317245) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (13, 2)],
  term ((44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 3), (11, 1)],
  term ((-84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 3), (13, 1)],
  term ((-26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 3), (15, 1)],
  term ((-37995356188 : Rat) / 7401317245) [(4, 1), (9, 3), (15, 1), (16, 1)],
  term ((-89672711115858124947947791537392 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (9, 1), (11, 1)],
  term ((168870508201321849269776150576064 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((52510320040309582080958027054338142759824 : Rat) / 103601401347717117429703636119532782115) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((75990712376 : Rat) / 7401317245) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((-55643684132 : Rat) / 7401317245) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (13, 2)],
  term ((-159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1713683577970808379391201839843529699126368 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((26601353664 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58647225192412125545659641250944 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 1), (13, 2)],
  term ((44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((-84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((-37995356188 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-51307895784354288497719474931856 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((96622376284016664420398438578752 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((558630556262406798694296085992629491195536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((47203275888 : Rat) / 7401317245) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((44836355557929062473973895768696 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (11, 1)],
  term ((-84435254100660924634888075288032 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (13, 1)],
  term ((-26255160020154791040479013527169071379912 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 3), (15, 1)],
  term ((-37995356188 : Rat) / 7401317245) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((137465964765315136043701889014944 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((770340836617443980978351489350552761365376 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-66933539192 : Rat) / 7401317245) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-258874155151962516540909368926848 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-1201366187620890134914571184758370187658088 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((74629929266 : Rat) / 7401317245) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 2)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (15, 2)],
  term ((16252345428 : Rat) / 7401317245) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-51307895784354288497719474931856 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((96622376284016664420398438578752 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((558630556262406798694296085992629491195536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((47203275888 : Rat) / 7401317245) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-89672711115858124947947791537392 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (9, 1), (11, 1)],
  term ((168870508201321849269776150576064 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term ((52510320040309582080958027054338142759824 : Rat) / 103601401347717117429703636119532782115) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((75990712376 : Rat) / 7401317245) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((102615791568708576995438949863712 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((-193244752568033328840796877157504 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1117261112524813597388592171985258982391072 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-94406551776 : Rat) / 7401317245) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((7555141124 : Rat) / 1480263449) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 2)],
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((7555141124 : Rat) / 1480263449) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 2)],
  term ((-7078928235832084584348217614744 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 2), (11, 1)],
  term ((13330947551715619065229273508448 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 2), (13, 1)],
  term ((35873308018736570155814796590978602178664 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 2), (15, 1)],
  term ((5490665332 : Rat) / 7401317245) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-7078928235832084584348217614744 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 2), (11, 1)],
  term ((13330947551715619065229273508448 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 2), (13, 1)],
  term ((35873308018736570155814796590978602178664 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 2), (15, 1)],
  term ((5490665332 : Rat) / 7401317245) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (13, 2)],
  term ((-68732982382657568021850944507472 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((84670130682499489726708645255944 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (13, 1)],
  term ((9439356830524244472406419538488 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (15, 1)],
  term ((-385170418308721990489175744675276380682688 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((33466769596 : Rat) / 7401317245) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((129437077575981258270454684463424 : Rat) / 1273790490336191187829975377157) [(8, 2), (12, 1), (13, 2)],
  term ((600683093810445067457285592379185093829044 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (13, 1), (15, 1)],
  term ((-37314964633 : Rat) / 7401317245) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-159449712403057359605161496098848 : Rat) / 1273790490336191187829975377157) [(8, 2), (13, 2)],
  term ((-76360943060818928342603094815554831440048 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (15, 2)],
  term ((-8126172714 : Rat) / 7401317245) [(8, 2), (15, 2), (16, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 1), (13, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(8, 3), (13, 1), (15, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(8, 3), (13, 2)],
  term ((-68732982382657568021850944507472 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((84670130682499489726708645255944 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (13, 1)],
  term ((9439356830524244472406419538488 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (15, 1)],
  term ((-385170418308721990489175744675276380682688 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((33466769596 : Rat) / 7401317245) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((129437077575981258270454684463424 : Rat) / 1273790490336191187829975377157) [(9, 2), (12, 1), (13, 2)],
  term ((600683093810445067457285592379185093829044 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (13, 1), (15, 1)],
  term ((-37314964633 : Rat) / 7401317245) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-159449712403057359605161496098848 : Rat) / 1273790490336191187829975377157) [(9, 2), (13, 2)],
  term ((-76360943060818928342603094815554831440048 : Rat) / 1346818217520322526586147269553926167495) [(9, 2), (15, 2)],
  term ((-8126172714 : Rat) / 7401317245) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 73. -/
theorem ep_Q2_002_block_14_0000_0073_valid :
    checkProductSumEq ep_Q2_002_partials_14_0000_0073
      ep_Q2_002_block_14_0000_0073 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
