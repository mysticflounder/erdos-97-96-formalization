/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 23:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_23_0000_0099 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0000 : Poly :=
[
  term ((-845459733297039120143260856136 : Rat) / 1273790490336191187829975377157) []
]

/-- Partial product 0 for generator 23. -/
def ep_Q2_002_partial_23_0000 : Poly :=
[
  term ((-1690919466594078240286521712272 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 1)],
  term ((-1690919466594078240286521712272 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)],
  term ((845459733297039120143260856136 : Rat) / 1273790490336191187829975377157) [(12, 2)],
  term ((845459733297039120143260856136 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem ep_Q2_002_partial_23_0000_valid :
    mulPoly ep_Q2_002_coefficient_23_0000
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0001 : Poly :=
[
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 1 for generator 23. -/
def ep_Q2_002_partial_23_0001 : Poly :=
[
  term ((-5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem ep_Q2_002_partial_23_0001_valid :
    mulPoly ep_Q2_002_coefficient_23_0001
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0002 : Poly :=
[
  term ((-5469580692157253865588067864992 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 23. -/
def ep_Q2_002_partial_23_0002 : Poly :=
[
  term ((-10939161384314507731176135729984 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-10939161384314507731176135729984 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((5469580692157253865588067864992 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((5469580692157253865588067864992 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem ep_Q2_002_partial_23_0002_valid :
    mulPoly ep_Q2_002_coefficient_23_0002
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0003 : Poly :=
[
  term ((159112589386238867048433598406160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 3 for generator 23. -/
def ep_Q2_002_partial_23_0003 : Poly :=
[
  term ((318225178772477734096867196812320 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-159112589386238867048433598406160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-159112589386238867048433598406160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((318225178772477734096867196812320 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem ep_Q2_002_partial_23_0003_valid :
    mulPoly ep_Q2_002_coefficient_23_0003
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0004 : Poly :=
[
  term ((-309793533774850332751763025982080 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 4 for generator 23. -/
def ep_Q2_002_partial_23_0004 : Poly :=
[
  term ((-619587067549700665503526051964160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-619587067549700665503526051964160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((309793533774850332751763025982080 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((309793533774850332751763025982080 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem ep_Q2_002_partial_23_0004_valid :
    mulPoly ep_Q2_002_coefficient_23_0004
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0005 : Poly :=
[
  term ((17654266730978266790200072598169569671368 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 5 for generator 23. -/
def ep_Q2_002_partial_23_0005 : Poly :=
[
  term ((35308533461956533580400145196339139342736 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((35308533461956533580400145196339139342736 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-17654266730978266790200072598169569671368 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-17654266730978266790200072598169569671368 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem ep_Q2_002_partial_23_0005_valid :
    mulPoly ep_Q2_002_coefficient_23_0005
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0006 : Poly :=
[
  term ((-2352352898 : Rat) / 211466207) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 23. -/
def ep_Q2_002_partial_23_0006 : Poly :=
[
  term ((-4704705796 : Rat) / 211466207) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4704705796 : Rat) / 211466207) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2352352898 : Rat) / 211466207) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((2352352898 : Rat) / 211466207) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 23. -/
theorem ep_Q2_002_partial_23_0006_valid :
    mulPoly ep_Q2_002_coefficient_23_0006
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0007 : Poly :=
[
  term ((-1056110683206209294039836158144 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2)]
]

/-- Partial product 7 for generator 23. -/
def ep_Q2_002_partial_23_0007 : Poly :=
[
  term ((-2112221366412418588079672316288 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (10, 1), (12, 1)],
  term ((-2112221366412418588079672316288 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((1056110683206209294039836158144 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (12, 2)],
  term ((1056110683206209294039836158144 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 23. -/
theorem ep_Q2_002_partial_23_0007_valid :
    mulPoly ep_Q2_002_coefficient_23_0007
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0008 : Poly :=
[
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 8 for generator 23. -/
def ep_Q2_002_partial_23_0008 : Poly :=
[
  term ((71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 23. -/
theorem ep_Q2_002_partial_23_0008_valid :
    mulPoly ep_Q2_002_coefficient_23_0008
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0009 : Poly :=
[
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 9 for generator 23. -/
def ep_Q2_002_partial_23_0009 : Poly :=
[
  term ((-134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 23. -/
theorem ep_Q2_002_partial_23_0009_valid :
    mulPoly ep_Q2_002_coefficient_23_0009
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0010 : Poly :=
[
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 10 for generator 23. -/
def ep_Q2_002_partial_23_0010 : Poly :=
[
  term ((-1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 23. -/
theorem ep_Q2_002_partial_23_0010_valid :
    mulPoly ep_Q2_002_coefficient_23_0010
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0011 : Poly :=
[
  term ((-41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 23. -/
def ep_Q2_002_partial_23_0011 : Poly :=
[
  term ((-83967334568 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-83967334568 : Rat) / 7401317245) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 23. -/
theorem ep_Q2_002_partial_23_0011_valid :
    mulPoly ep_Q2_002_coefficient_23_0011
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0012 : Poly :=
[
  term ((77329948326598055499362235204984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 12 for generator 23. -/
def ep_Q2_002_partial_23_0012 : Poly :=
[
  term ((154659896653196110998724470409968 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-77329948326598055499362235204984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-77329948326598055499362235204984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((154659896653196110998724470409968 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 23. -/
theorem ep_Q2_002_partial_23_0012_valid :
    mulPoly ep_Q2_002_coefficient_23_0012
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0013 : Poly :=
[
  term ((-145626774417721426073328713730528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 13 for generator 23. -/
def ep_Q2_002_partial_23_0013 : Poly :=
[
  term ((-291253548835442852146657427461056 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-291253548835442852146657427461056 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((145626774417721426073328713730528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((145626774417721426073328713730528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 23. -/
theorem ep_Q2_002_partial_23_0013_valid :
    mulPoly ep_Q2_002_coefficient_23_0013
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0014 : Poly :=
[
  term ((-359243639502818425159559638400374373576928 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 14 for generator 23. -/
def ep_Q2_002_partial_23_0014 : Poly :=
[
  term ((-718487279005636850319119276800748747153856 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-718487279005636850319119276800748747153856 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((359243639502818425159559638400374373576928 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((359243639502818425159559638400374373576928 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 23. -/
theorem ep_Q2_002_partial_23_0014_valid :
    mulPoly ep_Q2_002_coefficient_23_0014
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0015 : Poly :=
[
  term ((-20010465274 : Rat) / 1480263449) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 23. -/
def ep_Q2_002_partial_23_0015 : Poly :=
[
  term ((-40020930548 : Rat) / 1480263449) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40020930548 : Rat) / 1480263449) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((20010465274 : Rat) / 1480263449) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((20010465274 : Rat) / 1480263449) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 23. -/
theorem ep_Q2_002_partial_23_0015_valid :
    mulPoly ep_Q2_002_coefficient_23_0015
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0016 : Poly :=
[
  term ((-129803370663812397659281565902224 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 16 for generator 23. -/
def ep_Q2_002_partial_23_0016 : Poly :=
[
  term ((-259606741327624795318563131804448 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((129803370663812397659281565902224 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((129803370663812397659281565902224 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 3)],
  term ((-259606741327624795318563131804448 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 23. -/
theorem ep_Q2_002_partial_23_0016_valid :
    mulPoly ep_Q2_002_coefficient_23_0016
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0017 : Poly :=
[
  term ((1364887035789868425936142432197734164622532 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 17 for generator 23. -/
def ep_Q2_002_partial_23_0017 : Poly :=
[
  term ((2729774071579736851872284864395468329245064 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1364887035789868425936142432197734164622532 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1364887035789868425936142432197734164622532 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((2729774071579736851872284864395468329245064 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 23. -/
theorem ep_Q2_002_partial_23_0017_valid :
    mulPoly ep_Q2_002_coefficient_23_0017
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0018 : Poly :=
[
  term ((-11063501329 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 23. -/
def ep_Q2_002_partial_23_0018 : Poly :=
[
  term ((-22127002658 : Rat) / 7401317245) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11063501329 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((11063501329 : Rat) / 7401317245) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22127002658 : Rat) / 7401317245) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 23. -/
theorem ep_Q2_002_partial_23_0018_valid :
    mulPoly ep_Q2_002_coefficient_23_0018
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0019 : Poly :=
[
  term ((72582489282046027510003271321016 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 19 for generator 23. -/
def ep_Q2_002_partial_23_0019 : Poly :=
[
  term ((145164978564092055020006542642032 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-72582489282046027510003271321016 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 2)],
  term ((-72582489282046027510003271321016 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (13, 2)],
  term ((145164978564092055020006542642032 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 23. -/
theorem ep_Q2_002_partial_23_0019_valid :
    mulPoly ep_Q2_002_coefficient_23_0019
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0020 : Poly :=
[
  term ((34776195309827334141981692105285514975312 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 20 for generator 23. -/
def ep_Q2_002_partial_23_0020 : Poly :=
[
  term ((69552390619654668283963384210571029950624 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((69552390619654668283963384210571029950624 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-34776195309827334141981692105285514975312 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-34776195309827334141981692105285514975312 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 23. -/
theorem ep_Q2_002_partial_23_0020_valid :
    mulPoly ep_Q2_002_coefficient_23_0020
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0021 : Poly :=
[
  term ((11542088248 : Rat) / 7401317245) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 23. -/
def ep_Q2_002_partial_23_0021 : Poly :=
[
  term ((23084176496 : Rat) / 7401317245) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23084176496 : Rat) / 7401317245) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11542088248 : Rat) / 7401317245) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11542088248 : Rat) / 7401317245) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 23. -/
theorem ep_Q2_002_partial_23_0021_valid :
    mulPoly ep_Q2_002_coefficient_23_0021
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0022 : Poly :=
[
  term ((-12962070847649311931975289834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 22 for generator 23. -/
def ep_Q2_002_partial_23_0022 : Poly :=
[
  term ((-25924141695298623863950579669632 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-25924141695298623863950579669632 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 3)],
  term ((12962070847649311931975289834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 2), (13, 2)],
  term ((12962070847649311931975289834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 23. -/
theorem ep_Q2_002_partial_23_0022_valid :
    mulPoly ep_Q2_002_coefficient_23_0022
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0023 : Poly :=
[
  term ((97866138447305517486039363350594069786964 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (15, 2)]
]

/-- Partial product 23 for generator 23. -/
def ep_Q2_002_partial_23_0023 : Poly :=
[
  term ((195732276894611034972078726701188139573928 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((195732276894611034972078726701188139573928 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-97866138447305517486039363350594069786964 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (12, 2), (15, 2)],
  term ((-97866138447305517486039363350594069786964 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 23. -/
theorem ep_Q2_002_partial_23_0023_valid :
    mulPoly ep_Q2_002_coefficient_23_0023
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0024 : Poly :=
[
  term ((-12187901273 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 23. -/
def ep_Q2_002_partial_23_0024 : Poly :=
[
  term ((-24375802546 : Rat) / 7401317245) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24375802546 : Rat) / 7401317245) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12187901273 : Rat) / 7401317245) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((12187901273 : Rat) / 7401317245) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 23. -/
theorem ep_Q2_002_partial_23_0024_valid :
    mulPoly ep_Q2_002_coefficient_23_0024
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0025 : Poly :=
[
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 25 for generator 23. -/
def ep_Q2_002_partial_23_0025 : Poly :=
[
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1), (12, 1)],
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 2)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 23. -/
theorem ep_Q2_002_partial_23_0025_valid :
    mulPoly ep_Q2_002_coefficient_23_0025
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0026 : Poly :=
[
  term ((11977509929982494498261795530944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 26 for generator 23. -/
def ep_Q2_002_partial_23_0026 : Poly :=
[
  term ((23955019859964988996523591061888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (10, 1), (12, 1)],
  term ((23955019859964988996523591061888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 1)],
  term ((-11977509929982494498261795530944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 2)],
  term ((-11977509929982494498261795530944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 23. -/
theorem ep_Q2_002_partial_23_0026_valid :
    mulPoly ep_Q2_002_coefficient_23_0026
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0027 : Poly :=
[
  term ((24014011339497326574859070514992 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 27 for generator 23. -/
def ep_Q2_002_partial_23_0027 : Poly :=
[
  term ((48028022678994653149718141029984 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1)],
  term ((-24014011339497326574859070514992 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((-24014011339497326574859070514992 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((48028022678994653149718141029984 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 23. -/
theorem ep_Q2_002_partial_23_0027_valid :
    mulPoly ep_Q2_002_coefficient_23_0027
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0028 : Poly :=
[
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 28 for generator 23. -/
def ep_Q2_002_partial_23_0028 : Poly :=
[
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 2), (13, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 23. -/
theorem ep_Q2_002_partial_23_0028_valid :
    mulPoly ep_Q2_002_coefficient_23_0028
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0029 : Poly :=
[
  term ((72881599214385935929660780312735918670816 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 29 for generator 23. -/
def ep_Q2_002_partial_23_0029 : Poly :=
[
  term ((145763198428771871859321560625471837341632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((145763198428771871859321560625471837341632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-72881599214385935929660780312735918670816 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((-72881599214385935929660780312735918670816 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 23. -/
theorem ep_Q2_002_partial_23_0029_valid :
    mulPoly ep_Q2_002_coefficient_23_0029
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0030 : Poly :=
[
  term ((-14304889212 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 23. -/
def ep_Q2_002_partial_23_0030 : Poly :=
[
  term ((-28609778424 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 23. -/
theorem ep_Q2_002_partial_23_0030_valid :
    mulPoly ep_Q2_002_coefficient_23_0030
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0031 : Poly :=
[
  term ((247713257658506218668617745504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

/-- Partial product 31 for generator 23. -/
def ep_Q2_002_partial_23_0031 : Poly :=
[
  term ((495426515317012437337235491008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (10, 1), (12, 1)],
  term ((495426515317012437337235491008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-247713257658506218668617745504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2)],
  term ((-247713257658506218668617745504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 23. -/
theorem ep_Q2_002_partial_23_0031_valid :
    mulPoly ep_Q2_002_coefficient_23_0031
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0032 : Poly :=
[
  term ((-319012900134611607502326150912 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 32 for generator 23. -/
def ep_Q2_002_partial_23_0032 : Poly :=
[
  term ((-638025800269223215004652301824 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((319012900134611607502326150912 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((319012900134611607502326150912 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-638025800269223215004652301824 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 23. -/
theorem ep_Q2_002_partial_23_0032_valid :
    mulPoly ep_Q2_002_coefficient_23_0032
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0033 : Poly :=
[
  term ((232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 33 for generator 23. -/
def ep_Q2_002_partial_23_0033 : Poly :=
[
  term ((465997563601622145488083725924684668335488 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((465997563601622145488083725924684668335488 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 23. -/
theorem ep_Q2_002_partial_23_0033_valid :
    mulPoly ep_Q2_002_coefficient_23_0033
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0034 : Poly :=
[
  term ((6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 23. -/
def ep_Q2_002_partial_23_0034 : Poly :=
[
  term ((12548443744 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 23. -/
theorem ep_Q2_002_partial_23_0034_valid :
    mulPoly ep_Q2_002_coefficient_23_0034
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0035 : Poly :=
[
  term ((-429960681192666751889663243904 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1)]
]

/-- Partial product 35 for generator 23. -/
def ep_Q2_002_partial_23_0035 : Poly :=
[
  term ((-859921362385333503779326487808 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-859921362385333503779326487808 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((429960681192666751889663243904 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (12, 2)],
  term ((429960681192666751889663243904 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 23. -/
theorem ep_Q2_002_partial_23_0035_valid :
    mulPoly ep_Q2_002_coefficient_23_0035
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0036 : Poly :=
[
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 36 for generator 23. -/
def ep_Q2_002_partial_23_0036 : Poly :=
[
  term ((187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 2)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 23. -/
theorem ep_Q2_002_partial_23_0036_valid :
    mulPoly ep_Q2_002_coefficient_23_0036
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0037 : Poly :=
[
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 37 for generator 23. -/
def ep_Q2_002_partial_23_0037 : Poly :=
[
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 23. -/
theorem ep_Q2_002_partial_23_0037_valid :
    mulPoly ep_Q2_002_coefficient_23_0037
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0038 : Poly :=
[
  term ((-9463278878139340577211415164288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 38 for generator 23. -/
def ep_Q2_002_partial_23_0038 : Poly :=
[
  term ((-18926557756278681154422830328576 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-18926557756278681154422830328576 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((9463278878139340577211415164288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((9463278878139340577211415164288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 23. -/
theorem ep_Q2_002_partial_23_0038_valid :
    mulPoly ep_Q2_002_coefficient_23_0038
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0039 : Poly :=
[
  term ((50916069337248831535596439854504 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 39 for generator 23. -/
def ep_Q2_002_partial_23_0039 : Poly :=
[
  term ((101832138674497663071192879709008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-50916069337248831535596439854504 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-50916069337248831535596439854504 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((101832138674497663071192879709008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 23. -/
theorem ep_Q2_002_partial_23_0039_valid :
    mulPoly ep_Q2_002_coefficient_23_0039
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0040 : Poly :=
[
  term ((-90039543861853054738386220969056 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 40 for generator 23. -/
def ep_Q2_002_partial_23_0040 : Poly :=
[
  term ((-180079087723706109476772441938112 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-180079087723706109476772441938112 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((90039543861853054738386220969056 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((90039543861853054738386220969056 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 23. -/
theorem ep_Q2_002_partial_23_0040_valid :
    mulPoly ep_Q2_002_coefficient_23_0040
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0041 : Poly :=
[
  term ((-594271459358220604214421154716914552697504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 41 for generator 23. -/
def ep_Q2_002_partial_23_0041 : Poly :=
[
  term ((-1188542918716441208428842309433829105395008 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1188542918716441208428842309433829105395008 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((594271459358220604214421154716914552697504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((594271459358220604214421154716914552697504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 23. -/
theorem ep_Q2_002_partial_23_0041_valid :
    mulPoly ep_Q2_002_coefficient_23_0041
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0042 : Poly :=
[
  term ((-48244374142 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 23. -/
def ep_Q2_002_partial_23_0042 : Poly :=
[
  term ((-96488748284 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96488748284 : Rat) / 7401317245) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48244374142 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((48244374142 : Rat) / 7401317245) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 23. -/
theorem ep_Q2_002_partial_23_0042_valid :
    mulPoly ep_Q2_002_coefficient_23_0042
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0043 : Poly :=
[
  term ((-4806583275303591327283482613680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 43 for generator 23. -/
def ep_Q2_002_partial_23_0043 : Poly :=
[
  term ((-9613166550607182654566965227360 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-9613166550607182654566965227360 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((4806583275303591327283482613680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 2)],
  term ((4806583275303591327283482613680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 23. -/
theorem ep_Q2_002_partial_23_0043_valid :
    mulPoly ep_Q2_002_coefficient_23_0043
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0044 : Poly :=
[
  term ((7953070087928717772846962124288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 44 for generator 23. -/
def ep_Q2_002_partial_23_0044 : Poly :=
[
  term ((15906140175857435545693924248576 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((15906140175857435545693924248576 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-7953070087928717772846962124288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-7953070087928717772846962124288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 23. -/
theorem ep_Q2_002_partial_23_0044_valid :
    mulPoly ep_Q2_002_coefficient_23_0044
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0045 : Poly :=
[
  term ((-3337162534100711813059188878236 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

/-- Partial product 45 for generator 23. -/
def ep_Q2_002_partial_23_0045 : Poly :=
[
  term ((-6674325068201423626118377756472 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((3337162534100711813059188878236 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2)],
  term ((3337162534100711813059188878236 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 2)],
  term ((-6674325068201423626118377756472 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 23. -/
theorem ep_Q2_002_partial_23_0045_valid :
    mulPoly ep_Q2_002_coefficient_23_0045
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0046 : Poly :=
[
  term ((-74146457487101695326805049678496 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 46 for generator 23. -/
def ep_Q2_002_partial_23_0046 : Poly :=
[
  term ((-148292914974203390653610099356992 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((74146457487101695326805049678496 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((74146457487101695326805049678496 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 3)],
  term ((-148292914974203390653610099356992 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 23. -/
theorem ep_Q2_002_partial_23_0046_valid :
    mulPoly ep_Q2_002_coefficient_23_0046
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0047 : Poly :=
[
  term ((142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 47 for generator 23. -/
def ep_Q2_002_partial_23_0047 : Poly :=
[
  term ((284798296847261140404859948596480 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((284798296847261140404859948596480 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 3)],
  term ((-142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 23. -/
theorem ep_Q2_002_partial_23_0047_valid :
    mulPoly ep_Q2_002_coefficient_23_0047
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0048 : Poly :=
[
  term ((-73313573855668433423487350776005577856208 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 48 for generator 23. -/
def ep_Q2_002_partial_23_0048 : Poly :=
[
  term ((-146627147711336866846974701552011155712416 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-146627147711336866846974701552011155712416 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((73313573855668433423487350776005577856208 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((73313573855668433423487350776005577856208 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 23. -/
theorem ep_Q2_002_partial_23_0048_valid :
    mulPoly ep_Q2_002_coefficient_23_0048
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0049 : Poly :=
[
  term ((21924681348 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 23. -/
def ep_Q2_002_partial_23_0049 : Poly :=
[
  term ((43849362696 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((43849362696 : Rat) / 7401317245) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21924681348 : Rat) / 7401317245) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21924681348 : Rat) / 7401317245) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 23. -/
theorem ep_Q2_002_partial_23_0049_valid :
    mulPoly ep_Q2_002_coefficient_23_0049
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0050 : Poly :=
[
  term ((21463555044041167561713766814544 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 50 for generator 23. -/
def ep_Q2_002_partial_23_0050 : Poly :=
[
  term ((42927110088082335123427533629088 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((42927110088082335123427533629088 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 2)],
  term ((-21463555044041167561713766814544 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1)],
  term ((-21463555044041167561713766814544 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 23. -/
theorem ep_Q2_002_partial_23_0050_valid :
    mulPoly ep_Q2_002_coefficient_23_0050
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0051 : Poly :=
[
  term ((855156219140426078694946249976367403568252 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)]
]

/-- Partial product 51 for generator 23. -/
def ep_Q2_002_partial_23_0051 : Poly :=
[
  term ((1710312438280852157389892499952734807136504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((1710312438280852157389892499952734807136504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-855156219140426078694946249976367403568252 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (15, 1)],
  term ((-855156219140426078694946249976367403568252 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 23. -/
theorem ep_Q2_002_partial_23_0051_valid :
    mulPoly ep_Q2_002_coefficient_23_0051
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0052 : Poly :=
[
  term ((33030235296 : Rat) / 7401317245) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 23. -/
def ep_Q2_002_partial_23_0052 : Poly :=
[
  term ((66060470592 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((66060470592 : Rat) / 7401317245) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33030235296 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33030235296 : Rat) / 7401317245) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 23. -/
theorem ep_Q2_002_partial_23_0052_valid :
    mulPoly ep_Q2_002_coefficient_23_0052
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0053 : Poly :=
[
  term ((70555177669943848743278217456 : Rat) / 115799135485108289802725034287) [(1, 2)]
]

/-- Partial product 53 for generator 23. -/
def ep_Q2_002_partial_23_0053 : Poly :=
[
  term ((141110355339887697486556434912 : Rat) / 115799135485108289802725034287) [(1, 2), (10, 1), (12, 1)],
  term ((141110355339887697486556434912 : Rat) / 115799135485108289802725034287) [(1, 2), (11, 1), (13, 1)],
  term ((-70555177669943848743278217456 : Rat) / 115799135485108289802725034287) [(1, 2), (12, 2)],
  term ((-70555177669943848743278217456 : Rat) / 115799135485108289802725034287) [(1, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 23. -/
theorem ep_Q2_002_partial_23_0053_valid :
    mulPoly ep_Q2_002_coefficient_23_0053
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0054 : Poly :=
[
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)]
]

/-- Partial product 54 for generator 23. -/
def ep_Q2_002_partial_23_0054 : Poly :=
[
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 1), (12, 1)],
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 2)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 23. -/
theorem ep_Q2_002_partial_23_0054_valid :
    mulPoly ep_Q2_002_coefficient_23_0054
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0055 : Poly :=
[
  term ((-3428976111848244903309752790048 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1)]
]

/-- Partial product 55 for generator 23. -/
def ep_Q2_002_partial_23_0055 : Poly :=
[
  term ((-6857952223696489806619505580096 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((-6857952223696489806619505580096 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((3428976111848244903309752790048 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 2)],
  term ((3428976111848244903309752790048 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 23. -/
theorem ep_Q2_002_partial_23_0055_valid :
    mulPoly ep_Q2_002_coefficient_23_0055
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0056 : Poly :=
[
  term ((5348354627174550319002376383360 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 56 for generator 23. -/
def ep_Q2_002_partial_23_0056 : Poly :=
[
  term ((10696709254349100638004752766720 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1), (12, 2)],
  term ((10696709254349100638004752766720 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-5348354627174550319002376383360 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (13, 2)],
  term ((-5348354627174550319002376383360 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 23. -/
theorem ep_Q2_002_partial_23_0056_valid :
    mulPoly ep_Q2_002_coefficient_23_0056
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0057 : Poly :=
[
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 57 for generator 23. -/
def ep_Q2_002_partial_23_0057 : Poly :=
[
  term ((139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 2)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 23. -/
theorem ep_Q2_002_partial_23_0057_valid :
    mulPoly ep_Q2_002_coefficient_23_0057
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0058 : Poly :=
[
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 58 for generator 23. -/
def ep_Q2_002_partial_23_0058 : Poly :=
[
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 23. -/
theorem ep_Q2_002_partial_23_0058_valid :
    mulPoly ep_Q2_002_coefficient_23_0058
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0059 : Poly :=
[
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 59 for generator 23. -/
def ep_Q2_002_partial_23_0059 : Poly :=
[
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 23. -/
theorem ep_Q2_002_partial_23_0059_valid :
    mulPoly ep_Q2_002_coefficient_23_0059
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0060 : Poly :=
[
  term ((-521212696 : Rat) / 211466207) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 23. -/
def ep_Q2_002_partial_23_0060 : Poly :=
[
  term ((-1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 23. -/
theorem ep_Q2_002_partial_23_0060_valid :
    mulPoly ep_Q2_002_coefficient_23_0060
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0061 : Poly :=
[
  term ((-169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 61 for generator 23. -/
def ep_Q2_002_partial_23_0061 : Poly :=
[
  term ((-338680522729997958906834581023776 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 2)],
  term ((169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((-338680522729997958906834581023776 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 23. -/
theorem ep_Q2_002_partial_23_0061_valid :
    mulPoly ep_Q2_002_coefficient_23_0061
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0062 : Poly :=
[
  term ((318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 62 for generator 23. -/
def ep_Q2_002_partial_23_0062 : Poly :=
[
  term ((637798849612229438420645984395392 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((637798849612229438420645984395392 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((-318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((-318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 23. -/
theorem ep_Q2_002_partial_23_0062_valid :
    mulPoly ep_Q2_002_coefficient_23_0062
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0063 : Poly :=
[
  term ((-1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 63 for generator 23. -/
def ep_Q2_002_partial_23_0063 : Poly :=
[
  term ((-2477913165278133887925500974999207767905616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2477913165278133887925500974999207767905616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 2), (15, 1)],
  term ((1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 23. -/
theorem ep_Q2_002_partial_23_0063_valid :
    mulPoly ep_Q2_002_coefficient_23_0063
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0064 : Poly :=
[
  term ((74629929266 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 23. -/
def ep_Q2_002_partial_23_0064 : Poly :=
[
  term ((149259858532 : Rat) / 7401317245) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((149259858532 : Rat) / 7401317245) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74629929266 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-74629929266 : Rat) / 7401317245) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 23. -/
theorem ep_Q2_002_partial_23_0064_valid :
    mulPoly ep_Q2_002_coefficient_23_0064
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0065 : Poly :=
[
  term ((-4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 65 for generator 23. -/
def ep_Q2_002_partial_23_0065 : Poly :=
[
  term ((-8185769830916310021528840172416 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 3)],
  term ((-8185769830916310021528840172416 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 23. -/
theorem ep_Q2_002_partial_23_0065_valid :
    mulPoly ep_Q2_002_coefficient_23_0065
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0066 : Poly :=
[
  term ((-174769305308717795881039200890968402035672 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 66 for generator 23. -/
def ep_Q2_002_partial_23_0066 : Poly :=
[
  term ((-349538610617435591762078401781936804071344 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((174769305308717795881039200890968402035672 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((174769305308717795881039200890968402035672 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-349538610617435591762078401781936804071344 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 23. -/
theorem ep_Q2_002_partial_23_0066_valid :
    mulPoly ep_Q2_002_coefficient_23_0066
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0067 : Poly :=
[
  term ((-23376236546 : Rat) / 7401317245) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 23. -/
def ep_Q2_002_partial_23_0067 : Poly :=
[
  term ((-46752473092 : Rat) / 7401317245) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((23376236546 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((23376236546 : Rat) / 7401317245) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-46752473092 : Rat) / 7401317245) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 23. -/
theorem ep_Q2_002_partial_23_0067_valid :
    mulPoly ep_Q2_002_coefficient_23_0067
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0068 : Poly :=
[
  term ((2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2)]
]

/-- Partial product 68 for generator 23. -/
def ep_Q2_002_partial_23_0068 : Poly :=
[
  term ((4346763571254055782843028302048 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 2), (12, 1)],
  term ((-2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2), (12, 2)],
  term ((-2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2), (13, 2)],
  term ((4346763571254055782843028302048 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 23. -/
theorem ep_Q2_002_partial_23_0068_valid :
    mulPoly ep_Q2_002_coefficient_23_0068
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0069 : Poly :=
[
  term ((-40016846436101468446275748847232 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 69 for generator 23. -/
def ep_Q2_002_partial_23_0069 : Poly :=
[
  term ((-80033692872202936892551497694464 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-80033692872202936892551497694464 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((40016846436101468446275748847232 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((40016846436101468446275748847232 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 23. -/
theorem ep_Q2_002_partial_23_0069_valid :
    mulPoly ep_Q2_002_coefficient_23_0069
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0070 : Poly :=
[
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 2)]
]

/-- Partial product 70 for generator 23. -/
def ep_Q2_002_partial_23_0070 : Poly :=
[
  term ((624820994695497283979198664198734830116576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((624820994695497283979198664198734830116576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 2), (15, 2)],
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 23. -/
theorem ep_Q2_002_partial_23_0070_valid :
    mulPoly ep_Q2_002_coefficient_23_0070
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0071 : Poly :=
[
  term ((-5130926716 : Rat) / 7401317245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 71 for generator 23. -/
def ep_Q2_002_partial_23_0071 : Poly :=
[
  term ((-10261853432 : Rat) / 7401317245) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10261853432 : Rat) / 7401317245) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 23. -/
theorem ep_Q2_002_partial_23_0071_valid :
    mulPoly ep_Q2_002_coefficient_23_0071
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0072 : Poly :=
[
  term ((-3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

/-- Partial product 72 for generator 23. -/
def ep_Q2_002_partial_23_0072 : Poly :=
[
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2)],
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 2)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 23. -/
theorem ep_Q2_002_partial_23_0072_valid :
    mulPoly ep_Q2_002_coefficient_23_0072
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0073 : Poly :=
[
  term ((6595328732427273346830856136736 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

/-- Partial product 73 for generator 23. -/
def ep_Q2_002_partial_23_0073 : Poly :=
[
  term ((13190657464854546693661712273472 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((13190657464854546693661712273472 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 2)],
  term ((-6595328732427273346830856136736 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1)],
  term ((-6595328732427273346830856136736 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 23. -/
theorem ep_Q2_002_partial_23_0073_valid :
    mulPoly ep_Q2_002_coefficient_23_0073
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0074 : Poly :=
[
  term ((50964759133222690375408674267047204966532 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (15, 1)]
]

/-- Partial product 74 for generator 23. -/
def ep_Q2_002_partial_23_0074 : Poly :=
[
  term ((101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-50964759133222690375408674267047204966532 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 2), (15, 1)],
  term ((-50964759133222690375408674267047204966532 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 23. -/
theorem ep_Q2_002_partial_23_0074_valid :
    mulPoly ep_Q2_002_coefficient_23_0074
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0075 : Poly :=
[
  term ((1824530983 : Rat) / 1480263449) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 23. -/
def ep_Q2_002_partial_23_0075 : Poly :=
[
  term ((3649061966 : Rat) / 1480263449) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3649061966 : Rat) / 1480263449) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824530983 : Rat) / 1480263449) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1824530983 : Rat) / 1480263449) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 23. -/
theorem ep_Q2_002_partial_23_0075_valid :
    mulPoly ep_Q2_002_coefficient_23_0075
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0076 : Poly :=
[
  term ((-8493671134765391464593217559808 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 76 for generator 23. -/
def ep_Q2_002_partial_23_0076 : Poly :=
[
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((8493671134765391464593217559808 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((8493671134765391464593217559808 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 1), (13, 3)],
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 23. -/
theorem ep_Q2_002_partial_23_0076_valid :
    mulPoly ep_Q2_002_coefficient_23_0076
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0077 : Poly :=
[
  term ((-827535982903176597245429147792664963492672 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 77 for generator 23. -/
def ep_Q2_002_partial_23_0077 : Poly :=
[
  term ((-1655071965806353194490858295585329926985344 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((827535982903176597245429147792664963492672 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((827535982903176597245429147792664963492672 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1655071965806353194490858295585329926985344 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 23. -/
theorem ep_Q2_002_partial_23_0077_valid :
    mulPoly ep_Q2_002_coefficient_23_0077
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0078 : Poly :=
[
  term ((-60831461616 : Rat) / 7401317245) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 23. -/
def ep_Q2_002_partial_23_0078 : Poly :=
[
  term ((-121662923232 : Rat) / 7401317245) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((60831461616 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((60831461616 : Rat) / 7401317245) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-121662923232 : Rat) / 7401317245) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 23. -/
theorem ep_Q2_002_partial_23_0078_valid :
    mulPoly ep_Q2_002_coefficient_23_0078
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0079 : Poly :=
[
  term ((4510263669443720691466530901824 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2)]
]

/-- Partial product 79 for generator 23. -/
def ep_Q2_002_partial_23_0079 : Poly :=
[
  term ((9020527338887441382933061803648 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (11, 2), (12, 1)],
  term ((-4510263669443720691466530901824 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (12, 2)],
  term ((-4510263669443720691466530901824 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (13, 2)],
  term ((9020527338887441382933061803648 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 23. -/
theorem ep_Q2_002_partial_23_0079_valid :
    mulPoly ep_Q2_002_coefficient_23_0079
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0080 : Poly :=
[
  term ((-47337051210754723970991097268736 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 80 for generator 23. -/
def ep_Q2_002_partial_23_0080 : Poly :=
[
  term ((-94674102421509447941982194537472 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-94674102421509447941982194537472 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((47337051210754723970991097268736 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((47337051210754723970991097268736 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 23. -/
theorem ep_Q2_002_partial_23_0080_valid :
    mulPoly ep_Q2_002_coefficient_23_0080
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0081 : Poly :=
[
  term ((-905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 2)]
]

/-- Partial product 81 for generator 23. -/
def ep_Q2_002_partial_23_0081 : Poly :=
[
  term ((-1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 2), (15, 2)],
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 23. -/
theorem ep_Q2_002_partial_23_0081_valid :
    mulPoly ep_Q2_002_coefficient_23_0081
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0082 : Poly :=
[
  term ((-40787556556 : Rat) / 7401317245) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 82 for generator 23. -/
def ep_Q2_002_partial_23_0082 : Poly :=
[
  term ((-81575113112 : Rat) / 7401317245) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-81575113112 : Rat) / 7401317245) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 23. -/
theorem ep_Q2_002_partial_23_0082_valid :
    mulPoly ep_Q2_002_coefficient_23_0082
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0083 : Poly :=
[
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 83 for generator 23. -/
def ep_Q2_002_partial_23_0083 : Poly :=
[
  term ((-2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 2)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 23. -/
theorem ep_Q2_002_partial_23_0083_valid :
    mulPoly ep_Q2_002_coefficient_23_0083
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0084 : Poly :=
[
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 84 for generator 23. -/
def ep_Q2_002_partial_23_0084 : Poly :=
[
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 23. -/
theorem ep_Q2_002_partial_23_0084_valid :
    mulPoly ep_Q2_002_coefficient_23_0084
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0085 : Poly :=
[
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 85 for generator 23. -/
def ep_Q2_002_partial_23_0085 : Poly :=
[
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 23. -/
theorem ep_Q2_002_partial_23_0085_valid :
    mulPoly ep_Q2_002_coefficient_23_0085
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0086 : Poly :=
[
  term ((105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 23. -/
def ep_Q2_002_partial_23_0086 : Poly :=
[
  term ((211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 23. -/
theorem ep_Q2_002_partial_23_0086_valid :
    mulPoly ep_Q2_002_coefficient_23_0086
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0087 : Poly :=
[
  term ((76337531301716342804923271967024 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 87 for generator 23. -/
def ep_Q2_002_partial_23_0087 : Poly :=
[
  term ((152675062603432685609846543934048 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-76337531301716342804923271967024 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)],
  term ((-76337531301716342804923271967024 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 2)],
  term ((152675062603432685609846543934048 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 23. -/
theorem ep_Q2_002_partial_23_0087_valid :
    mulPoly ep_Q2_002_coefficient_23_0087
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0088 : Poly :=
[
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 88 for generator 23. -/
def ep_Q2_002_partial_23_0088 : Poly :=
[
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 3)],
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 23. -/
theorem ep_Q2_002_partial_23_0088_valid :
    mulPoly ep_Q2_002_coefficient_23_0088
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0089 : Poly :=
[
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 89 for generator 23. -/
def ep_Q2_002_partial_23_0089 : Poly :=
[
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 3)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 23. -/
theorem ep_Q2_002_partial_23_0089_valid :
    mulPoly ep_Q2_002_coefficient_23_0089
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0090 : Poly :=
[
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 90 for generator 23. -/
def ep_Q2_002_partial_23_0090 : Poly :=
[
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 23. -/
theorem ep_Q2_002_partial_23_0090_valid :
    mulPoly ep_Q2_002_coefficient_23_0090
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0091 : Poly :=
[
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 23. -/
def ep_Q2_002_partial_23_0091 : Poly :=
[
  term ((-93883265632 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 23. -/
theorem ep_Q2_002_partial_23_0091_valid :
    mulPoly ep_Q2_002_coefficient_23_0091
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0092 : Poly :=
[
  term ((-11447639344331321348619479742336 : Rat) / 97983883872014706756151952089) [(7, 1), (13, 1)]
]

/-- Partial product 92 for generator 23. -/
def ep_Q2_002_partial_23_0092 : Poly :=
[
  term ((-22895278688662642697238959484672 : Rat) / 97983883872014706756151952089) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-22895278688662642697238959484672 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1), (13, 2)],
  term ((11447639344331321348619479742336 : Rat) / 97983883872014706756151952089) [(7, 1), (12, 2), (13, 1)],
  term ((11447639344331321348619479742336 : Rat) / 97983883872014706756151952089) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 23. -/
theorem ep_Q2_002_partial_23_0092_valid :
    mulPoly ep_Q2_002_coefficient_23_0092
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0093 : Poly :=
[
  term ((-99533815802249333684315492144587880462232 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 93 for generator 23. -/
def ep_Q2_002_partial_23_0093 : Poly :=
[
  term ((-199067631604498667368630984289175760924464 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-199067631604498667368630984289175760924464 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((99533815802249333684315492144587880462232 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 1)],
  term ((99533815802249333684315492144587880462232 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 23. -/
theorem ep_Q2_002_partial_23_0093_valid :
    mulPoly ep_Q2_002_coefficient_23_0093
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0094 : Poly :=
[
  term ((-51895124466 : Rat) / 7401317245) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 23. -/
def ep_Q2_002_partial_23_0094 : Poly :=
[
  term ((-103790248932 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-103790248932 : Rat) / 7401317245) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((51895124466 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((51895124466 : Rat) / 7401317245) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 23. -/
theorem ep_Q2_002_partial_23_0094_valid :
    mulPoly ep_Q2_002_coefficient_23_0094
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0095 : Poly :=
[
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2)]
]

/-- Partial product 95 for generator 23. -/
def ep_Q2_002_partial_23_0095 : Poly :=
[
  term ((2139782730770747845440 : Rat) / 253528477699481291099) [(7, 2), (10, 1), (12, 1)],
  term ((2139782730770747845440 : Rat) / 253528477699481291099) [(7, 2), (11, 1), (13, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (12, 2)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 23. -/
theorem ep_Q2_002_partial_23_0095_valid :
    mulPoly ep_Q2_002_coefficient_23_0095
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0096 : Poly :=
[
  term ((133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 96 for generator 23. -/
def ep_Q2_002_partial_23_0096 : Poly :=
[
  term ((267587190987422940009248898457152 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((-133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((267587190987422940009248898457152 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 23. -/
theorem ep_Q2_002_partial_23_0096_valid :
    mulPoly ep_Q2_002_coefficient_23_0096
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0097 : Poly :=
[
  term ((-251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 97 for generator 23. -/
def ep_Q2_002_partial_23_0097 : Poly :=
[
  term ((-503916792164646688898782995273984 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-503916792164646688898782995273984 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 23. -/
theorem ep_Q2_002_partial_23_0097_valid :
    mulPoly ep_Q2_002_coefficient_23_0097
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0098 : Poly :=
[
  term ((2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 98 for generator 23. -/
def ep_Q2_002_partial_23_0098 : Poly :=
[
  term ((4175542257014706131695357274290949475388224 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((4175542257014706131695357274290949475388224 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 23. -/
theorem ep_Q2_002_partial_23_0098_valid :
    mulPoly ep_Q2_002_coefficient_23_0098
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0099 : Poly :=
[
  term ((-28647436304 : Rat) / 7401317245) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 23. -/
def ep_Q2_002_partial_23_0099 : Poly :=
[
  term ((-57294872608 : Rat) / 7401317245) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57294872608 : Rat) / 7401317245) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((28647436304 : Rat) / 7401317245) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((28647436304 : Rat) / 7401317245) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 23. -/
theorem ep_Q2_002_partial_23_0099_valid :
    mulPoly ep_Q2_002_coefficient_23_0099
        ep_Q2_002_generator_23_0000_0099 =
      ep_Q2_002_partial_23_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_23_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_23_0000,
  ep_Q2_002_partial_23_0001,
  ep_Q2_002_partial_23_0002,
  ep_Q2_002_partial_23_0003,
  ep_Q2_002_partial_23_0004,
  ep_Q2_002_partial_23_0005,
  ep_Q2_002_partial_23_0006,
  ep_Q2_002_partial_23_0007,
  ep_Q2_002_partial_23_0008,
  ep_Q2_002_partial_23_0009,
  ep_Q2_002_partial_23_0010,
  ep_Q2_002_partial_23_0011,
  ep_Q2_002_partial_23_0012,
  ep_Q2_002_partial_23_0013,
  ep_Q2_002_partial_23_0014,
  ep_Q2_002_partial_23_0015,
  ep_Q2_002_partial_23_0016,
  ep_Q2_002_partial_23_0017,
  ep_Q2_002_partial_23_0018,
  ep_Q2_002_partial_23_0019,
  ep_Q2_002_partial_23_0020,
  ep_Q2_002_partial_23_0021,
  ep_Q2_002_partial_23_0022,
  ep_Q2_002_partial_23_0023,
  ep_Q2_002_partial_23_0024,
  ep_Q2_002_partial_23_0025,
  ep_Q2_002_partial_23_0026,
  ep_Q2_002_partial_23_0027,
  ep_Q2_002_partial_23_0028,
  ep_Q2_002_partial_23_0029,
  ep_Q2_002_partial_23_0030,
  ep_Q2_002_partial_23_0031,
  ep_Q2_002_partial_23_0032,
  ep_Q2_002_partial_23_0033,
  ep_Q2_002_partial_23_0034,
  ep_Q2_002_partial_23_0035,
  ep_Q2_002_partial_23_0036,
  ep_Q2_002_partial_23_0037,
  ep_Q2_002_partial_23_0038,
  ep_Q2_002_partial_23_0039,
  ep_Q2_002_partial_23_0040,
  ep_Q2_002_partial_23_0041,
  ep_Q2_002_partial_23_0042,
  ep_Q2_002_partial_23_0043,
  ep_Q2_002_partial_23_0044,
  ep_Q2_002_partial_23_0045,
  ep_Q2_002_partial_23_0046,
  ep_Q2_002_partial_23_0047,
  ep_Q2_002_partial_23_0048,
  ep_Q2_002_partial_23_0049,
  ep_Q2_002_partial_23_0050,
  ep_Q2_002_partial_23_0051,
  ep_Q2_002_partial_23_0052,
  ep_Q2_002_partial_23_0053,
  ep_Q2_002_partial_23_0054,
  ep_Q2_002_partial_23_0055,
  ep_Q2_002_partial_23_0056,
  ep_Q2_002_partial_23_0057,
  ep_Q2_002_partial_23_0058,
  ep_Q2_002_partial_23_0059,
  ep_Q2_002_partial_23_0060,
  ep_Q2_002_partial_23_0061,
  ep_Q2_002_partial_23_0062,
  ep_Q2_002_partial_23_0063,
  ep_Q2_002_partial_23_0064,
  ep_Q2_002_partial_23_0065,
  ep_Q2_002_partial_23_0066,
  ep_Q2_002_partial_23_0067,
  ep_Q2_002_partial_23_0068,
  ep_Q2_002_partial_23_0069,
  ep_Q2_002_partial_23_0070,
  ep_Q2_002_partial_23_0071,
  ep_Q2_002_partial_23_0072,
  ep_Q2_002_partial_23_0073,
  ep_Q2_002_partial_23_0074,
  ep_Q2_002_partial_23_0075,
  ep_Q2_002_partial_23_0076,
  ep_Q2_002_partial_23_0077,
  ep_Q2_002_partial_23_0078,
  ep_Q2_002_partial_23_0079,
  ep_Q2_002_partial_23_0080,
  ep_Q2_002_partial_23_0081,
  ep_Q2_002_partial_23_0082,
  ep_Q2_002_partial_23_0083,
  ep_Q2_002_partial_23_0084,
  ep_Q2_002_partial_23_0085,
  ep_Q2_002_partial_23_0086,
  ep_Q2_002_partial_23_0087,
  ep_Q2_002_partial_23_0088,
  ep_Q2_002_partial_23_0089,
  ep_Q2_002_partial_23_0090,
  ep_Q2_002_partial_23_0091,
  ep_Q2_002_partial_23_0092,
  ep_Q2_002_partial_23_0093,
  ep_Q2_002_partial_23_0094,
  ep_Q2_002_partial_23_0095,
  ep_Q2_002_partial_23_0096,
  ep_Q2_002_partial_23_0097,
  ep_Q2_002_partial_23_0098,
  ep_Q2_002_partial_23_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_23_0000_0099 : Poly :=
[
  term ((-5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((-10939161384314507731176135729984 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-10939161384314507731176135729984 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((5469580692157253865588067864992 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((5469580692157253865588067864992 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((318225178772477734096867196812320 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-619587067549700665503526051964160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((35308533461956533580400145196339139342736 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4704705796 : Rat) / 211466207) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-159112589386238867048433598406160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((35308533461956533580400145196339139342736 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4704705796 : Rat) / 211466207) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-778699656935939532551959650370320 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((318225178772477734096867196812320 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((309793533774850332751763025982080 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-17654266730978266790200072598169569671368 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((2352352898 : Rat) / 211466207) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17654266730978266790200072598169569671368 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((2352352898 : Rat) / 211466207) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((309793533774850332751763025982080 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 3)],
  term ((-2112221366412418588079672316288 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (10, 1), (12, 1)],
  term ((-2112221366412418588079672316288 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((1056110683206209294039836158144 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (12, 2)],
  term ((1056110683206209294039836158144 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (13, 2)],
  term ((71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-83967334568 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-83967334568 : Rat) / 7401317245) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-170820882835961650472980451927520 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 3)],
  term ((154659896653196110998724470409968 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-291253548835442852146657427461056 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-718487279005636850319119276800748747153856 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-40020930548 : Rat) / 1480263449) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-77329948326598055499362235204984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-718487279005636850319119276800748747153856 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-40020930548 : Rat) / 1480263449) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-368583497162040907646019662666040 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((154659896653196110998724470409968 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((145626774417721426073328713730528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((359243639502818425159559638400374373576928 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((20010465274 : Rat) / 1480263449) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((359243639502818425159559638400374373576928 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((20010465274 : Rat) / 1480263449) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((145626774417721426073328713730528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 3)],
  term ((-259606741327624795318563131804448 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((2729774071579736851872284864395468329245064 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22127002658 : Rat) / 7401317245) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((145164978564092055020006542642032 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((69552390619654668283963384210571029950624 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((23084176496 : Rat) / 7401317245) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25924141695298623863950579669632 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((195732276894611034972078726701188139573928 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-24375802546 : Rat) / 7401317245) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((129803370663812397659281565902224 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1364887035789868425936142432197734164622532 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((11063501329 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((195732276894611034972078726701188139573928 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-24375802546 : Rat) / 7401317245) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-92141191546871547648923687492062155052884 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((6829535565 : Rat) / 1480263449) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((103879228968513773795330986232592 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 3)],
  term ((-72582489282046027510003271321016 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 2)],
  term ((2729774071579736851872284864395468329245064 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-22127002658 : Rat) / 7401317245) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-30199020964515529348051491193224 : Rat) / 115799135485108289802725034287) [(0, 1), (11, 2), (13, 2)],
  term ((145164978564092055020006542642032 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 3), (13, 1)],
  term ((-34776195309827334141981692105285514975312 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-11542088248 : Rat) / 7401317245) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((12962070847649311931975289834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 2), (13, 2)],
  term ((-97866138447305517486039363350594069786964 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (12, 2), (15, 2)],
  term ((12187901273 : Rat) / 7401317245) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-97866138447305517486039363350594069786964 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (13, 2), (15, 2)],
  term ((12187901273 : Rat) / 7401317245) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-34776195309827334141981692105285514975312 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 3), (15, 1)],
  term ((-11542088248 : Rat) / 7401317245) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((12962070847649311931975289834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 4)],
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 1), (12, 1)],
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 2)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (13, 2)],
  term ((23955019859964988996523591061888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (10, 1), (12, 1)],
  term ((23955019859964988996523591061888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 1)],
  term ((-11977509929982494498261795530944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 2)],
  term ((-11977509929982494498261795530944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (13, 2)],
  term ((48028022678994653149718141029984 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1)],
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((145763198428771871859321560625471837341632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24014011339497326574859070514992 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((145763198428771871859321560625471837341632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121986551867193315333974745666224 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((48028022678994653149718141029984 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 2), (13, 1)],
  term ((-72881599214385935929660780312735918670816 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-72881599214385935929660780312735918670816 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 3)],
  term ((495426515317012437337235491008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (10, 1), (12, 1)],
  term ((495426515317012437337235491008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-247713257658506218668617745504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2)],
  term ((-247713257658506218668617745504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2)],
  term ((-638025800269223215004652301824 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((465997563601622145488083725924684668335488 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((319012900134611607502326150912 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((465997563601622145488083725924684668335488 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((319012900134611607502326150912 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-638025800269223215004652301824 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((-232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 2)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((-859921362385333503779326487808 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-859921362385333503779326487808 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((429960681192666751889663243904 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (12, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 3)],
  term ((429960681192666751889663243904 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (13, 2)],
  term ((-18926557756278681154422830328576 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-18926557756278681154422830328576 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((9463278878139340577211415164288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((9463278878139340577211415164288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((101832138674497663071192879709008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-180079087723706109476772441938112 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1188542918716441208428842309433829105395008 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-96488748284 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50916069337248831535596439854504 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-1188542918716441208428842309433829105395008 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-96488748284 : Rat) / 7401317245) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-230995157060954941012368881792616 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((101832138674497663071192879709008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((90039543861853054738386220969056 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((594271459358220604214421154716914552697504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((48244374142 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((594271459358220604214421154716914552697504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((48244374142 : Rat) / 7401317245) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((90039543861853054738386220969056 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 3)],
  term ((-9613166550607182654566965227360 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((15906140175857435545693924248576 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((15906140175857435545693924248576 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9613166550607182654566965227360 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-7953070087928717772846962124288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((4806583275303591327283482613680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 2)],
  term ((-7953070087928717772846962124288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 3)],
  term ((4806583275303591327283482613680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (13, 2)],
  term ((-6674325068201423626118377756472 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-148292914974203390653610099356992 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((42927110088082335123427533629088 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((1710312438280852157389892499952734807136504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((66060470592 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((284798296847261140404859948596480 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((-146627147711336866846974701552011155712416 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((43849362696 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-146627147711336866846974701552011155712416 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((43849362696 : Rat) / 7401317245) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((358944754334362835731664998274976 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((3337162534100711813059188878236 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2)],
  term ((74146457487101695326805049678496 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 3)],
  term ((1710312438280852157389892499952734807136504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((66060470592 : Rat) / 7401317245) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((46264272622183046936486722507324 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 2)],
  term ((-148292914974203390653610099356992 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-6674325068201423626118377756472 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 2), (13, 1)],
  term ((73313573855668433423487350776005577856208 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-21924681348 : Rat) / 7401317245) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 3)],
  term ((-21463555044041167561713766814544 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1)],
  term ((-855156219140426078694946249976367403568252 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (15, 1)],
  term ((-33030235296 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 3), (13, 1)],
  term ((73313573855668433423487350776005577856208 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (12, 3), (15, 1)],
  term ((-21924681348 : Rat) / 7401317245) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-855156219140426078694946249976367403568252 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 2), (15, 1)],
  term ((-33030235296 : Rat) / 7401317245) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21463555044041167561713766814544 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3)],
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 1), (12, 1)],
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 2)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (13, 2)],
  term ((-6857952223696489806619505580096 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((-6857952223696489806619505580096 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((3428976111848244903309752790048 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 2)],
  term ((3428976111848244903309752790048 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (13, 2)],
  term ((141110355339887697486556434912 : Rat) / 115799135485108289802725034287) [(1, 2), (10, 1), (12, 1)],
  term ((10696709254349100638004752766720 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1), (12, 2)],
  term ((10696709254349100638004752766720 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((141110355339887697486556434912 : Rat) / 115799135485108289802725034287) [(1, 2), (11, 1), (13, 1)],
  term ((-5348354627174550319002376383360 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (13, 2)],
  term ((-70555177669943848743278217456 : Rat) / 115799135485108289802725034287) [(1, 2), (12, 2)],
  term ((-5348354627174550319002376383360 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 3)],
  term ((-70555177669943848743278217456 : Rat) / 115799135485108289802725034287) [(1, 2), (13, 2)],
  term ((139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 2)],
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-332567699375028507757617577289760 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 2), (13, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 3)],
  term ((-338680522729997958906834581023776 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((637798849612229438420645984395392 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2477913165278133887925500974999207767905616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((149259858532 : Rat) / 7401317245) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 2)],
  term ((-2477913165278133887925500974999207767905616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((149259858532 : Rat) / 7401317245) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((807139110977228417874063274907280 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((-338680522729997958906834581023776 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 2), (15, 1)],
  term ((-74629929266 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((-74629929266 : Rat) / 7401317245) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 3)],
  term ((-8185769830916310021528840172416 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-349538610617435591762078401781936804071344 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-46752473092 : Rat) / 7401317245) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4346763571254055782843028302048 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 2), (12, 1)],
  term ((-80033692872202936892551497694464 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((624820994695497283979198664198734830116576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-10261853432 : Rat) / 7401317245) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((174769305308717795881039200890968402035672 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((23376236546 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((624820994695497283979198664198734830116576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-10261853432 : Rat) / 7401317245) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((90147197989279341886398042042880667145432 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((23376236546 : Rat) / 7401317245) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 3)],
  term ((-2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2), (12, 2)],
  term ((-349538610617435591762078401781936804071344 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-46752473092 : Rat) / 7401317245) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10359151616543337912950354323440 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2), (13, 2)],
  term ((4346763571254055782843028302048 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 3), (13, 1)],
  term ((40016846436101468446275748847232 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 2), (15, 2)],
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 2), (15, 2)],
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((40016846436101468446275748847232 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 3), (15, 1)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((13190657464854546693661712273472 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((3649061966 : Rat) / 1480263449) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2)],
  term ((101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((3649061966 : Rat) / 1480263449) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16692873538202280184663087089480 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 2)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 2), (13, 1)],
  term ((-6595328732427273346830856136736 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1)],
  term ((-50964759133222690375408674267047204966532 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 2), (15, 1)],
  term ((-1824530983 : Rat) / 1480263449) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50964759133222690375408674267047204966532 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (13, 2), (15, 1)],
  term ((-1824530983 : Rat) / 1480263449) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6595328732427273346830856136736 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 3)],
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1655071965806353194490858295585329926985344 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-121662923232 : Rat) / 7401317245) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9020527338887441382933061803648 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (11, 2), (12, 1)],
  term ((-94674102421509447941982194537472 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-81575113112 : Rat) / 7401317245) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((8493671134765391464593217559808 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((827535982903176597245429147792664963492672 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((60831461616 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-81575113112 : Rat) / 7401317245) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((727434116202146006390654494090788347449152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((60831461616 : Rat) / 7401317245) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((8493671134765391464593217559808 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 1), (13, 3)],
  term ((-4510263669443720691466530901824 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (12, 2)],
  term ((-1655071965806353194490858295585329926985344 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-121662923232 : Rat) / 7401317245) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21497605938974503620652966021440 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (13, 2)],
  term ((9020527338887441382933061803648 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 3), (13, 1)],
  term ((47337051210754723970991097268736 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 2), (15, 2)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 2), (15, 2)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((47337051210754723970991097268736 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 3), (15, 1)],
  term ((-2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 2)],
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6306007927931937872844595302240 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 3)],
  term ((152675062603432685609846543934048 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term ((-22895278688662642697238959484672 : Rat) / 97983883872014706756151952089) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-199067631604498667368630984289175760924464 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-103790248932 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156964894091386480420914566867040 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-76337531301716342804923271967024 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 3)],
  term ((-199067631604498667368630984289175760924464 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-103790248932 : Rat) / 7401317245) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-373976154254330697869029745267760 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 2)],
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((152675062603432685609846543934048 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (13, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 3)],
  term ((11447639344331321348619479742336 : Rat) / 97983883872014706756151952089) [(7, 1), (12, 2), (13, 1)],
  term ((99533815802249333684315492144587880462232 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 1)],
  term ((51895124466 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 3), (13, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 3), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((99533815802249333684315492144587880462232 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 2), (15, 1)],
  term ((51895124466 : Rat) / 7401317245) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((11447639344331321348619479742336 : Rat) / 97983883872014706756151952089) [(7, 1), (13, 3)],
  term ((2139782730770747845440 : Rat) / 253528477699481291099) [(7, 2), (10, 1), (12, 1)],
  term ((2139782730770747845440 : Rat) / 253528477699481291099) [(7, 2), (11, 1), (13, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (12, 2)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (13, 2)],
  term ((267587190987422940009248898457152 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-503916792164646688898782995273984 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((4175542257014706131695357274290949475388224 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-57294872608 : Rat) / 7401317245) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((4175542257014706131695357274290949475388224 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-57294872608 : Rat) / 7401317245) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-637710387658358158903407444502560 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((267587190987422940009248898457152 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((28647436304 : Rat) / 7401317245) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((28647436304 : Rat) / 7401317245) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (13, 3)],
  term ((-1690919466594078240286521712272 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 1)],
  term ((-1690919466594078240286521712272 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)],
  term ((845459733297039120143260856136 : Rat) / 1273790490336191187829975377157) [(12, 2)],
  term ((845459733297039120143260856136 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 99. -/
theorem ep_Q2_002_block_23_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_23_0000_0099
      ep_Q2_002_block_23_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
