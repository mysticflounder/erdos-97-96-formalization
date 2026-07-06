/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 22:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_22_0000_0099 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0000 : Poly :=
[
  term ((-297926562073797138194078274816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)]
]

/-- Partial product 0 for generator 22. -/
def ep_Q2_002_partial_22_0000 : Poly :=
[
  term ((-595853124147594276388156549632 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (8, 1), (10, 1)],
  term ((297926562073797138194078274816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (8, 2)],
  term ((-595853124147594276388156549632 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1)],
  term ((297926562073797138194078274816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem ep_Q2_002_partial_22_0000_valid :
    mulPoly ep_Q2_002_coefficient_22_0000
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0001 : Poly :=
[
  term ((-2665885352304449143202034501024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 1 for generator 22. -/
def ep_Q2_002_partial_22_0001 : Poly :=
[
  term ((-5331770704608898286404069002048 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1)],
  term ((2665885352304449143202034501024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((-5331770704608898286404069002048 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((2665885352304449143202034501024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem ep_Q2_002_partial_22_0001_valid :
    mulPoly ep_Q2_002_coefficient_22_0001
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0002 : Poly :=
[
  term ((-90605556279667518441394886437920 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 2 for generator 22. -/
def ep_Q2_002_partial_22_0002 : Poly :=
[
  term ((-181211112559335036882789772875840 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1)],
  term ((90605556279667518441394886437920 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (11, 1)],
  term ((-181211112559335036882789772875840 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((90605556279667518441394886437920 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem ep_Q2_002_partial_22_0002_valid :
    mulPoly ep_Q2_002_coefficient_22_0002
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0003 : Poly :=
[
  term ((167469797011876237945648124695104 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 3 for generator 22. -/
def ep_Q2_002_partial_22_0003 : Poly :=
[
  term ((334939594023752475891296249390208 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-167469797011876237945648124695104 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((334939594023752475891296249390208 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-167469797011876237945648124695104 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem ep_Q2_002_partial_22_0003_valid :
    mulPoly ep_Q2_002_coefficient_22_0003
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0004 : Poly :=
[
  term ((1435230499300277704977200348182644950316768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 4 for generator 22. -/
def ep_Q2_002_partial_22_0004 : Poly :=
[
  term ((2870460998600555409954400696365289900633536 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1435230499300277704977200348182644950316768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((2870460998600555409954400696365289900633536 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1435230499300277704977200348182644950316768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem ep_Q2_002_partial_22_0004_valid :
    mulPoly ep_Q2_002_coefficient_22_0004
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0005 : Poly :=
[
  term ((92924848704 : Rat) / 7401317245) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 22. -/
def ep_Q2_002_partial_22_0005 : Poly :=
[
  term ((185849697408 : Rat) / 7401317245) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-92924848704 : Rat) / 7401317245) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((185849697408 : Rat) / 7401317245) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92924848704 : Rat) / 7401317245) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem ep_Q2_002_partial_22_0005_valid :
    mulPoly ep_Q2_002_coefficient_22_0005
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0006 : Poly :=
[
  term ((6028482677517970479574292759424 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)]
]

/-- Partial product 6 for generator 22. -/
def ep_Q2_002_partial_22_0006 : Poly :=
[
  term ((12056965355035940959148585518848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 1), (10, 1)],
  term ((-6028482677517970479574292759424 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 2)],
  term ((12056965355035940959148585518848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-6028482677517970479574292759424 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem ep_Q2_002_partial_22_0006_valid :
    mulPoly ep_Q2_002_coefficient_22_0006
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0007 : Poly :=
[
  term ((4212141103123772187533616349632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 7 for generator 22. -/
def ep_Q2_002_partial_22_0007 : Poly :=
[
  term ((8424282206247544375067232699264 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-4212141103123772187533616349632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 2), (11, 1)],
  term ((8424282206247544375067232699264 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-4212141103123772187533616349632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem ep_Q2_002_partial_22_0007_valid :
    mulPoly ep_Q2_002_coefficient_22_0007
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0008 : Poly :=
[
  term ((-7932250512434849454513381222144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 8 for generator 22. -/
def ep_Q2_002_partial_22_0008 : Poly :=
[
  term ((-15864501024869698909026762444288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((7932250512434849454513381222144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 2), (13, 1)],
  term ((-15864501024869698909026762444288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((7932250512434849454513381222144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem ep_Q2_002_partial_22_0008_valid :
    mulPoly ep_Q2_002_coefficient_22_0008
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0009 : Poly :=
[
  term ((38294913223164709865590131275720267855544 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 9 for generator 22. -/
def ep_Q2_002_partial_22_0009 : Poly :=
[
  term ((76589826446329419731180262551440535711088 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-38294913223164709865590131275720267855544 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((76589826446329419731180262551440535711088 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-38294913223164709865590131275720267855544 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 22. -/
theorem ep_Q2_002_partial_22_0009_valid :
    mulPoly ep_Q2_002_coefficient_22_0009
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0010 : Poly :=
[
  term ((446736358 : Rat) / 1480263449) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 22. -/
def ep_Q2_002_partial_22_0010 : Poly :=
[
  term ((893472716 : Rat) / 1480263449) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-446736358 : Rat) / 1480263449) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((893472716 : Rat) / 1480263449) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-446736358 : Rat) / 1480263449) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 22. -/
theorem ep_Q2_002_partial_22_0010_valid :
    mulPoly ep_Q2_002_coefficient_22_0010
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0011 : Poly :=
[
  term ((37690782555587294625731758077048 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 11 for generator 22. -/
def ep_Q2_002_partial_22_0011 : Poly :=
[
  term ((75381565111174589251463516154096 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-37690782555587294625731758077048 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((75381565111174589251463516154096 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 2)],
  term ((-37690782555587294625731758077048 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 22. -/
theorem ep_Q2_002_partial_22_0011_valid :
    mulPoly ep_Q2_002_coefficient_22_0011
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0012 : Poly :=
[
  term ((-70978801972922083493989554472416 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 12 for generator 22. -/
def ep_Q2_002_partial_22_0012 : Poly :=
[
  term ((-141957603945844166987979108944832 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((70978801972922083493989554472416 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((-141957603945844166987979108944832 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((70978801972922083493989554472416 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 22. -/
theorem ep_Q2_002_partial_22_0012_valid :
    mulPoly ep_Q2_002_coefficient_22_0012
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0013 : Poly :=
[
  term ((-208174453445733859178580005899253750558088 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 13 for generator 22. -/
def ep_Q2_002_partial_22_0013 : Poly :=
[
  term ((-416348906891467718357160011798507501116176 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((208174453445733859178580005899253750558088 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-416348906891467718357160011798507501116176 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((208174453445733859178580005899253750558088 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 22. -/
theorem ep_Q2_002_partial_22_0013_valid :
    mulPoly ep_Q2_002_coefficient_22_0013
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0014 : Poly :=
[
  term ((-29079121324 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 22. -/
def ep_Q2_002_partial_22_0014 : Poly :=
[
  term ((-58158242648 : Rat) / 7401317245) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((29079121324 : Rat) / 7401317245) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-58158242648 : Rat) / 7401317245) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((29079121324 : Rat) / 7401317245) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 22. -/
theorem ep_Q2_002_partial_22_0014_valid :
    mulPoly ep_Q2_002_coefficient_22_0014
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0015 : Poly :=
[
  term ((-241510097327090038847405341865424 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 15 for generator 22. -/
def ep_Q2_002_partial_22_0015 : Poly :=
[
  term ((-483020194654180077694810683730848 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((241510097327090038847405341865424 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-483020194654180077694810683730848 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((241510097327090038847405341865424 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 22. -/
theorem ep_Q2_002_partial_22_0015_valid :
    mulPoly ep_Q2_002_coefficient_22_0015
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0016 : Poly :=
[
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 16 for generator 22. -/
def ep_Q2_002_partial_22_0016 : Poly :=
[
  term ((-123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 22. -/
theorem ep_Q2_002_partial_22_0016_valid :
    mulPoly ep_Q2_002_coefficient_22_0016
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0017 : Poly :=
[
  term ((-70368054424 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 22. -/
def ep_Q2_002_partial_22_0017 : Poly :=
[
  term ((-140736108848 : Rat) / 7401317245) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((70368054424 : Rat) / 7401317245) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-140736108848 : Rat) / 7401317245) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((70368054424 : Rat) / 7401317245) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 22. -/
theorem ep_Q2_002_partial_22_0017_valid :
    mulPoly ep_Q2_002_coefficient_22_0017
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0018 : Poly :=
[
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 18 for generator 22. -/
def ep_Q2_002_partial_22_0018 : Poly :=
[
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 2)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 3)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 22. -/
theorem ep_Q2_002_partial_22_0018_valid :
    mulPoly ep_Q2_002_coefficient_22_0018
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0019 : Poly :=
[
  term ((385012943099680748093672870652787557903024 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 19 for generator 22. -/
def ep_Q2_002_partial_22_0019 : Poly :=
[
  term ((770025886199361496187345741305575115806048 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-385012943099680748093672870652787557903024 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((770025886199361496187345741305575115806048 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-385012943099680748093672870652787557903024 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 22. -/
theorem ep_Q2_002_partial_22_0019_valid :
    mulPoly ep_Q2_002_coefficient_22_0019
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0020 : Poly :=
[
  term ((23507295256 : Rat) / 1480263449) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 22. -/
def ep_Q2_002_partial_22_0020 : Poly :=
[
  term ((47014590512 : Rat) / 1480263449) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23507295256 : Rat) / 1480263449) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((47014590512 : Rat) / 1480263449) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23507295256 : Rat) / 1480263449) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 22. -/
theorem ep_Q2_002_partial_22_0020_valid :
    mulPoly ep_Q2_002_coefficient_22_0020
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0021 : Poly :=
[
  term ((185371273694497775006668602192192 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 21 for generator 22. -/
def ep_Q2_002_partial_22_0021 : Poly :=
[
  term ((370742547388995550013337204384384 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((-185371273694497775006668602192192 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (13, 2)],
  term ((370742547388995550013337204384384 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-185371273694497775006668602192192 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 22. -/
theorem ep_Q2_002_partial_22_0021_valid :
    mulPoly ep_Q2_002_coefficient_22_0021
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0022 : Poly :=
[
  term ((-3104129249784974836686695381472 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 22 for generator 22. -/
def ep_Q2_002_partial_22_0022 : Poly :=
[
  term ((-6208258499569949673373390762944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((3104129249784974836686695381472 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (11, 1)],
  term ((-6208258499569949673373390762944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((3104129249784974836686695381472 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 22. -/
theorem ep_Q2_002_partial_22_0022_valid :
    mulPoly ep_Q2_002_coefficient_22_0022
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0023 : Poly :=
[
  term ((-8411417999809370333805180047424 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 23 for generator 22. -/
def ep_Q2_002_partial_22_0023 : Poly :=
[
  term ((-16822835999618740667610360094848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1)],
  term ((8411417999809370333805180047424 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (13, 1)],
  term ((-16822835999618740667610360094848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 1)],
  term ((8411417999809370333805180047424 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 22. -/
theorem ep_Q2_002_partial_22_0023_valid :
    mulPoly ep_Q2_002_coefficient_22_0023
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0024 : Poly :=
[
  term ((345387197016836488974301231189950857205072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 24 for generator 22. -/
def ep_Q2_002_partial_22_0024 : Poly :=
[
  term ((690774394033672977948602462379901714410144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((-345387197016836488974301231189950857205072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 2), (15, 1)],
  term ((690774394033672977948602462379901714410144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-345387197016836488974301231189950857205072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 22. -/
theorem ep_Q2_002_partial_22_0024_valid :
    mulPoly ep_Q2_002_coefficient_22_0024
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0025 : Poly :=
[
  term ((11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 22. -/
def ep_Q2_002_partial_22_0025 : Poly :=
[
  term ((23668011432 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((23668011432 : Rat) / 7401317245) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 22. -/
theorem ep_Q2_002_partial_22_0025_valid :
    mulPoly ep_Q2_002_coefficient_22_0025
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0026 : Poly :=
[
  term ((-791737339497270077701818653952 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

/-- Partial product 26 for generator 22. -/
def ep_Q2_002_partial_22_0026 : Poly :=
[
  term ((-1583474678994540155403637307904 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (10, 1)],
  term ((791737339497270077701818653952 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2)],
  term ((-1583474678994540155403637307904 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((791737339497270077701818653952 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 22. -/
theorem ep_Q2_002_partial_22_0026_valid :
    mulPoly ep_Q2_002_coefficient_22_0026
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0027 : Poly :=
[
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)]
]

/-- Partial product 27 for generator 22. -/
def ep_Q2_002_partial_22_0027 : Poly :=
[
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1), (10, 1)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 2)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 22. -/
theorem ep_Q2_002_partial_22_0027_valid :
    mulPoly ep_Q2_002_coefficient_22_0027
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0028 : Poly :=
[
  term ((-2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 28 for generator 22. -/
def ep_Q2_002_partial_22_0028 : Poly :=
[
  term ((-4343962172078347478826566635776 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((-4343962172078347478826566635776 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (10, 1)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 22. -/
theorem ep_Q2_002_partial_22_0028_valid :
    mulPoly ep_Q2_002_coefficient_22_0028
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0029 : Poly :=
[
  term ((103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 29 for generator 22. -/
def ep_Q2_002_partial_22_0029 : Poly :=
[
  term ((207698429683185715142099187456 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1)],
  term ((-103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((207698429683185715142099187456 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((-103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 22. -/
theorem ep_Q2_002_partial_22_0029_valid :
    mulPoly ep_Q2_002_coefficient_22_0029
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0030 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 30 for generator 22. -/
def ep_Q2_002_partial_22_0030 : Poly :=
[
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (14, 1)],
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 22. -/
theorem ep_Q2_002_partial_22_0030_valid :
    mulPoly ep_Q2_002_coefficient_22_0030
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0031 : Poly :=
[
  term ((5847080950828838998218561863664 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 31 for generator 22. -/
def ep_Q2_002_partial_22_0031 : Poly :=
[
  term ((11694161901657677996437123727328 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-5847080950828838998218561863664 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (8, 2), (11, 1)],
  term ((11694161901657677996437123727328 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((-5847080950828838998218561863664 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 22. -/
theorem ep_Q2_002_partial_22_0031_valid :
    mulPoly ep_Q2_002_coefficient_22_0031
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0032 : Poly :=
[
  term ((-111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 32 for generator 22. -/
def ep_Q2_002_partial_22_0032 : Poly :=
[
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 2), (13, 1)],
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 22. -/
theorem ep_Q2_002_partial_22_0032_valid :
    mulPoly ep_Q2_002_coefficient_22_0032
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0033 : Poly :=
[
  term ((-847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 33 for generator 22. -/
def ep_Q2_002_partial_22_0033 : Poly :=
[
  term ((-1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 2), (15, 1)],
  term ((-1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 22. -/
theorem ep_Q2_002_partial_22_0033_valid :
    mulPoly ep_Q2_002_coefficient_22_0033
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0034 : Poly :=
[
  term ((-61246522028 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 22. -/
def ep_Q2_002_partial_22_0034 : Poly :=
[
  term ((-122493044056 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((61246522028 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-122493044056 : Rat) / 7401317245) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((61246522028 : Rat) / 7401317245) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 22. -/
theorem ep_Q2_002_partial_22_0034_valid :
    mulPoly ep_Q2_002_coefficient_22_0034
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0035 : Poly :=
[
  term ((-6190114411005038325868163380896 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 35 for generator 22. -/
def ep_Q2_002_partial_22_0035 : Poly :=
[
  term ((-12380228822010076651736326761792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((6190114411005038325868163380896 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 2)],
  term ((-12380228822010076651736326761792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((6190114411005038325868163380896 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 22. -/
theorem ep_Q2_002_partial_22_0035_valid :
    mulPoly ep_Q2_002_coefficient_22_0035
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0036 : Poly :=
[
  term ((19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 36 for generator 22. -/
def ep_Q2_002_partial_22_0036 : Poly :=
[
  term ((38317704397147092424314327666096 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((38317704397147092424314327666096 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (10, 1), (11, 1)],
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 22. -/
theorem ep_Q2_002_partial_22_0036_valid :
    mulPoly ep_Q2_002_coefficient_22_0036
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0037 : Poly :=
[
  term ((-24257163544267385737651125946272 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 37 for generator 22. -/
def ep_Q2_002_partial_22_0037 : Poly :=
[
  term ((-48514327088534771475302251892544 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((24257163544267385737651125946272 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((-48514327088534771475302251892544 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((24257163544267385737651125946272 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 22. -/
theorem ep_Q2_002_partial_22_0037_valid :
    mulPoly ep_Q2_002_coefficient_22_0037
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0038 : Poly :=
[
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 38 for generator 22. -/
def ep_Q2_002_partial_22_0038 : Poly :=
[
  term ((-216170623549163814025913582981085571413888 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((-216170623549163814025913582981085571413888 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 22. -/
theorem ep_Q2_002_partial_22_0038_valid :
    mulPoly ep_Q2_002_coefficient_22_0038
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0039 : Poly :=
[
  term ((-5743061018 : Rat) / 1480263449) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 22. -/
def ep_Q2_002_partial_22_0039 : Poly :=
[
  term ((-11486122036 : Rat) / 1480263449) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-11486122036 : Rat) / 1480263449) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 22. -/
theorem ep_Q2_002_partial_22_0039_valid :
    mulPoly ep_Q2_002_coefficient_22_0039
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0040 : Poly :=
[
  term ((-1027702221964583556373618542144 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 40 for generator 22. -/
def ep_Q2_002_partial_22_0040 : Poly :=
[
  term ((-2055404443929167112747237084288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((1027702221964583556373618542144 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (9, 1)],
  term ((-2055404443929167112747237084288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1)],
  term ((1027702221964583556373618542144 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 22. -/
theorem ep_Q2_002_partial_22_0040_valid :
    mulPoly ep_Q2_002_coefficient_22_0040
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0041 : Poly :=
[
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 41 for generator 22. -/
def ep_Q2_002_partial_22_0041 : Poly :=
[
  term ((2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (9, 1), (14, 1)],
  term ((2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 22. -/
theorem ep_Q2_002_partial_22_0041_valid :
    mulPoly ep_Q2_002_coefficient_22_0041
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0042 : Poly :=
[
  term ((-818348793361580009936213898720 : Rat) / 8907625806546791523286541099) [(1, 1), (11, 1)]
]

/-- Partial product 42 for generator 22. -/
def ep_Q2_002_partial_22_0042 : Poly :=
[
  term ((-1636697586723160019872427797440 : Rat) / 8907625806546791523286541099) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((818348793361580009936213898720 : Rat) / 8907625806546791523286541099) [(1, 1), (8, 2), (11, 1)],
  term ((-1636697586723160019872427797440 : Rat) / 8907625806546791523286541099) [(1, 1), (9, 1), (11, 2)],
  term ((818348793361580009936213898720 : Rat) / 8907625806546791523286541099) [(1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 22. -/
theorem ep_Q2_002_partial_22_0042_valid :
    mulPoly ep_Q2_002_coefficient_22_0042
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0043 : Poly :=
[
  term ((-10597221970946281886871140205840 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 43 for generator 22. -/
def ep_Q2_002_partial_22_0043 : Poly :=
[
  term ((-21194443941892563773742280411680 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((10597221970946281886871140205840 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((-21194443941892563773742280411680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((10597221970946281886871140205840 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 22. -/
theorem ep_Q2_002_partial_22_0043_valid :
    mulPoly ep_Q2_002_coefficient_22_0043
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0044 : Poly :=
[
  term ((10113561062772600829497393047040 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 44 for generator 22. -/
def ep_Q2_002_partial_22_0044 : Poly :=
[
  term ((20227122125545201658994786094080 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-10113561062772600829497393047040 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((20227122125545201658994786094080 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-10113561062772600829497393047040 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 22. -/
theorem ep_Q2_002_partial_22_0044_valid :
    mulPoly ep_Q2_002_coefficient_22_0044
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0045 : Poly :=
[
  term ((-337166147076312636734554810202269780914192 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 45 for generator 22. -/
def ep_Q2_002_partial_22_0045 : Poly :=
[
  term ((-674332294152625273469109620404539561828384 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((337166147076312636734554810202269780914192 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((-674332294152625273469109620404539561828384 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((337166147076312636734554810202269780914192 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 22. -/
theorem ep_Q2_002_partial_22_0045_valid :
    mulPoly ep_Q2_002_coefficient_22_0045
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0046 : Poly :=
[
  term ((-3386427736 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 22. -/
def ep_Q2_002_partial_22_0046 : Poly :=
[
  term ((-6772855472 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3386427736 : Rat) / 7401317245) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6772855472 : Rat) / 7401317245) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3386427736 : Rat) / 7401317245) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 22. -/
theorem ep_Q2_002_partial_22_0046_valid :
    mulPoly ep_Q2_002_coefficient_22_0046
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0047 : Poly :=
[
  term ((219765381047988620792871406744512 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 47 for generator 22. -/
def ep_Q2_002_partial_22_0047 : Poly :=
[
  term ((439530762095977241585742813489024 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-219765381047988620792871406744512 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)],
  term ((439530762095977241585742813489024 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-219765381047988620792871406744512 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 22. -/
theorem ep_Q2_002_partial_22_0047_valid :
    mulPoly ep_Q2_002_coefficient_22_0047
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0048 : Poly :=
[
  term ((-40851500182418149165193119055175293654928 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (15, 1)]
]

/-- Partial product 48 for generator 22. -/
def ep_Q2_002_partial_22_0048 : Poly :=
[
  term ((-81703000364836298330386238110350587309856 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((40851500182418149165193119055175293654928 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 2), (15, 1)],
  term ((-81703000364836298330386238110350587309856 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((40851500182418149165193119055175293654928 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 22. -/
theorem ep_Q2_002_partial_22_0048_valid :
    mulPoly ep_Q2_002_coefficient_22_0048
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0049 : Poly :=
[
  term ((13670823148 : Rat) / 1480263449) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 22. -/
def ep_Q2_002_partial_22_0049 : Poly :=
[
  term ((27341646296 : Rat) / 1480263449) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13670823148 : Rat) / 1480263449) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((27341646296 : Rat) / 1480263449) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13670823148 : Rat) / 1480263449) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 22. -/
theorem ep_Q2_002_partial_22_0049_valid :
    mulPoly ep_Q2_002_coefficient_22_0049
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0050 : Poly :=
[
  term ((8127540165886753774190652462720 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 50 for generator 22. -/
def ep_Q2_002_partial_22_0050 : Poly :=
[
  term ((16255080331773507548381304925440 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1)],
  term ((-8127540165886753774190652462720 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2)],
  term ((16255080331773507548381304925440 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1)],
  term ((-8127540165886753774190652462720 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 22. -/
theorem ep_Q2_002_partial_22_0050_valid :
    mulPoly ep_Q2_002_coefficient_22_0050
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0051 : Poly :=
[
  term ((254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)]
]

/-- Partial product 51 for generator 22. -/
def ep_Q2_002_partial_22_0051 : Poly :=
[
  term ((509196272315970129976896372480 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1), (10, 1)],
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 2)],
  term ((509196272315970129976896372480 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 22. -/
theorem ep_Q2_002_partial_22_0051_valid :
    mulPoly ep_Q2_002_coefficient_22_0051
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0052 : Poly :=
[
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1)]
]

/-- Partial product 52 for generator 22. -/
def ep_Q2_002_partial_22_0052 : Poly :=
[
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 1), (10, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 2)],
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 22. -/
theorem ep_Q2_002_partial_22_0052_valid :
    mulPoly ep_Q2_002_coefficient_22_0052
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0053 : Poly :=
[
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1)]
]

/-- Partial product 53 for generator 22. -/
def ep_Q2_002_partial_22_0053 : Poly :=
[
  term ((-3009446408864978103490363349568 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (9, 2)],
  term ((-3009446408864978103490363349568 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2), (10, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 22. -/
theorem ep_Q2_002_partial_22_0053_valid :
    mulPoly ep_Q2_002_coefficient_22_0053
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0054 : Poly :=
[
  term ((749546093552165919415403977920 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 54 for generator 22. -/
def ep_Q2_002_partial_22_0054 : Poly :=
[
  term ((1499092187104331838830807955840 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((-749546093552165919415403977920 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2), (12, 1)],
  term ((1499092187104331838830807955840 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-749546093552165919415403977920 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 22. -/
theorem ep_Q2_002_partial_22_0054_valid :
    mulPoly ep_Q2_002_coefficient_22_0054
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0055 : Poly :=
[
  term ((227950486563179753811981154034640 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 55 for generator 22. -/
def ep_Q2_002_partial_22_0055 : Poly :=
[
  term ((455900973126359507623962308069280 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-227950486563179753811981154034640 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((455900973126359507623962308069280 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-227950486563179753811981154034640 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 22. -/
theorem ep_Q2_002_partial_22_0055_valid :
    mulPoly ep_Q2_002_coefficient_22_0055
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0056 : Poly :=
[
  term ((101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 56 for generator 22. -/
def ep_Q2_002_partial_22_0056 : Poly :=
[
  term ((203859036532890761501634697068188819866128 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((203859036532890761501634697068188819866128 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 22. -/
theorem ep_Q2_002_partial_22_0056_valid :
    mulPoly ep_Q2_002_coefficient_22_0056
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0057 : Poly :=
[
  term ((3649061966 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 22. -/
def ep_Q2_002_partial_22_0057 : Poly :=
[
  term ((7298123932 : Rat) / 1480263449) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((7298123932 : Rat) / 1480263449) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 22. -/
theorem ep_Q2_002_partial_22_0057_valid :
    mulPoly ep_Q2_002_coefficient_22_0057
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0058 : Poly :=
[
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 58 for generator 22. -/
def ep_Q2_002_partial_22_0058 : Poly :=
[
  term ((-14008864293390933964005499264032 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (11, 2)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 2)],
  term ((-14008864293390933964005499264032 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 3)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 22. -/
theorem ep_Q2_002_partial_22_0058_valid :
    mulPoly ep_Q2_002_coefficient_22_0058
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0059 : Poly :=
[
  term ((219792789898111345666653600979629121140024 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 59 for generator 22. -/
def ep_Q2_002_partial_22_0059 : Poly :=
[
  term ((439585579796222691333307201959258242280048 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-219792789898111345666653600979629121140024 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((439585579796222691333307201959258242280048 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-219792789898111345666653600979629121140024 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 22. -/
theorem ep_Q2_002_partial_22_0059_valid :
    mulPoly ep_Q2_002_coefficient_22_0059
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0060 : Poly :=
[
  term ((-3067866786 : Rat) / 211466207) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 22. -/
def ep_Q2_002_partial_22_0060 : Poly :=
[
  term ((-6135733572 : Rat) / 211466207) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3067866786 : Rat) / 211466207) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6135733572 : Rat) / 211466207) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3067866786 : Rat) / 211466207) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 22. -/
theorem ep_Q2_002_partial_22_0060_valid :
    mulPoly ep_Q2_002_coefficient_22_0060
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0061 : Poly :=
[
  term ((-404432976652243281416636101371456 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 61 for generator 22. -/
def ep_Q2_002_partial_22_0061 : Poly :=
[
  term ((-808865953304486562833272202742912 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((404432976652243281416636101371456 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (13, 2)],
  term ((-808865953304486562833272202742912 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((404432976652243281416636101371456 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 22. -/
theorem ep_Q2_002_partial_22_0061_valid :
    mulPoly ep_Q2_002_coefficient_22_0061
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0062 : Poly :=
[
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 62 for generator 22. -/
def ep_Q2_002_partial_22_0062 : Poly :=
[
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 2), (11, 1)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 22. -/
theorem ep_Q2_002_partial_22_0062_valid :
    mulPoly ep_Q2_002_coefficient_22_0062
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0063 : Poly :=
[
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 63 for generator 22. -/
def ep_Q2_002_partial_22_0063 : Poly :=
[
  term ((159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 2), (13, 1)],
  term ((159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 22. -/
theorem ep_Q2_002_partial_22_0063_valid :
    mulPoly ep_Q2_002_coefficient_22_0063
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0064 : Poly :=
[
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 64 for generator 22. -/
def ep_Q2_002_partial_22_0064 : Poly :=
[
  term ((154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 2), (15, 1)],
  term ((154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 22. -/
theorem ep_Q2_002_partial_22_0064_valid :
    mulPoly ep_Q2_002_coefficient_22_0064
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0065 : Poly :=
[
  term ((7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 22. -/
def ep_Q2_002_partial_22_0065 : Poly :=
[
  term ((15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 22. -/
theorem ep_Q2_002_partial_22_0065_valid :
    mulPoly ep_Q2_002_coefficient_22_0065
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0066 : Poly :=
[
  term ((30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 66 for generator 22. -/
def ep_Q2_002_partial_22_0066 : Poly :=
[
  term ((61415744497779026055717781071552 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 1), (11, 2)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((61415744497779026055717781071552 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (10, 1), (11, 1)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 22. -/
theorem ep_Q2_002_partial_22_0066_valid :
    mulPoly ep_Q2_002_coefficient_22_0066
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0067 : Poly :=
[
  term ((-57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 67 for generator 22. -/
def ep_Q2_002_partial_22_0067 : Poly :=
[
  term ((-115657348326433855053127110998784 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-115657348326433855053127110998784 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 22. -/
theorem ep_Q2_002_partial_22_0067_valid :
    mulPoly ep_Q2_002_coefficient_22_0067
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0068 : Poly :=
[
  term ((65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 68 for generator 22. -/
def ep_Q2_002_partial_22_0068 : Poly :=
[
  term ((131933703589237654381819223291143646430192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((131933703589237654381819223291143646430192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 22. -/
theorem ep_Q2_002_partial_22_0068_valid :
    mulPoly ep_Q2_002_coefficient_22_0068
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0069 : Poly :=
[
  term ((-18196285962 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 22. -/
def ep_Q2_002_partial_22_0069 : Poly :=
[
  term ((-36392571924 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((18196285962 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-36392571924 : Rat) / 7401317245) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((18196285962 : Rat) / 7401317245) [(5, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 22. -/
theorem ep_Q2_002_partial_22_0069_valid :
    mulPoly ep_Q2_002_coefficient_22_0069
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0070 : Poly :=
[
  term ((11193729647201602988859277907904 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

/-- Partial product 70 for generator 22. -/
def ep_Q2_002_partial_22_0070 : Poly :=
[
  term ((22387459294403205977718555815808 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-11193729647201602988859277907904 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1)],
  term ((22387459294403205977718555815808 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 2)],
  term ((-11193729647201602988859277907904 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 22. -/
theorem ep_Q2_002_partial_22_0070_valid :
    mulPoly ep_Q2_002_coefficient_22_0070
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0071 : Poly :=
[
  term ((-1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 71 for generator 22. -/
def ep_Q2_002_partial_22_0071 : Poly :=
[
  term ((-2936478998828259432742800174912 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((-2936478998828259432742800174912 : Rat) / 115799135485108289802725034287) [(5, 1), (9, 1), (11, 2), (12, 1)],
  term ((1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 22. -/
theorem ep_Q2_002_partial_22_0071_valid :
    mulPoly ep_Q2_002_coefficient_22_0071
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0072 : Poly :=
[
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 72 for generator 22. -/
def ep_Q2_002_partial_22_0072 : Poly :=
[
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 22. -/
theorem ep_Q2_002_partial_22_0072_valid :
    mulPoly ep_Q2_002_coefficient_22_0072
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0073 : Poly :=
[
  term ((2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 73 for generator 22. -/
def ep_Q2_002_partial_22_0073 : Poly :=
[
  term ((5529939874505951901174095387904 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((5529939874505951901174095387904 : Rat) / 115799135485108289802725034287) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 22. -/
theorem ep_Q2_002_partial_22_0073_valid :
    mulPoly ep_Q2_002_coefficient_22_0073
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0074 : Poly :=
[
  term ((101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 74 for generator 22. -/
def ep_Q2_002_partial_22_0074 : Poly :=
[
  term ((203393973118845286636556136308014452997536 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((203393973118845286636556136308014452997536 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 22. -/
theorem ep_Q2_002_partial_22_0074_valid :
    mulPoly ep_Q2_002_coefficient_22_0074
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0075 : Poly :=
[
  term ((40423427124 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 22. -/
def ep_Q2_002_partial_22_0075 : Poly :=
[
  term ((80846854248 : Rat) / 7401317245) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40423427124 : Rat) / 7401317245) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((80846854248 : Rat) / 7401317245) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40423427124 : Rat) / 7401317245) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 22. -/
theorem ep_Q2_002_partial_22_0075_valid :
    mulPoly ep_Q2_002_coefficient_22_0075
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0076 : Poly :=
[
  term ((-21079889195597771005619190759168 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

/-- Partial product 76 for generator 22. -/
def ep_Q2_002_partial_22_0076 : Poly :=
[
  term ((-42159778391195542011238381518336 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((21079889195597771005619190759168 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (13, 1)],
  term ((-42159778391195542011238381518336 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((21079889195597771005619190759168 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 22. -/
theorem ep_Q2_002_partial_22_0076_valid :
    mulPoly ep_Q2_002_coefficient_22_0076
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0077 : Poly :=
[
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 77 for generator 22. -/
def ep_Q2_002_partial_22_0077 : Poly :=
[
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 22. -/
theorem ep_Q2_002_partial_22_0077_valid :
    mulPoly ep_Q2_002_coefficient_22_0077
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0078 : Poly :=
[
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 78 for generator 22. -/
def ep_Q2_002_partial_22_0078 : Poly :=
[
  term ((-54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 22. -/
theorem ep_Q2_002_partial_22_0078_valid :
    mulPoly ep_Q2_002_coefficient_22_0078
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0079 : Poly :=
[
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 22. -/
def ep_Q2_002_partial_22_0079 : Poly :=
[
  term ((-2487323152 : Rat) / 211466207) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2487323152 : Rat) / 211466207) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 22. -/
theorem ep_Q2_002_partial_22_0079_valid :
    mulPoly ep_Q2_002_coefficient_22_0079
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0080 : Poly :=
[
  term ((246164659447810016269393719642337569471468 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 1)]
]

/-- Partial product 80 for generator 22. -/
def ep_Q2_002_partial_22_0080 : Poly :=
[
  term ((492329318895620032538787439284675138942936 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-246164659447810016269393719642337569471468 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 2), (15, 1)],
  term ((492329318895620032538787439284675138942936 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-246164659447810016269393719642337569471468 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 22. -/
theorem ep_Q2_002_partial_22_0080_valid :
    mulPoly ep_Q2_002_coefficient_22_0080
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0081 : Poly :=
[
  term ((-545632741 : Rat) / 7401317245) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 22. -/
def ep_Q2_002_partial_22_0081 : Poly :=
[
  term ((-1091265482 : Rat) / 7401317245) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((545632741 : Rat) / 7401317245) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1091265482 : Rat) / 7401317245) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((545632741 : Rat) / 7401317245) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 22. -/
theorem ep_Q2_002_partial_22_0081_valid :
    mulPoly ep_Q2_002_coefficient_22_0081
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0082 : Poly :=
[
  term ((143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 82 for generator 22. -/
def ep_Q2_002_partial_22_0082 : Poly :=
[
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 22. -/
theorem ep_Q2_002_partial_22_0082_valid :
    mulPoly ep_Q2_002_coefficient_22_0082
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0083 : Poly :=
[
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 83 for generator 22. -/
def ep_Q2_002_partial_22_0083 : Poly :=
[
  term ((123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 22. -/
theorem ep_Q2_002_partial_22_0083_valid :
    mulPoly ep_Q2_002_coefficient_22_0083
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0084 : Poly :=
[
  term ((70368054424 : Rat) / 7401317245) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 22. -/
def ep_Q2_002_partial_22_0084 : Poly :=
[
  term ((140736108848 : Rat) / 7401317245) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70368054424 : Rat) / 7401317245) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((140736108848 : Rat) / 7401317245) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-70368054424 : Rat) / 7401317245) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 22. -/
theorem ep_Q2_002_partial_22_0084_valid :
    mulPoly ep_Q2_002_coefficient_22_0084
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0085 : Poly :=
[
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

/-- Partial product 85 for generator 22. -/
def ep_Q2_002_partial_22_0085 : Poly :=
[
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (10, 1), (11, 2)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 2)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 3)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 22. -/
theorem ep_Q2_002_partial_22_0085_valid :
    mulPoly ep_Q2_002_coefficient_22_0085
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0086 : Poly :=
[
  term ((87516987952133714817881732436792 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 86 for generator 22. -/
def ep_Q2_002_partial_22_0086 : Poly :=
[
  term ((175033975904267429635763464873584 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-87516987952133714817881732436792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 2), (11, 1)],
  term ((175033975904267429635763464873584 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 2)],
  term ((-87516987952133714817881732436792 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 22. -/
theorem ep_Q2_002_partial_22_0086_valid :
    mulPoly ep_Q2_002_coefficient_22_0086
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0087 : Poly :=
[
  term ((-164810877777868260187850033520864 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 87 for generator 22. -/
def ep_Q2_002_partial_22_0087 : Poly :=
[
  term ((-329621755555736520375700067041728 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((164810877777868260187850033520864 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 2), (13, 1)],
  term ((-329621755555736520375700067041728 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((164810877777868260187850033520864 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 22. -/
theorem ep_Q2_002_partial_22_0087_valid :
    mulPoly ep_Q2_002_coefficient_22_0087
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0088 : Poly :=
[
  term ((315955259105478657634918042411100753185776 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 88 for generator 22. -/
def ep_Q2_002_partial_22_0088 : Poly :=
[
  term ((631910518210957315269836084822201506371552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-315955259105478657634918042411100753185776 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 2), (15, 1)],
  term ((631910518210957315269836084822201506371552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-315955259105478657634918042411100753185776 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 22. -/
theorem ep_Q2_002_partial_22_0088_valid :
    mulPoly ep_Q2_002_coefficient_22_0088
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0089 : Poly :=
[
  term ((-6759349826 : Rat) / 1057331035) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 22. -/
def ep_Q2_002_partial_22_0089 : Poly :=
[
  term ((-13518699652 : Rat) / 1057331035) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((6759349826 : Rat) / 1057331035) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-13518699652 : Rat) / 1057331035) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6759349826 : Rat) / 1057331035) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 22. -/
theorem ep_Q2_002_partial_22_0089_valid :
    mulPoly ep_Q2_002_coefficient_22_0089
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0090 : Poly :=
[
  term ((-279783302284388647060146884925648 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 90 for generator 22. -/
def ep_Q2_002_partial_22_0090 : Poly :=
[
  term ((-559566604568777294120293769851296 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((279783302284388647060146884925648 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-559566604568777294120293769851296 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((279783302284388647060146884925648 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 22. -/
theorem ep_Q2_002_partial_22_0090_valid :
    mulPoly ep_Q2_002_coefficient_22_0090
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0091 : Poly :=
[
  term ((-127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 91 for generator 22. -/
def ep_Q2_002_partial_22_0091 : Poly :=
[
  term ((-254638139175374381610552186344054470135872 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-254638139175374381610552186344054470135872 : Rat) / 269363643504064505317229453910785233499) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 22. -/
theorem ep_Q2_002_partial_22_0091_valid :
    mulPoly ep_Q2_002_coefficient_22_0091
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0092 : Poly :=
[
  term ((-7145891948 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 22. -/
def ep_Q2_002_partial_22_0092 : Poly :=
[
  term ((-14291783896 : Rat) / 1480263449) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((7145891948 : Rat) / 1480263449) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-14291783896 : Rat) / 1480263449) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7145891948 : Rat) / 1480263449) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 22. -/
theorem ep_Q2_002_partial_22_0092_valid :
    mulPoly ep_Q2_002_coefficient_22_0092
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0093 : Poly :=
[
  term ((29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 93 for generator 22. -/
def ep_Q2_002_partial_22_0093 : Poly :=
[
  term ((59810297699116538329377365866080 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 3)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 2)],
  term ((59810297699116538329377365866080 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (11, 2)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 22. -/
theorem ep_Q2_002_partial_22_0093_valid :
    mulPoly ep_Q2_002_coefficient_22_0093
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0094 : Poly :=
[
  term ((-281027393596665699759044857087815776363280 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 94 for generator 22. -/
def ep_Q2_002_partial_22_0094 : Poly :=
[
  term ((-562054787193331399518089714175631552726560 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((281027393596665699759044857087815776363280 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-562054787193331399518089714175631552726560 : Rat) / 269363643504064505317229453910785233499) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((281027393596665699759044857087815776363280 : Rat) / 269363643504064505317229453910785233499) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 22. -/
theorem ep_Q2_002_partial_22_0094_valid :
    mulPoly ep_Q2_002_coefficient_22_0094
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0095 : Poly :=
[
  term ((20927629736 : Rat) / 1480263449) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 22. -/
def ep_Q2_002_partial_22_0095 : Poly :=
[
  term ((41855259472 : Rat) / 1480263449) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20927629736 : Rat) / 1480263449) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((41855259472 : Rat) / 1480263449) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20927629736 : Rat) / 1480263449) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 22. -/
theorem ep_Q2_002_partial_22_0095_valid :
    mulPoly ep_Q2_002_coefficient_22_0095
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0096 : Poly :=
[
  term ((420828904283645193719167648213056 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 96 for generator 22. -/
def ep_Q2_002_partial_22_0096 : Poly :=
[
  term ((841657808567290387438335296426112 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-420828904283645193719167648213056 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (13, 2)],
  term ((841657808567290387438335296426112 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (13, 2)],
  term ((-420828904283645193719167648213056 : Rat) / 1273790490336191187829975377157) [(8, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 22. -/
theorem ep_Q2_002_partial_22_0096_valid :
    mulPoly ep_Q2_002_coefficient_22_0096
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0097 : Poly :=
[
  term ((14529845008705171377700109034288 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 97 for generator 22. -/
def ep_Q2_002_partial_22_0097 : Poly :=
[
  term ((29059690017410342755400218068576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-14529845008705171377700109034288 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (11, 1)],
  term ((29059690017410342755400218068576 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 2)],
  term ((-14529845008705171377700109034288 : Rat) / 1273790490336191187829975377157) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 22. -/
theorem ep_Q2_002_partial_22_0097_valid :
    mulPoly ep_Q2_002_coefficient_22_0097
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0098 : Poly :=
[
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 98 for generator 22. -/
def ep_Q2_002_partial_22_0098 : Poly :=
[
  term ((-31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 2), (14, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 22. -/
theorem ep_Q2_002_partial_22_0098_valid :
    mulPoly ep_Q2_002_coefficient_22_0098
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 22. -/
def ep_Q2_002_coefficient_22_0099 : Poly :=
[
  term ((-27362419181642934817818975458496 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 99 for generator 22. -/
def ep_Q2_002_partial_22_0099 : Poly :=
[
  term ((-54724838363285869635637950916992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((27362419181642934817818975458496 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (13, 1)],
  term ((-54724838363285869635637950916992 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (13, 1)],
  term ((27362419181642934817818975458496 : Rat) / 1273790490336191187829975377157) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 22. -/
theorem ep_Q2_002_partial_22_0099_valid :
    mulPoly ep_Q2_002_coefficient_22_0099
        ep_Q2_002_generator_22_0000_0099 =
      ep_Q2_002_partial_22_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_22_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_22_0000,
  ep_Q2_002_partial_22_0001,
  ep_Q2_002_partial_22_0002,
  ep_Q2_002_partial_22_0003,
  ep_Q2_002_partial_22_0004,
  ep_Q2_002_partial_22_0005,
  ep_Q2_002_partial_22_0006,
  ep_Q2_002_partial_22_0007,
  ep_Q2_002_partial_22_0008,
  ep_Q2_002_partial_22_0009,
  ep_Q2_002_partial_22_0010,
  ep_Q2_002_partial_22_0011,
  ep_Q2_002_partial_22_0012,
  ep_Q2_002_partial_22_0013,
  ep_Q2_002_partial_22_0014,
  ep_Q2_002_partial_22_0015,
  ep_Q2_002_partial_22_0016,
  ep_Q2_002_partial_22_0017,
  ep_Q2_002_partial_22_0018,
  ep_Q2_002_partial_22_0019,
  ep_Q2_002_partial_22_0020,
  ep_Q2_002_partial_22_0021,
  ep_Q2_002_partial_22_0022,
  ep_Q2_002_partial_22_0023,
  ep_Q2_002_partial_22_0024,
  ep_Q2_002_partial_22_0025,
  ep_Q2_002_partial_22_0026,
  ep_Q2_002_partial_22_0027,
  ep_Q2_002_partial_22_0028,
  ep_Q2_002_partial_22_0029,
  ep_Q2_002_partial_22_0030,
  ep_Q2_002_partial_22_0031,
  ep_Q2_002_partial_22_0032,
  ep_Q2_002_partial_22_0033,
  ep_Q2_002_partial_22_0034,
  ep_Q2_002_partial_22_0035,
  ep_Q2_002_partial_22_0036,
  ep_Q2_002_partial_22_0037,
  ep_Q2_002_partial_22_0038,
  ep_Q2_002_partial_22_0039,
  ep_Q2_002_partial_22_0040,
  ep_Q2_002_partial_22_0041,
  ep_Q2_002_partial_22_0042,
  ep_Q2_002_partial_22_0043,
  ep_Q2_002_partial_22_0044,
  ep_Q2_002_partial_22_0045,
  ep_Q2_002_partial_22_0046,
  ep_Q2_002_partial_22_0047,
  ep_Q2_002_partial_22_0048,
  ep_Q2_002_partial_22_0049,
  ep_Q2_002_partial_22_0050,
  ep_Q2_002_partial_22_0051,
  ep_Q2_002_partial_22_0052,
  ep_Q2_002_partial_22_0053,
  ep_Q2_002_partial_22_0054,
  ep_Q2_002_partial_22_0055,
  ep_Q2_002_partial_22_0056,
  ep_Q2_002_partial_22_0057,
  ep_Q2_002_partial_22_0058,
  ep_Q2_002_partial_22_0059,
  ep_Q2_002_partial_22_0060,
  ep_Q2_002_partial_22_0061,
  ep_Q2_002_partial_22_0062,
  ep_Q2_002_partial_22_0063,
  ep_Q2_002_partial_22_0064,
  ep_Q2_002_partial_22_0065,
  ep_Q2_002_partial_22_0066,
  ep_Q2_002_partial_22_0067,
  ep_Q2_002_partial_22_0068,
  ep_Q2_002_partial_22_0069,
  ep_Q2_002_partial_22_0070,
  ep_Q2_002_partial_22_0071,
  ep_Q2_002_partial_22_0072,
  ep_Q2_002_partial_22_0073,
  ep_Q2_002_partial_22_0074,
  ep_Q2_002_partial_22_0075,
  ep_Q2_002_partial_22_0076,
  ep_Q2_002_partial_22_0077,
  ep_Q2_002_partial_22_0078,
  ep_Q2_002_partial_22_0079,
  ep_Q2_002_partial_22_0080,
  ep_Q2_002_partial_22_0081,
  ep_Q2_002_partial_22_0082,
  ep_Q2_002_partial_22_0083,
  ep_Q2_002_partial_22_0084,
  ep_Q2_002_partial_22_0085,
  ep_Q2_002_partial_22_0086,
  ep_Q2_002_partial_22_0087,
  ep_Q2_002_partial_22_0088,
  ep_Q2_002_partial_22_0089,
  ep_Q2_002_partial_22_0090,
  ep_Q2_002_partial_22_0091,
  ep_Q2_002_partial_22_0092,
  ep_Q2_002_partial_22_0093,
  ep_Q2_002_partial_22_0094,
  ep_Q2_002_partial_22_0095,
  ep_Q2_002_partial_22_0096,
  ep_Q2_002_partial_22_0097,
  ep_Q2_002_partial_22_0098,
  ep_Q2_002_partial_22_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_22_0000_0099 : Poly :=
[
  term ((-595853124147594276388156549632 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (8, 1), (10, 1)],
  term ((297926562073797138194078274816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (8, 2)],
  term ((-595853124147594276388156549632 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1)],
  term ((297926562073797138194078274816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 2)],
  term ((-5331770704608898286404069002048 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1)],
  term ((-181211112559335036882789772875840 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1)],
  term ((334939594023752475891296249390208 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1)],
  term ((2870460998600555409954400696365289900633536 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((185849697408 : Rat) / 7401317245) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2665885352304449143202034501024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((90605556279667518441394886437920 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (11, 1)],
  term ((-167469797011876237945648124695104 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((-1435230499300277704977200348182644950316768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((-92924848704 : Rat) / 7401317245) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((334939594023752475891296249390208 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((2870460998600555409954400696365289900633536 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((185849697408 : Rat) / 7401317245) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-181211112559335036882789772875840 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((85273785575058620154990817435872 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((-167469797011876237945648124695104 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((-1435230499300277704977200348182644950316768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((-92924848704 : Rat) / 7401317245) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((2665885352304449143202034501024 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 3)],
  term ((12056965355035940959148585518848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 1), (10, 1)],
  term ((-6028482677517970479574292759424 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 2)],
  term ((12056965355035940959148585518848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-6028482677517970479574292759424 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 2)],
  term ((8424282206247544375067232699264 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-15864501024869698909026762444288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((76589826446329419731180262551440535711088 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((893472716 : Rat) / 1480263449) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4212141103123772187533616349632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 2), (11, 1)],
  term ((7932250512434849454513381222144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 2), (13, 1)],
  term ((-38294913223164709865590131275720267855544 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((-446736358 : Rat) / 1480263449) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-15864501024869698909026762444288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((76589826446329419731180262551440535711088 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((893472716 : Rat) / 1480263449) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8424282206247544375067232699264 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-4212141103123772187533616349632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (11, 1)],
  term ((7932250512434849454513381222144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (13, 1)],
  term ((-38294913223164709865590131275720267855544 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((-446736358 : Rat) / 1480263449) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((75381565111174589251463516154096 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-141957603945844166987979108944832 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-416348906891467718357160011798507501116176 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-58158242648 : Rat) / 7401317245) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-483020194654180077694810683730848 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-140736108848 : Rat) / 7401317245) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((770025886199361496187345741305575115806048 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((47014590512 : Rat) / 1480263449) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((370742547388995550013337204384384 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((-37690782555587294625731758077048 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((70978801972922083493989554472416 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((208174453445733859178580005899253750558088 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((29079121324 : Rat) / 7401317245) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((241510097327090038847405341865424 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((70368054424 : Rat) / 7401317245) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 2)],
  term ((-385012943099680748093672870652787557903024 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((-23507295256 : Rat) / 1480263449) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-185371273694497775006668602192192 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (13, 2)],
  term ((770025886199361496187345741305575115806048 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((47014590512 : Rat) / 1480263449) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((370742547388995550013337204384384 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-483020194654180077694810683730848 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-140736108848 : Rat) / 7401317245) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 3)],
  term ((99552493381245871859426232920592 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((388117683652291519871269687078744718432112 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((12209811776 : Rat) / 7401317245) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-593480176970785833753675384048 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 2)],
  term ((-385012943099680748093672870652787557903024 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((-23507295256 : Rat) / 1480263449) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-185371273694497775006668602192192 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (13, 2)],
  term ((-37690782555587294625731758077048 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (11, 1)],
  term ((70978801972922083493989554472416 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (13, 1)],
  term ((208174453445733859178580005899253750558088 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 3), (15, 1)],
  term ((29079121324 : Rat) / 7401317245) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((-6208258499569949673373390762944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((-16822835999618740667610360094848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1)],
  term ((690774394033672977948602462379901714410144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((23668011432 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3104129249784974836686695381472 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (11, 1)],
  term ((8411417999809370333805180047424 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (13, 1)],
  term ((-345387197016836488974301231189950857205072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (8, 2), (15, 1)],
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((-16822835999618740667610360094848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 1)],
  term ((690774394033672977948602462379901714410144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((23668011432 : Rat) / 7401317245) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6208258499569949673373390762944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((3104129249784974836686695381472 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (11, 1)],
  term ((8411417999809370333805180047424 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (13, 1)],
  term ((-345387197016836488974301231189950857205072 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (9, 2), (15, 1)],
  term ((-11834005716 : Rat) / 7401317245) [(1, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1), (10, 1)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 2)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (9, 2)],
  term ((-4343962172078347478826566635776 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((-1583474678994540155403637307904 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (10, 1)],
  term ((207698429683185715142099187456 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1)],
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((791737339497270077701818653952 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2)],
  term ((-4343962172078347478826566635776 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (10, 1)],
  term ((-103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (14, 1)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 3)],
  term ((-1583474678994540155403637307904 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((207698429683185715142099187456 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1)],
  term ((791737339497270077701818653952 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2)],
  term ((-103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (9, 2), (12, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2), (14, 1)],
  term ((11694161901657677996437123727328 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-122493044056 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5847080950828838998218561863664 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (8, 2), (11, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 2), (13, 1)],
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 2), (15, 1)],
  term ((61246522028 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-122493044056 : Rat) / 7401317245) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11694161901657677996437123727328 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((-5847080950828838998218561863664 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((61246522028 : Rat) / 7401317245) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-12380228822010076651736326761792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((6190114411005038325868163380896 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 2)],
  term ((-12380228822010076651736326761792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((6190114411005038325868163380896 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 2)],
  term ((-2055404443929167112747237084288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-48514327088534771475302251892544 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-216170623549163814025913582981085571413888 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-11486122036 : Rat) / 1480263449) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((38317704397147092424314327666096 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((24257163544267385737651125946272 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1636697586723160019872427797440 : Rat) / 8907625806546791523286541099) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-21194443941892563773742280411680 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((20227122125545201658994786094080 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-674332294152625273469109620404539561828384 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6772855472 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((439530762095977241585742813489024 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-81703000364836298330386238110350587309856 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((27341646296 : Rat) / 1480263449) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1027702221964583556373618542144 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (9, 1)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (9, 1), (14, 1)],
  term ((38317704397147092424314327666096 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (10, 1), (11, 1)],
  term ((-48514327088534771475302251892544 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((-216170623549163814025913582981085571413888 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-11486122036 : Rat) / 1480263449) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((818348793361580009936213898720 : Rat) / 8907625806546791523286541099) [(1, 1), (8, 2), (11, 1)],
  term ((10597221970946281886871140205840 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((-10113561062772600829497393047040 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((337166147076312636734554810202269780914192 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((3386427736 : Rat) / 7401317245) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-219765381047988620792871406744512 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)],
  term ((40851500182418149165193119055175293654928 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 2), (15, 1)],
  term ((-13670823148 : Rat) / 1480263449) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (11, 1)],
  term ((24257163544267385737651125946272 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (13, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 3), (15, 1)],
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (8, 3), (15, 1), (16, 1)],
  term ((20227122125545201658994786094080 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-674332294152625273469109620404539561828384 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6772855472 : Rat) / 7401317245) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((439530762095977241585742813489024 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-81703000364836298330386238110350587309856 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((27341646296 : Rat) / 1480263449) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1636697586723160019872427797440 : Rat) / 8907625806546791523286541099) [(1, 1), (9, 1), (11, 2)],
  term ((-21194443941892563773742280411680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((114968473006776774308131350432672 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1)],
  term ((10597221970946281886871140205840 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((-10113561062772600829497393047040 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((337166147076312636734554810202269780914192 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((3386427736 : Rat) / 7401317245) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-219765381047988620792871406744512 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1)],
  term ((40851500182418149165193119055175293654928 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (9, 2), (15, 1)],
  term ((-13670823148 : Rat) / 1480263449) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((1027702221964583556373618542144 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 3)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 3), (14, 1)],
  term ((509196272315970129976896372480 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1), (10, 1)],
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 2)],
  term ((509196272315970129976896372480 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 2)],
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 1), (10, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 2)],
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 2)],
  term ((-3009446408864978103490363349568 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (9, 2)],
  term ((16255080331773507548381304925440 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1)],
  term ((1499092187104331838830807955840 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((-8127540165886753774190652462720 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2)],
  term ((-3009446408864978103490363349568 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2), (10, 1)],
  term ((-749546093552165919415403977920 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2), (12, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 3)],
  term ((16255080331773507548381304925440 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1)],
  term ((1499092187104331838830807955840 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-8127540165886753774190652462720 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2)],
  term ((-749546093552165919415403977920 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (12, 1)],
  term ((455900973126359507623962308069280 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((203859036532890761501634697068188819866128 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((7298123932 : Rat) / 1480263449) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14008864293390933964005499264032 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (11, 2)],
  term ((439585579796222691333307201959258242280048 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-6135733572 : Rat) / 211466207) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-808865953304486562833272202742912 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((-227950486563179753811981154034640 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((-101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 2)],
  term ((-219792789898111345666653600979629121140024 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((3067866786 : Rat) / 211466207) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((404432976652243281416636101371456 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (13, 2)],
  term ((439585579796222691333307201959258242280048 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6135733572 : Rat) / 211466207) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-808865953304486562833272202742912 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((455900973126359507623962308069280 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((203859036532890761501634697068188819866128 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((7298123932 : Rat) / 1480263449) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-14008864293390933964005499264032 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 3)],
  term ((-227950486563179753811981154034640 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 2)],
  term ((-219792789898111345666653600979629121140024 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 2), (13, 1), (15, 1)],
  term ((3067866786 : Rat) / 211466207) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((404432976652243281416636101371456 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (13, 2)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 2), (11, 1)],
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 2), (13, 1)],
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 2), (15, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 2), (11, 1)],
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 2), (13, 1)],
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-115657348326433855053127110998784 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((131933703589237654381819223291143646430192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-36392571924 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((61415744497779026055717781071552 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 1), (11, 2)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((18196285962 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((22387459294403205977718555815808 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2936478998828259432742800174912 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((5529939874505951901174095387904 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((203393973118845286636556136308014452997536 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((80846854248 : Rat) / 7401317245) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42159778391195542011238381518336 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2487323152 : Rat) / 211466207) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((492329318895620032538787439284675138942936 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1091265482 : Rat) / 7401317245) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((61415744497779026055717781071552 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (10, 1), (11, 1)],
  term ((-115657348326433855053127110998784 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((131933703589237654381819223291143646430192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((-36392571924 : Rat) / 7401317245) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-11193729647201602988859277907904 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1)],
  term ((1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((-2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((-101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((-40423427124 : Rat) / 7401317245) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((21079889195597771005619190759168 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (13, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-246164659447810016269393719642337569471468 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 2), (15, 1)],
  term ((545632741 : Rat) / 7401317245) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (11, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (13, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 3), (15, 1)],
  term ((18196285962 : Rat) / 7401317245) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((5529939874505951901174095387904 : Rat) / 115799135485108289802725034287) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((203393973118845286636556136308014452997536 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((80846854248 : Rat) / 7401317245) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42159778391195542011238381518336 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2487323152 : Rat) / 211466207) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((492329318895620032538787439284675138942936 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1091265482 : Rat) / 7401317245) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((22387459294403205977718555815808 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 2)],
  term ((-2936478998828259432742800174912 : Rat) / 115799135485108289802725034287) [(5, 1), (9, 1), (11, 2), (12, 1)],
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-11193729647201602988859277907904 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1)],
  term ((1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((-2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-40423427124 : Rat) / 7401317245) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((21079889195597771005619190759168 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (13, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (13, 1), (14, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-246164659447810016269393719642337569471468 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 2), (15, 1)],
  term ((545632741 : Rat) / 7401317245) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((140736108848 : Rat) / 7401317245) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (10, 1), (11, 2)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((-70368054424 : Rat) / 7401317245) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 2)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((140736108848 : Rat) / 7401317245) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 3)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-70368054424 : Rat) / 7401317245) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 2)],
  term ((175033975904267429635763464873584 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-329621755555736520375700067041728 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((631910518210957315269836084822201506371552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-13518699652 : Rat) / 1057331035) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-87516987952133714817881732436792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 2), (11, 1)],
  term ((164810877777868260187850033520864 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 2), (13, 1)],
  term ((-315955259105478657634918042411100753185776 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 2), (15, 1)],
  term ((6759349826 : Rat) / 1057331035) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-329621755555736520375700067041728 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((631910518210957315269836084822201506371552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-13518699652 : Rat) / 1057331035) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((175033975904267429635763464873584 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 2)],
  term ((-87516987952133714817881732436792 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 2), (11, 1)],
  term ((164810877777868260187850033520864 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 2), (13, 1)],
  term ((-315955259105478657634918042411100753185776 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 2), (15, 1)],
  term ((6759349826 : Rat) / 1057331035) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((29059690017410342755400218068576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-54724838363285869635637950916992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-562054787193331399518089714175631552726560 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((41855259472 : Rat) / 1480263449) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((841657808567290387438335296426112 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-559566604568777294120293769851296 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-254638139175374381610552186344054470135872 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-14291783896 : Rat) / 1480263449) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((59810297699116538329377365866080 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 3)],
  term ((279783302284388647060146884925648 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((7145891948 : Rat) / 1480263449) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 2)],
  term ((281027393596665699759044857087815776363280 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-20927629736 : Rat) / 1480263449) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-420828904283645193719167648213056 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (13, 2)],
  term ((-14529845008705171377700109034288 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (11, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((27362419181642934817818975458496 : Rat) / 1273790490336191187829975377157) [(8, 2), (9, 1), (13, 1)],
  term ((-559566604568777294120293769851296 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-254638139175374381610552186344054470135872 : Rat) / 269363643504064505317229453910785233499) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-14291783896 : Rat) / 1480263449) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((59810297699116538329377365866080 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (11, 2)],
  term ((-562054787193331399518089714175631552726560 : Rat) / 269363643504064505317229453910785233499) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((41855259472 : Rat) / 1480263449) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((841657808567290387438335296426112 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (13, 2)],
  term ((279783302284388647060146884925648 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 1), (13, 1)],
  term ((127319069587687190805276093172027235067936 : Rat) / 269363643504064505317229453910785233499) [(8, 3), (11, 1), (15, 1)],
  term ((7145891948 : Rat) / 1480263449) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((-29905148849558269164688682933040 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 2)],
  term ((281027393596665699759044857087815776363280 : Rat) / 269363643504064505317229453910785233499) [(8, 3), (13, 1), (15, 1)],
  term ((-20927629736 : Rat) / 1480263449) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-420828904283645193719167648213056 : Rat) / 1273790490336191187829975377157) [(8, 3), (13, 2)],
  term ((-54724838363285869635637950916992 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 1), (13, 1)],
  term ((29059690017410342755400218068576 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 2)],
  term ((-31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(9, 2), (11, 2), (14, 1)],
  term ((-14529845008705171377700109034288 : Rat) / 1273790490336191187829975377157) [(9, 3), (11, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 3), (11, 1), (14, 1)],
  term ((27362419181642934817818975458496 : Rat) / 1273790490336191187829975377157) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 99. -/
theorem ep_Q2_002_block_22_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_22_0000_0099
      ep_Q2_002_block_22_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
