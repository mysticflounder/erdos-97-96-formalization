/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 3:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_03_0000_0099 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0000 : Poly :=
[
  term ((-3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)]
]

/-- Partial product 0 for generator 3. -/
def ep_Q2_002_partial_03_0000 : Poly :=
[
  term ((-3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (5, 1)],
  term ((-3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1)],
  term ((3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (8, 2)],
  term ((3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 3. -/
theorem ep_Q2_002_partial_03_0000_valid :
    mulPoly ep_Q2_002_coefficient_03_0000
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0001 : Poly :=
[
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 1 for generator 3. -/
def ep_Q2_002_partial_03_0001 : Poly :=
[
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 3. -/
theorem ep_Q2_002_partial_03_0001_valid :
    mulPoly ep_Q2_002_coefficient_03_0001
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0002 : Poly :=
[
  term ((127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 2 for generator 3. -/
def ep_Q2_002_partial_03_0002 : Poly :=
[
  term ((127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (11, 1)],
  term ((-127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 3. -/
theorem ep_Q2_002_partial_03_0002_valid :
    mulPoly ep_Q2_002_coefficient_03_0002
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0003 : Poly :=
[
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 3 for generator 3. -/
def ep_Q2_002_partial_03_0003 : Poly :=
[
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 3. -/
theorem ep_Q2_002_partial_03_0003_valid :
    mulPoly ep_Q2_002_coefficient_03_0003
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0004 : Poly :=
[
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 4 for generator 3. -/
def ep_Q2_002_partial_03_0004 : Poly :=
[
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 3. -/
theorem ep_Q2_002_partial_03_0004_valid :
    mulPoly ep_Q2_002_coefficient_03_0004
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0005 : Poly :=
[
  term ((55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 5 for generator 3. -/
def ep_Q2_002_partial_03_0005 : Poly :=
[
  term ((55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 2), (11, 1)],
  term ((-55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 3. -/
theorem ep_Q2_002_partial_03_0005_valid :
    mulPoly ep_Q2_002_coefficient_03_0005
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0006 : Poly :=
[
  term ((-104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 6 for generator 3. -/
def ep_Q2_002_partial_03_0006 : Poly :=
[
  term ((-104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((-104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 2), (13, 1)],
  term ((104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 3. -/
theorem ep_Q2_002_partial_03_0006_valid :
    mulPoly ep_Q2_002_coefficient_03_0006
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0007 : Poly :=
[
  term ((793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 7 for generator 3. -/
def ep_Q2_002_partial_03_0007 : Poly :=
[
  term ((793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((-793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 3. -/
theorem ep_Q2_002_partial_03_0007_valid :
    mulPoly ep_Q2_002_coefficient_03_0007
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0008 : Poly :=
[
  term ((-2077547138 : Rat) / 1057331035) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 3. -/
def ep_Q2_002_partial_03_0008 : Poly :=
[
  term ((-2077547138 : Rat) / 1057331035) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2077547138 : Rat) / 1057331035) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((2077547138 : Rat) / 1057331035) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((2077547138 : Rat) / 1057331035) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 3. -/
theorem ep_Q2_002_partial_03_0008_valid :
    mulPoly ep_Q2_002_coefficient_03_0008
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0009 : Poly :=
[
  term ((21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 9 for generator 3. -/
def ep_Q2_002_partial_03_0009 : Poly :=
[
  term ((21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((-21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((-21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 3. -/
theorem ep_Q2_002_partial_03_0009_valid :
    mulPoly ep_Q2_002_coefficient_03_0009
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0010 : Poly :=
[
  term ((-40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 10 for generator 3. -/
def ep_Q2_002_partial_03_0010 : Poly :=
[
  term ((-40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 3. -/
theorem ep_Q2_002_partial_03_0010_valid :
    mulPoly ep_Q2_002_coefficient_03_0010
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0011 : Poly :=
[
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 11 for generator 3. -/
def ep_Q2_002_partial_03_0011 : Poly :=
[
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 3. -/
theorem ep_Q2_002_partial_03_0011_valid :
    mulPoly ep_Q2_002_coefficient_03_0011
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0012 : Poly :=
[
  term ((-5743061018 : Rat) / 1480263449) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 3. -/
def ep_Q2_002_partial_03_0012 : Poly :=
[
  term ((-5743061018 : Rat) / 1480263449) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5743061018 : Rat) / 1480263449) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((5743061018 : Rat) / 1480263449) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((5743061018 : Rat) / 1480263449) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 3. -/
theorem ep_Q2_002_partial_03_0012_valid :
    mulPoly ep_Q2_002_coefficient_03_0012
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0013 : Poly :=
[
  term ((-4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 13 for generator 3. -/
def ep_Q2_002_partial_03_0013 : Poly :=
[
  term ((-4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 3. -/
theorem ep_Q2_002_partial_03_0013_valid :
    mulPoly ep_Q2_002_coefficient_03_0013
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0014 : Poly :=
[
  term ((-201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 14 for generator 3. -/
def ep_Q2_002_partial_03_0014 : Poly :=
[
  term ((-201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 3. -/
theorem ep_Q2_002_partial_03_0014_valid :
    mulPoly ep_Q2_002_coefficient_03_0014
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0015 : Poly :=
[
  term ((-3137110936 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 3. -/
def ep_Q2_002_partial_03_0015 : Poly :=
[
  term ((-3137110936 : Rat) / 7401317245) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3137110936 : Rat) / 7401317245) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((3137110936 : Rat) / 7401317245) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((3137110936 : Rat) / 7401317245) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 3. -/
theorem ep_Q2_002_partial_03_0015_valid :
    mulPoly ep_Q2_002_coefficient_03_0015
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0016 : Poly :=
[
  term ((-1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 16 for generator 3. -/
def ep_Q2_002_partial_03_0016 : Poly :=
[
  term ((-1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2)],
  term ((-1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2)],
  term ((1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 2)],
  term ((1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 3. -/
theorem ep_Q2_002_partial_03_0016_valid :
    mulPoly ep_Q2_002_coefficient_03_0016
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0017 : Poly :=
[
  term ((-10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 17 for generator 3. -/
def ep_Q2_002_partial_03_0017 : Poly :=
[
  term ((-10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 3. -/
theorem ep_Q2_002_partial_03_0017_valid :
    mulPoly ep_Q2_002_coefficient_03_0017
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0018 : Poly :=
[
  term ((3779347408 : Rat) / 1480263449) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 3. -/
def ep_Q2_002_partial_03_0018 : Poly :=
[
  term ((3779347408 : Rat) / 1480263449) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((3779347408 : Rat) / 1480263449) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3779347408 : Rat) / 1480263449) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3779347408 : Rat) / 1480263449) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 3. -/
theorem ep_Q2_002_partial_03_0018_valid :
    mulPoly ep_Q2_002_coefficient_03_0018
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0019 : Poly :=
[
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 19 for generator 3. -/
def ep_Q2_002_partial_03_0019 : Poly :=
[
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (13, 2)],
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (13, 2)],
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (13, 2)],
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 3. -/
theorem ep_Q2_002_partial_03_0019_valid :
    mulPoly ep_Q2_002_coefficient_03_0019
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0020 : Poly :=
[
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 20 for generator 3. -/
def ep_Q2_002_partial_03_0020 : Poly :=
[
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (15, 2)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (15, 2)],
  term ((71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (15, 2)],
  term ((71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 3. -/
theorem ep_Q2_002_partial_03_0020_valid :
    mulPoly ep_Q2_002_coefficient_03_0020
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0021 : Poly :=
[
  term ((-10981330664 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 3. -/
def ep_Q2_002_partial_03_0021 : Poly :=
[
  term ((-10981330664 : Rat) / 7401317245) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((10981330664 : Rat) / 7401317245) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((10981330664 : Rat) / 7401317245) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 3. -/
theorem ep_Q2_002_partial_03_0021_valid :
    mulPoly ep_Q2_002_coefficient_03_0021
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0022 : Poly :=
[
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1)]
]

/-- Partial product 22 for generator 3. -/
def ep_Q2_002_partial_03_0022 : Poly :=
[
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1)],
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 2)],
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 2)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 3. -/
theorem ep_Q2_002_partial_03_0022_valid :
    mulPoly ep_Q2_002_coefficient_03_0022
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0023 : Poly :=
[
  term ((849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1)]
]

/-- Partial product 23 for generator 3. -/
def ep_Q2_002_partial_03_0023 : Poly :=
[
  term ((849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1)],
  term ((849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1)],
  term ((-849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (8, 2)],
  term ((-849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 3. -/
theorem ep_Q2_002_partial_03_0023_valid :
    mulPoly ep_Q2_002_coefficient_03_0023
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0024 : Poly :=
[
  term ((-2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 24 for generator 3. -/
def ep_Q2_002_partial_03_0024 : Poly :=
[
  term ((-2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((-2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (9, 1)],
  term ((2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 3. -/
theorem ep_Q2_002_partial_03_0024_valid :
    mulPoly ep_Q2_002_coefficient_03_0024
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0025 : Poly :=
[
  term ((48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 25 for generator 3. -/
def ep_Q2_002_partial_03_0025 : Poly :=
[
  term ((48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((-48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (11, 1)],
  term ((-48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 3. -/
theorem ep_Q2_002_partial_03_0025_valid :
    mulPoly ep_Q2_002_coefficient_03_0025
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0026 : Poly :=
[
  term ((-83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 26 for generator 3. -/
def ep_Q2_002_partial_03_0026 : Poly :=
[
  term ((-83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((-83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (13, 1)],
  term ((83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 3. -/
theorem ep_Q2_002_partial_03_0026_valid :
    mulPoly ep_Q2_002_coefficient_03_0026
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0027 : Poly :=
[
  term ((-7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 27 for generator 3. -/
def ep_Q2_002_partial_03_0027 : Poly :=
[
  term ((-7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (4, 1), (8, 2), (15, 1)],
  term ((7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (4, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 3. -/
theorem ep_Q2_002_partial_03_0027_valid :
    mulPoly ep_Q2_002_coefficient_03_0027
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0028 : Poly :=
[
  term ((-8915882792 : Rat) / 1480263449) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 3. -/
def ep_Q2_002_partial_03_0028 : Poly :=
[
  term ((-8915882792 : Rat) / 1480263449) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-8915882792 : Rat) / 1480263449) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((8915882792 : Rat) / 1480263449) [(1, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((8915882792 : Rat) / 1480263449) [(1, 1), (4, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 3. -/
theorem ep_Q2_002_partial_03_0028_valid :
    mulPoly ep_Q2_002_coefficient_03_0028
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0029 : Poly :=
[
  term ((-2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

/-- Partial product 29 for generator 3. -/
def ep_Q2_002_partial_03_0029 : Poly :=
[
  term ((-2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1)],
  term ((-2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1)],
  term ((2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2)],
  term ((2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 3. -/
theorem ep_Q2_002_partial_03_0029_valid :
    mulPoly ep_Q2_002_coefficient_03_0029
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0030 : Poly :=
[
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)]
]

/-- Partial product 30 for generator 3. -/
def ep_Q2_002_partial_03_0030 : Poly :=
[
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (6, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (6, 1)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 2)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 3. -/
theorem ep_Q2_002_partial_03_0030_valid :
    mulPoly ep_Q2_002_coefficient_03_0030
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0031 : Poly :=
[
  term ((-999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 31 for generator 3. -/
def ep_Q2_002_partial_03_0031 : Poly :=
[
  term ((-999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (8, 1)],
  term ((-999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (8, 1)],
  term ((999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 3. -/
theorem ep_Q2_002_partial_03_0031_valid :
    mulPoly ep_Q2_002_coefficient_03_0031
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0032 : Poly :=
[
  term ((3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 32 for generator 3. -/
def ep_Q2_002_partial_03_0032 : Poly :=
[
  term ((3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((-3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((-3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 3. -/
theorem ep_Q2_002_partial_03_0032_valid :
    mulPoly ep_Q2_002_coefficient_03_0032
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0033 : Poly :=
[
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 33 for generator 3. -/
def ep_Q2_002_partial_03_0033 : Poly :=
[
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (14, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (14, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (14, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 3. -/
theorem ep_Q2_002_partial_03_0033_valid :
    mulPoly ep_Q2_002_coefficient_03_0033
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0034 : Poly :=
[
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 34 for generator 3. -/
def ep_Q2_002_partial_03_0034 : Poly :=
[
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 2), (11, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 3. -/
theorem ep_Q2_002_partial_03_0034_valid :
    mulPoly ep_Q2_002_coefficient_03_0034
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0035 : Poly :=
[
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 35 for generator 3. -/
def ep_Q2_002_partial_03_0035 : Poly :=
[
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (11, 1)],
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (8, 1), (11, 1)],
  term ((19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 3. -/
theorem ep_Q2_002_partial_03_0035_valid :
    mulPoly ep_Q2_002_coefficient_03_0035
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0036 : Poly :=
[
  term ((32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 36 for generator 3. -/
def ep_Q2_002_partial_03_0036 : Poly :=
[
  term ((32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (13, 1)],
  term ((32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((-32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((-32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 3. -/
theorem ep_Q2_002_partial_03_0036_valid :
    mulPoly ep_Q2_002_coefficient_03_0036
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0037 : Poly :=
[
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 37 for generator 3. -/
def ep_Q2_002_partial_03_0037 : Poly :=
[
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 3. -/
theorem ep_Q2_002_partial_03_0037_valid :
    mulPoly ep_Q2_002_coefficient_03_0037
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0038 : Poly :=
[
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 3. -/
def ep_Q2_002_partial_03_0038 : Poly :=
[
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-5743061018 : Rat) / 1480263449) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5743061018 : Rat) / 1480263449) [(1, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 3. -/
theorem ep_Q2_002_partial_03_0038_valid :
    mulPoly ep_Q2_002_coefficient_03_0038
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0039 : Poly :=
[
  term ((-3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 39 for generator 3. -/
def ep_Q2_002_partial_03_0039 : Poly :=
[
  term ((-3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1)],
  term ((-3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1)],
  term ((3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (9, 1)],
  term ((3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 3. -/
theorem ep_Q2_002_partial_03_0039_valid :
    mulPoly ep_Q2_002_coefficient_03_0039
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0040 : Poly :=
[
  term ((668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 40 for generator 3. -/
def ep_Q2_002_partial_03_0040 : Poly :=
[
  term ((668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((-668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 2), (9, 1), (12, 1)],
  term ((-668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 3. -/
theorem ep_Q2_002_partial_03_0040_valid :
    mulPoly ep_Q2_002_coefficient_03_0040
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0041 : Poly :=
[
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 41 for generator 3. -/
def ep_Q2_002_partial_03_0041 : Poly :=
[
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (9, 1), (14, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 3. -/
theorem ep_Q2_002_partial_03_0041_valid :
    mulPoly ep_Q2_002_coefficient_03_0041
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0042 : Poly :=
[
  term ((-1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (11, 1)]
]

/-- Partial product 42 for generator 3. -/
def ep_Q2_002_partial_03_0042 : Poly :=
[
  term ((-1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (11, 1)],
  term ((-1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (11, 1)],
  term ((1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 2), (11, 1)],
  term ((1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 3. -/
theorem ep_Q2_002_partial_03_0042_valid :
    mulPoly ep_Q2_002_coefficient_03_0042
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0043 : Poly :=
[
  term ((53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 43 for generator 3. -/
def ep_Q2_002_partial_03_0043 : Poly :=
[
  term ((53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((-53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 3. -/
theorem ep_Q2_002_partial_03_0043_valid :
    mulPoly ep_Q2_002_coefficient_03_0043
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0044 : Poly :=
[
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 44 for generator 3. -/
def ep_Q2_002_partial_03_0044 : Poly :=
[
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 3. -/
theorem ep_Q2_002_partial_03_0044_valid :
    mulPoly ep_Q2_002_coefficient_03_0044
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0045 : Poly :=
[
  term ((105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 45 for generator 3. -/
def ep_Q2_002_partial_03_0045 : Poly :=
[
  term ((105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((-105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 3. -/
theorem ep_Q2_002_partial_03_0045_valid :
    mulPoly ep_Q2_002_coefficient_03_0045
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0046 : Poly :=
[
  term ((-3779347408 : Rat) / 1480263449) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 3. -/
def ep_Q2_002_partial_03_0046 : Poly :=
[
  term ((-3779347408 : Rat) / 1480263449) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3779347408 : Rat) / 1480263449) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((3779347408 : Rat) / 1480263449) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((3779347408 : Rat) / 1480263449) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 3. -/
theorem ep_Q2_002_partial_03_0046_valid :
    mulPoly ep_Q2_002_coefficient_03_0046
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0047 : Poly :=
[
  term ((42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 47 for generator 3. -/
def ep_Q2_002_partial_03_0047 : Poly :=
[
  term ((42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (13, 1)],
  term ((42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (13, 1)],
  term ((-42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)],
  term ((-42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 3. -/
theorem ep_Q2_002_partial_03_0047_valid :
    mulPoly ep_Q2_002_coefficient_03_0047
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0048 : Poly :=
[
  term ((-573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)]
]

/-- Partial product 48 for generator 3. -/
def ep_Q2_002_partial_03_0048 : Poly :=
[
  term ((-573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 1)],
  term ((-573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (15, 1)],
  term ((573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 2), (15, 1)],
  term ((573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 3. -/
theorem ep_Q2_002_partial_03_0048_valid :
    mulPoly ep_Q2_002_coefficient_03_0048
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0049 : Poly :=
[
  term ((-1859496853 : Rat) / 7401317245) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 3. -/
def ep_Q2_002_partial_03_0049 : Poly :=
[
  term ((-1859496853 : Rat) / 7401317245) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1859496853 : Rat) / 7401317245) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((1859496853 : Rat) / 7401317245) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((1859496853 : Rat) / 7401317245) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 3. -/
theorem ep_Q2_002_partial_03_0049_valid :
    mulPoly ep_Q2_002_coefficient_03_0049
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0050 : Poly :=
[
  term ((1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 50 for generator 3. -/
def ep_Q2_002_partial_03_0050 : Poly :=
[
  term ((1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2)],
  term ((1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2)],
  term ((-1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2)],
  term ((-1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 3. -/
theorem ep_Q2_002_partial_03_0050_valid :
    mulPoly ep_Q2_002_coefficient_03_0050
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0051 : Poly :=
[
  term ((-3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)]
]

/-- Partial product 51 for generator 3. -/
def ep_Q2_002_partial_03_0051 : Poly :=
[
  term ((-3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1)],
  term ((-3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1)],
  term ((3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 2)],
  term ((3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 3. -/
theorem ep_Q2_002_partial_03_0051_valid :
    mulPoly ep_Q2_002_coefficient_03_0051
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0052 : Poly :=
[
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1)]
]

/-- Partial product 52 for generator 3. -/
def ep_Q2_002_partial_03_0052 : Poly :=
[
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (8, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (8, 1)],
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (9, 2)],
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 3. -/
theorem ep_Q2_002_partial_03_0052_valid :
    mulPoly ep_Q2_002_coefficient_03_0052
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0053 : Poly :=
[
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 53 for generator 3. -/
def ep_Q2_002_partial_03_0053 : Poly :=
[
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (12, 1)],
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (12, 1)],
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2), (12, 1)],
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 3. -/
theorem ep_Q2_002_partial_03_0053_valid :
    mulPoly ep_Q2_002_coefficient_03_0053
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0054 : Poly :=
[
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1)]
]

/-- Partial product 54 for generator 3. -/
def ep_Q2_002_partial_03_0054 : Poly :=
[
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1)],
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 2), (11, 1)],
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 2), (11, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 3. -/
theorem ep_Q2_002_partial_03_0054_valid :
    mulPoly ep_Q2_002_coefficient_03_0054
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0055 : Poly :=
[
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1)]
]

/-- Partial product 55 for generator 3. -/
def ep_Q2_002_partial_03_0055 : Poly :=
[
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (13, 1)],
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 2), (13, 1)],
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 2), (13, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 3. -/
theorem ep_Q2_002_partial_03_0055_valid :
    mulPoly ep_Q2_002_coefficient_03_0055
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0056 : Poly :=
[
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 1)]
]

/-- Partial product 56 for generator 3. -/
def ep_Q2_002_partial_03_0056 : Poly :=
[
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (15, 1)],
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 2), (15, 1)],
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 2), (15, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 3. -/
theorem ep_Q2_002_partial_03_0056_valid :
    mulPoly ep_Q2_002_coefficient_03_0056
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0057 : Poly :=
[
  term ((-2635507382 : Rat) / 7401317245) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 3. -/
def ep_Q2_002_partial_03_0057 : Poly :=
[
  term ((-2635507382 : Rat) / 7401317245) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((2635507382 : Rat) / 7401317245) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((2635507382 : Rat) / 7401317245) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 3. -/
theorem ep_Q2_002_partial_03_0057_valid :
    mulPoly ep_Q2_002_coefficient_03_0057
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0058 : Poly :=
[
  term ((-12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 58 for generator 3. -/
def ep_Q2_002_partial_03_0058 : Poly :=
[
  term ((-12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((-12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 2), (11, 1)],
  term ((12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 3. -/
theorem ep_Q2_002_partial_03_0058_valid :
    mulPoly ep_Q2_002_coefficient_03_0058
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0059 : Poly :=
[
  term ((22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 59 for generator 3. -/
def ep_Q2_002_partial_03_0059 : Poly :=
[
  term ((22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((-22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 2), (13, 1)],
  term ((-22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 3. -/
theorem ep_Q2_002_partial_03_0059_valid :
    mulPoly ep_Q2_002_coefficient_03_0059
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0060 : Poly :=
[
  term ((-244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 60 for generator 3. -/
def ep_Q2_002_partial_03_0060 : Poly :=
[
  term ((-244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (8, 2), (15, 1)],
  term ((244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 3. -/
theorem ep_Q2_002_partial_03_0060_valid :
    mulPoly ep_Q2_002_coefficient_03_0060
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0061 : Poly :=
[
  term ((965594422 : Rat) / 7401317245) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 3. -/
def ep_Q2_002_partial_03_0061 : Poly :=
[
  term ((965594422 : Rat) / 7401317245) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((965594422 : Rat) / 7401317245) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-965594422 : Rat) / 7401317245) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-965594422 : Rat) / 7401317245) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 3. -/
theorem ep_Q2_002_partial_03_0061_valid :
    mulPoly ep_Q2_002_coefficient_03_0061
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0062 : Poly :=
[
  term ((29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 62 for generator 3. -/
def ep_Q2_002_partial_03_0062 : Poly :=
[
  term ((29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (9, 1), (11, 1)],
  term ((-29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (9, 1), (11, 1)],
  term ((-29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 3. -/
theorem ep_Q2_002_partial_03_0062_valid :
    mulPoly ep_Q2_002_coefficient_03_0062
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0063 : Poly :=
[
  term ((-55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 63 for generator 3. -/
def ep_Q2_002_partial_03_0063 : Poly :=
[
  term ((-55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (9, 1), (13, 1)],
  term ((55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 3. -/
theorem ep_Q2_002_partial_03_0063_valid :
    mulPoly ep_Q2_002_coefficient_03_0063
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0064 : Poly :=
[
  term ((-239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 64 for generator 3. -/
def ep_Q2_002_partial_03_0064 : Poly :=
[
  term ((-239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (9, 1), (15, 1)],
  term ((239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 3. -/
theorem ep_Q2_002_partial_03_0064_valid :
    mulPoly ep_Q2_002_coefficient_03_0064
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0065 : Poly :=
[
  term ((-10259206604 : Rat) / 1480263449) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 3. -/
def ep_Q2_002_partial_03_0065 : Poly :=
[
  term ((-10259206604 : Rat) / 1480263449) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10259206604 : Rat) / 1480263449) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((10259206604 : Rat) / 1480263449) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((10259206604 : Rat) / 1480263449) [(4, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 3. -/
theorem ep_Q2_002_partial_03_0065_valid :
    mulPoly ep_Q2_002_coefficient_03_0065
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0066 : Poly :=
[
  term ((-137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 66 for generator 3. -/
def ep_Q2_002_partial_03_0066 : Poly :=
[
  term ((-137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 3. -/
theorem ep_Q2_002_partial_03_0066_valid :
    mulPoly ep_Q2_002_coefficient_03_0066
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0067 : Poly :=
[
  term ((-109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 67 for generator 3. -/
def ep_Q2_002_partial_03_0067 : Poly :=
[
  term ((-109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 3. -/
theorem ep_Q2_002_partial_03_0067_valid :
    mulPoly ep_Q2_002_coefficient_03_0067
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0068 : Poly :=
[
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 3. -/
def ep_Q2_002_partial_03_0068 : Poly :=
[
  term ((-3649061966 : Rat) / 1480263449) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3649061966 : Rat) / 1480263449) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((3649061966 : Rat) / 1480263449) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 3. -/
theorem ep_Q2_002_partial_03_0068_valid :
    mulPoly ep_Q2_002_coefficient_03_0068
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0069 : Poly :=
[
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 69 for generator 3. -/
def ep_Q2_002_partial_03_0069 : Poly :=
[
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 2)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 2)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 2)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 3. -/
theorem ep_Q2_002_partial_03_0069_valid :
    mulPoly ep_Q2_002_coefficient_03_0069
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0070 : Poly :=
[
  term ((1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 70 for generator 3. -/
def ep_Q2_002_partial_03_0070 : Poly :=
[
  term ((1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((-1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 3. -/
theorem ep_Q2_002_partial_03_0070_valid :
    mulPoly ep_Q2_002_coefficient_03_0070
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0071 : Poly :=
[
  term ((124373743323 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 3. -/
def ep_Q2_002_partial_03_0071 : Poly :=
[
  term ((124373743323 : Rat) / 7401317245) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((124373743323 : Rat) / 7401317245) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124373743323 : Rat) / 7401317245) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-124373743323 : Rat) / 7401317245) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 3. -/
theorem ep_Q2_002_partial_03_0071_valid :
    mulPoly ep_Q2_002_coefficient_03_0071
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0072 : Poly :=
[
  term ((233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 72 for generator 3. -/
def ep_Q2_002_partial_03_0072 : Poly :=
[
  term ((233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (13, 2)],
  term ((233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (13, 2)],
  term ((-233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (13, 2)],
  term ((-233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 3. -/
theorem ep_Q2_002_partial_03_0072_valid :
    mulPoly ep_Q2_002_coefficient_03_0072
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0073 : Poly :=
[
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (15, 2)]
]

/-- Partial product 73 for generator 3. -/
def ep_Q2_002_partial_03_0073 : Poly :=
[
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (4, 1), (15, 2)],
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (4, 1), (15, 2)],
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (8, 2), (15, 2)],
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 3. -/
theorem ep_Q2_002_partial_03_0073_valid :
    mulPoly ep_Q2_002_coefficient_03_0073
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0074 : Poly :=
[
  term ((26206208982 : Rat) / 7401317245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 3. -/
def ep_Q2_002_partial_03_0074 : Poly :=
[
  term ((26206208982 : Rat) / 7401317245) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((26206208982 : Rat) / 7401317245) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-26206208982 : Rat) / 7401317245) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((-26206208982 : Rat) / 7401317245) [(4, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 3. -/
theorem ep_Q2_002_partial_03_0074_valid :
    mulPoly ep_Q2_002_coefficient_03_0074
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0075 : Poly :=
[
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 75 for generator 3. -/
def ep_Q2_002_partial_03_0075 : Poly :=
[
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (6, 1), (11, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (6, 1), (11, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 2), (11, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 3. -/
theorem ep_Q2_002_partial_03_0075_valid :
    mulPoly ep_Q2_002_coefficient_03_0075
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0076 : Poly :=
[
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 76 for generator 3. -/
def ep_Q2_002_partial_03_0076 : Poly :=
[
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (6, 1), (13, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (6, 1), (13, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 2), (13, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 3. -/
theorem ep_Q2_002_partial_03_0076_valid :
    mulPoly ep_Q2_002_coefficient_03_0076
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0077 : Poly :=
[
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 77 for generator 3. -/
def ep_Q2_002_partial_03_0077 : Poly :=
[
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (8, 2), (15, 1)],
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 3. -/
theorem ep_Q2_002_partial_03_0077_valid :
    mulPoly ep_Q2_002_coefficient_03_0077
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0078 : Poly :=
[
  term ((32592348804 : Rat) / 7401317245) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 3. -/
def ep_Q2_002_partial_03_0078 : Poly :=
[
  term ((32592348804 : Rat) / 7401317245) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((32592348804 : Rat) / 7401317245) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32592348804 : Rat) / 7401317245) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-32592348804 : Rat) / 7401317245) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 3. -/
theorem ep_Q2_002_partial_03_0078_valid :
    mulPoly ep_Q2_002_coefficient_03_0078
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0079 : Poly :=
[
  term ((14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 79 for generator 3. -/
def ep_Q2_002_partial_03_0079 : Poly :=
[
  term ((14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (11, 1)],
  term ((14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (11, 1)],
  term ((-14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((-14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 3. -/
theorem ep_Q2_002_partial_03_0079_valid :
    mulPoly ep_Q2_002_coefficient_03_0079
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0080 : Poly :=
[
  term ((-26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 80 for generator 3. -/
def ep_Q2_002_partial_03_0080 : Poly :=
[
  term ((-26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((-26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 3. -/
theorem ep_Q2_002_partial_03_0080_valid :
    mulPoly ep_Q2_002_coefficient_03_0080
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0081 : Poly :=
[
  term ((-407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 81 for generator 3. -/
def ep_Q2_002_partial_03_0081 : Poly :=
[
  term ((-407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 3. -/
theorem ep_Q2_002_partial_03_0081_valid :
    mulPoly ep_Q2_002_coefficient_03_0081
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0082 : Poly :=
[
  term ((-19799070226 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 3. -/
def ep_Q2_002_partial_03_0082 : Poly :=
[
  term ((-19799070226 : Rat) / 7401317245) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19799070226 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((19799070226 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((19799070226 : Rat) / 7401317245) [(5, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 3. -/
theorem ep_Q2_002_partial_03_0082_valid :
    mulPoly ep_Q2_002_coefficient_03_0082
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0083 : Poly :=
[
  term ((40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

/-- Partial product 83 for generator 3. -/
def ep_Q2_002_partial_03_0083 : Poly :=
[
  term ((40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1)],
  term ((40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1)],
  term ((-40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1)],
  term ((-40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 3. -/
theorem ep_Q2_002_partial_03_0083_valid :
    mulPoly ep_Q2_002_coefficient_03_0083
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0084 : Poly :=
[
  term ((-52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 84 for generator 3. -/
def ep_Q2_002_partial_03_0084 : Poly :=
[
  term ((-52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((-52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 3. -/
theorem ep_Q2_002_partial_03_0084_valid :
    mulPoly ep_Q2_002_coefficient_03_0084
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0085 : Poly :=
[
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 85 for generator 3. -/
def ep_Q2_002_partial_03_0085 : Poly :=
[
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 3. -/
theorem ep_Q2_002_partial_03_0085_valid :
    mulPoly ep_Q2_002_coefficient_03_0085
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0086 : Poly :=
[
  term ((98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 86 for generator 3. -/
def ep_Q2_002_partial_03_0086 : Poly :=
[
  term ((98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((-98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 3. -/
theorem ep_Q2_002_partial_03_0086_valid :
    mulPoly ep_Q2_002_coefficient_03_0086
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0087 : Poly :=
[
  term ((-163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 87 for generator 3. -/
def ep_Q2_002_partial_03_0087 : Poly :=
[
  term ((-163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 3. -/
theorem ep_Q2_002_partial_03_0087_valid :
    mulPoly ep_Q2_002_coefficient_03_0087
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0088 : Poly :=
[
  term ((2147573817 : Rat) / 1480263449) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 3. -/
def ep_Q2_002_partial_03_0088 : Poly :=
[
  term ((2147573817 : Rat) / 1480263449) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2147573817 : Rat) / 1480263449) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2147573817 : Rat) / 1480263449) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2147573817 : Rat) / 1480263449) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 3. -/
theorem ep_Q2_002_partial_03_0088_valid :
    mulPoly ep_Q2_002_coefficient_03_0088
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0089 : Poly :=
[
  term ((-76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

/-- Partial product 89 for generator 3. -/
def ep_Q2_002_partial_03_0089 : Poly :=
[
  term ((-76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1)],
  term ((-76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1)],
  term ((76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (13, 1)],
  term ((76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 3. -/
theorem ep_Q2_002_partial_03_0089_valid :
    mulPoly ep_Q2_002_coefficient_03_0089
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0090 : Poly :=
[
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 90 for generator 3. -/
def ep_Q2_002_partial_03_0090 : Poly :=
[
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 3. -/
theorem ep_Q2_002_partial_03_0090_valid :
    mulPoly ep_Q2_002_coefficient_03_0090
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0091 : Poly :=
[
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 91 for generator 3. -/
def ep_Q2_002_partial_03_0091 : Poly :=
[
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 3. -/
theorem ep_Q2_002_partial_03_0091_valid :
    mulPoly ep_Q2_002_coefficient_03_0091
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0092 : Poly :=
[
  term ((1243661576 : Rat) / 211466207) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 3. -/
def ep_Q2_002_partial_03_0092 : Poly :=
[
  term ((1243661576 : Rat) / 211466207) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 3. -/
theorem ep_Q2_002_partial_03_0092_valid :
    mulPoly ep_Q2_002_coefficient_03_0092
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0093 : Poly :=
[
  term ((182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 1)]
]

/-- Partial product 93 for generator 3. -/
def ep_Q2_002_partial_03_0093 : Poly :=
[
  term ((182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (15, 1)],
  term ((182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 1)],
  term ((-182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 2), (15, 1)],
  term ((-182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 3. -/
theorem ep_Q2_002_partial_03_0093_valid :
    mulPoly ep_Q2_002_coefficient_03_0093
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0094 : Poly :=
[
  term ((-20473512392 : Rat) / 7401317245) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 3. -/
def ep_Q2_002_partial_03_0094 : Poly :=
[
  term ((-20473512392 : Rat) / 7401317245) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-20473512392 : Rat) / 7401317245) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((20473512392 : Rat) / 7401317245) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((20473512392 : Rat) / 7401317245) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 3. -/
theorem ep_Q2_002_partial_03_0094_valid :
    mulPoly ep_Q2_002_coefficient_03_0094
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0095 : Poly :=
[
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 95 for generator 3. -/
def ep_Q2_002_partial_03_0095 : Poly :=
[
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 3. -/
theorem ep_Q2_002_partial_03_0095_valid :
    mulPoly ep_Q2_002_coefficient_03_0095
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0096 : Poly :=
[
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 96 for generator 3. -/
def ep_Q2_002_partial_03_0096 : Poly :=
[
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 3. -/
theorem ep_Q2_002_partial_03_0096_valid :
    mulPoly ep_Q2_002_coefficient_03_0096
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0097 : Poly :=
[
  term ((-32592348804 : Rat) / 7401317245) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 3. -/
def ep_Q2_002_partial_03_0097 : Poly :=
[
  term ((-32592348804 : Rat) / 7401317245) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32592348804 : Rat) / 7401317245) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((32592348804 : Rat) / 7401317245) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((32592348804 : Rat) / 7401317245) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 3. -/
theorem ep_Q2_002_partial_03_0097_valid :
    mulPoly ep_Q2_002_coefficient_03_0097
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0098 : Poly :=
[
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

/-- Partial product 98 for generator 3. -/
def ep_Q2_002_partial_03_0098 : Poly :=
[
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 2)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 2)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 2)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 3. -/
theorem ep_Q2_002_partial_03_0098_valid :
    mulPoly ep_Q2_002_coefficient_03_0098
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 3. -/
def ep_Q2_002_coefficient_03_0099 : Poly :=
[
  term ((160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 99 for generator 3. -/
def ep_Q2_002_partial_03_0099 : Poly :=
[
  term ((160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((-160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 3. -/
theorem ep_Q2_002_partial_03_0099_valid :
    mulPoly ep_Q2_002_coefficient_03_0099
        ep_Q2_002_generator_03_0000_0099 =
      ep_Q2_002_partial_03_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_03_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_03_0000,
  ep_Q2_002_partial_03_0001,
  ep_Q2_002_partial_03_0002,
  ep_Q2_002_partial_03_0003,
  ep_Q2_002_partial_03_0004,
  ep_Q2_002_partial_03_0005,
  ep_Q2_002_partial_03_0006,
  ep_Q2_002_partial_03_0007,
  ep_Q2_002_partial_03_0008,
  ep_Q2_002_partial_03_0009,
  ep_Q2_002_partial_03_0010,
  ep_Q2_002_partial_03_0011,
  ep_Q2_002_partial_03_0012,
  ep_Q2_002_partial_03_0013,
  ep_Q2_002_partial_03_0014,
  ep_Q2_002_partial_03_0015,
  ep_Q2_002_partial_03_0016,
  ep_Q2_002_partial_03_0017,
  ep_Q2_002_partial_03_0018,
  ep_Q2_002_partial_03_0019,
  ep_Q2_002_partial_03_0020,
  ep_Q2_002_partial_03_0021,
  ep_Q2_002_partial_03_0022,
  ep_Q2_002_partial_03_0023,
  ep_Q2_002_partial_03_0024,
  ep_Q2_002_partial_03_0025,
  ep_Q2_002_partial_03_0026,
  ep_Q2_002_partial_03_0027,
  ep_Q2_002_partial_03_0028,
  ep_Q2_002_partial_03_0029,
  ep_Q2_002_partial_03_0030,
  ep_Q2_002_partial_03_0031,
  ep_Q2_002_partial_03_0032,
  ep_Q2_002_partial_03_0033,
  ep_Q2_002_partial_03_0034,
  ep_Q2_002_partial_03_0035,
  ep_Q2_002_partial_03_0036,
  ep_Q2_002_partial_03_0037,
  ep_Q2_002_partial_03_0038,
  ep_Q2_002_partial_03_0039,
  ep_Q2_002_partial_03_0040,
  ep_Q2_002_partial_03_0041,
  ep_Q2_002_partial_03_0042,
  ep_Q2_002_partial_03_0043,
  ep_Q2_002_partial_03_0044,
  ep_Q2_002_partial_03_0045,
  ep_Q2_002_partial_03_0046,
  ep_Q2_002_partial_03_0047,
  ep_Q2_002_partial_03_0048,
  ep_Q2_002_partial_03_0049,
  ep_Q2_002_partial_03_0050,
  ep_Q2_002_partial_03_0051,
  ep_Q2_002_partial_03_0052,
  ep_Q2_002_partial_03_0053,
  ep_Q2_002_partial_03_0054,
  ep_Q2_002_partial_03_0055,
  ep_Q2_002_partial_03_0056,
  ep_Q2_002_partial_03_0057,
  ep_Q2_002_partial_03_0058,
  ep_Q2_002_partial_03_0059,
  ep_Q2_002_partial_03_0060,
  ep_Q2_002_partial_03_0061,
  ep_Q2_002_partial_03_0062,
  ep_Q2_002_partial_03_0063,
  ep_Q2_002_partial_03_0064,
  ep_Q2_002_partial_03_0065,
  ep_Q2_002_partial_03_0066,
  ep_Q2_002_partial_03_0067,
  ep_Q2_002_partial_03_0068,
  ep_Q2_002_partial_03_0069,
  ep_Q2_002_partial_03_0070,
  ep_Q2_002_partial_03_0071,
  ep_Q2_002_partial_03_0072,
  ep_Q2_002_partial_03_0073,
  ep_Q2_002_partial_03_0074,
  ep_Q2_002_partial_03_0075,
  ep_Q2_002_partial_03_0076,
  ep_Q2_002_partial_03_0077,
  ep_Q2_002_partial_03_0078,
  ep_Q2_002_partial_03_0079,
  ep_Q2_002_partial_03_0080,
  ep_Q2_002_partial_03_0081,
  ep_Q2_002_partial_03_0082,
  ep_Q2_002_partial_03_0083,
  ep_Q2_002_partial_03_0084,
  ep_Q2_002_partial_03_0085,
  ep_Q2_002_partial_03_0086,
  ep_Q2_002_partial_03_0087,
  ep_Q2_002_partial_03_0088,
  ep_Q2_002_partial_03_0089,
  ep_Q2_002_partial_03_0090,
  ep_Q2_002_partial_03_0091,
  ep_Q2_002_partial_03_0092,
  ep_Q2_002_partial_03_0093,
  ep_Q2_002_partial_03_0094,
  ep_Q2_002_partial_03_0095,
  ep_Q2_002_partial_03_0096,
  ep_Q2_002_partial_03_0097,
  ep_Q2_002_partial_03_0098,
  ep_Q2_002_partial_03_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_03_0000_0099 : Poly :=
[
  term ((-3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (5, 1)],
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1)],
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (8, 2)],
  term ((3937635041882866909449177834816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (9, 2)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((-127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (11, 1)],
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((-127018132530309505287297688416 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 3)],
  term ((55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((-104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-2077547138 : Rat) / 1057331035) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-5743061018 : Rat) / 1480263449) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-3137110936 : Rat) / 7401317245) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2)],
  term ((-10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((3779347408 : Rat) / 1480263449) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (13, 2)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (15, 2)],
  term ((-10981330664 : Rat) / 7401317245) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-2077547138 : Rat) / 1057331035) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((-40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-5743061018 : Rat) / 1480263449) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-3137110936 : Rat) / 7401317245) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2)],
  term ((-10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((3779347408 : Rat) / 1480263449) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (13, 2)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (15, 2)],
  term ((-10981330664 : Rat) / 7401317245) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 2), (11, 1)],
  term ((104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 2), (13, 1)],
  term ((-793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((2077547138 : Rat) / 1057331035) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-55671016016715415462761034219632 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (11, 1)],
  term ((104838948770938982426047535262144 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (9, 2), (13, 1)],
  term ((-793800327532382229755692783071851026253688 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((2077547138 : Rat) / 1057331035) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((5743061018 : Rat) / 1480263449) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((3137110936 : Rat) / 7401317245) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (11, 2)],
  term ((10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((-3779347408 : Rat) / 1480263449) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 2), (13, 2)],
  term ((71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 2), (15, 2)],
  term ((10981330664 : Rat) / 7401317245) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((4640773180141372480361864500680 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((201679497307448456984114413159848934558152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((3137110936 : Rat) / 7401317245) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (11, 2)],
  term ((10184512140608751201417101309935409950008 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((-3779347408 : Rat) / 1480263449) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 2), (13, 2)],
  term ((71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 2), (15, 2)],
  term ((10981330664 : Rat) / 7401317245) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((-21274056311381317294357142924568 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (11, 1)],
  term ((40063032065182838249223040604256 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 3), (13, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (9, 3), (15, 1)],
  term ((5743061018 : Rat) / 1480263449) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1)],
  term ((849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1)],
  term ((-2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((-83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((-7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-8915882792 : Rat) / 1480263449) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (6, 1)],
  term ((-999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (8, 1)],
  term ((3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (14, 1)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (11, 1)],
  term ((32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (13, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1)],
  term ((668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (11, 1)],
  term ((53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-3779347408 : Rat) / 1480263449) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (13, 1)],
  term ((-573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 1)],
  term ((-1859496853 : Rat) / 7401317245) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 2)],
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 2)],
  term ((849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1)],
  term ((-2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((-83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((-7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((-8915882792 : Rat) / 1480263449) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (6, 1)],
  term ((-999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (8, 1)],
  term ((3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (14, 1)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (8, 1), (11, 1)],
  term ((32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((5743061018 : Rat) / 1480263449) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1)],
  term ((668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (11, 1)],
  term ((53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-3779347408 : Rat) / 1480263449) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (13, 1)],
  term ((-573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (15, 1)],
  term ((-1859496853 : Rat) / 7401317245) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3)],
  term ((-849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (8, 2)],
  term ((-849662317808408067266201025024 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (9, 2)],
  term ((2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (9, 1)],
  term ((-48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (11, 1)],
  term ((83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 2), (13, 1)],
  term ((7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (4, 1), (8, 2), (15, 1)],
  term ((8915882792 : Rat) / 1480263449) [(1, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((-48523696983111202501588846630752 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (11, 1)],
  term ((83533109797543695118842521700144 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 2), (13, 1)],
  term ((7427107297917790977660020115268825643808 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (4, 1), (9, 2), (15, 1)],
  term ((8915882792 : Rat) / 1480263449) [(1, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((2069932342394699845176138927840 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 3)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 2)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (9, 2)],
  term ((999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2)],
  term ((-3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 2), (14, 1)],
  term ((999313735348882227766966428960 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 3)],
  term ((2867487507822136842573998858880 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2)],
  term ((-3697323382395103786032322644720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2), (12, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 2), (14, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 2), (11, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((-32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((-5743061018 : Rat) / 1480263449) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (9, 1)],
  term ((-668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 2), (9, 1), (12, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (9, 1), (14, 1)],
  term ((1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 2), (11, 1)],
  term ((-53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((-105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((3779347408 : Rat) / 1480263449) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)],
  term ((573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 2), (15, 1)],
  term ((1859496853 : Rat) / 7401317245) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((19158852198573546212157163833048 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (11, 1)],
  term ((-32710779044221790054439138684768 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 3), (13, 1)],
  term ((-108085311774581907012956791490542785706944 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (8, 3), (15, 1)],
  term ((-5743061018 : Rat) / 1480263449) [(1, 1), (8, 3), (15, 1), (16, 1)],
  term ((1698589030815121838676375456708 : Rat) / 97983883872014706756151952089) [(1, 1), (9, 2), (11, 1)],
  term ((-53173907549100794951031377464248 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((102502530860025726424590360938208 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((-105407465183042208549752095225627095055032 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((3779347408 : Rat) / 1480263449) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-42542567418186080014121272328568 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1)],
  term ((573027685763073918620580623555041066717056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (15, 1)],
  term ((1859496853 : Rat) / 7401317245) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((3703937217105086732232089040000 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 3)],
  term ((-668386638269186199525809265408 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 3), (12, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 3), (14, 1)],
  term ((1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2)],
  term ((-3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (8, 1)],
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (12, 1)],
  term ((1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2)],
  term ((-3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1)],
  term ((1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (8, 1)],
  term ((-3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (12, 1)],
  term ((3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 2)],
  term ((3467143806964831761486152810880 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 2)],
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (9, 2)],
  term ((-1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2)],
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 2), (12, 1)],
  term ((-1504723204432489051745181674784 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 3)],
  term ((-1672726355941279391124120066096 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2)],
  term ((3849881767490583050034736228512 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (12, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (13, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (15, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((-244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((965594422 : Rat) / 7401317245) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((-55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-10259206604 : Rat) / 1480263449) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 2)],
  term ((1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((124373743323 : Rat) / 7401317245) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (13, 2)],
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (4, 1), (15, 2)],
  term ((26206208982 : Rat) / 7401317245) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (6, 1), (11, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (6, 1), (13, 1)],
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((32592348804 : Rat) / 7401317245) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (11, 1)],
  term ((-26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((-407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-19799070226 : Rat) / 7401317245) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1)],
  term ((-52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((-163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((2147573817 : Rat) / 1480263449) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (15, 1)],
  term ((-20473512392 : Rat) / 7401317245) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32592348804 : Rat) / 7401317245) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 2)],
  term ((160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 2), (11, 1)],
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 2), (13, 1)],
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 2), (15, 1)],
  term ((2635507382 : Rat) / 7401317245) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 2), (11, 1)],
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 2), (13, 1)],
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 2), (15, 1)],
  term ((2635507382 : Rat) / 7401317245) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((-244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((965594422 : Rat) / 7401317245) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (9, 1), (11, 1)],
  term ((-55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((-239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((-10259206604 : Rat) / 1480263449) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((-109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 2)],
  term ((1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((124373743323 : Rat) / 7401317245) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (13, 2)],
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (4, 1), (15, 2)],
  term ((26206208982 : Rat) / 7401317245) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (6, 1), (11, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (6, 1), (13, 1)],
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((32592348804 : Rat) / 7401317245) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (11, 1)],
  term ((-26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((-407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-19799070226 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1)],
  term ((-52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((2147573817 : Rat) / 1480263449) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 1)],
  term ((-20473512392 : Rat) / 7401317245) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32592348804 : Rat) / 7401317245) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 2)],
  term ((160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(3, 3), (13, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (15, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(3, 3), (15, 1), (16, 1)],
  term ((12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 2), (11, 1)],
  term ((-22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (8, 2), (13, 1)],
  term ((244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (8, 2), (15, 1)],
  term ((-965594422 : Rat) / 7401317245) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((12012683755702545849763619250048 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 2), (11, 1)],
  term ((-22622133148916336364333291388416 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((244732810888834946087942735408799318261096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (9, 2), (15, 1)],
  term ((-965594422 : Rat) / 7401317245) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (9, 1), (11, 1)],
  term ((55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (9, 1), (13, 1)],
  term ((239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (9, 1), (15, 1)],
  term ((10259206604 : Rat) / 1480263449) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((3649061966 : Rat) / 1480263449) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (11, 2)],
  term ((-1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((-124373743323 : Rat) / 7401317245) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 2), (13, 2)],
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (8, 2), (15, 2)],
  term ((-26206208982 : Rat) / 7401317245) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((137310917109141570437448998674524 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((109331864632196554410885761872563413027160 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((3649061966 : Rat) / 1480263449) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (11, 2)],
  term ((-1695185338270197457272048790906423283642136 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 2), (13, 1), (15, 1)],
  term ((-124373743323 : Rat) / 7401317245) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-233741693134825542545430174812784 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 2), (13, 2)],
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 2), (15, 2)],
  term ((-26206208982 : Rat) / 7401317245) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((-29265088145871011551887745480680 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 3), (11, 1)],
  term ((55111641504454861862058254662560 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 3), (13, 1)],
  term ((239631773849483294644365619154992555500408 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 3), (15, 1)],
  term ((10259206604 : Rat) / 1480263449) [(4, 1), (9, 3), (15, 1), (16, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 2), (11, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 2), (13, 1)],
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (8, 2), (15, 1)],
  term ((-32592348804 : Rat) / 7401317245) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 2), (11, 1)],
  term ((-63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (9, 2), (13, 1)],
  term ((-418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((-32592348804 : Rat) / 7401317245) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((19799070226 : Rat) / 7401317245) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1)],
  term ((52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((-98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((-2147573817 : Rat) / 1480263449) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (13, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 2), (15, 1)],
  term ((20473512392 : Rat) / 7401317245) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-14128483309039549446115005232920 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (11, 1)],
  term ((26606579937443997108324519788640 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 3), (13, 1)],
  term ((407283932056631110717136787498769751153952 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 3), (15, 1)],
  term ((19799070226 : Rat) / 7401317245) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((-40541071297294253234133049217760 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1)],
  term ((52273445113864665726607681601940 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((-98440686491647132504076935398480 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((163379029986953566481568612541012497951336 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-2147573817 : Rat) / 1480263449) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((76346429452263898336560170113920 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (13, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 2), (13, 1), (14, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-182350791989928306941219996254929527350176 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 2), (15, 1)],
  term ((20473512392 : Rat) / 7401317245) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((32592348804 : Rat) / 7401317245) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 2), (11, 2)],
  term ((63080673541195365068720731008768 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((418047548216318808484440723165880435265328 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((32592348804 : Rat) / 7401317245) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-33496760776664077419475109536704 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 2), (11, 2)],
  term ((-160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-160264515273574824122817689398656 : Rat) / 1273790490336191187829975377157) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 0 through 99. -/
theorem ep_Q2_002_block_03_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_03_0000_0099
      ep_Q2_002_block_03_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
