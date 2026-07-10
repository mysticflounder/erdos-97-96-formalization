/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 29:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_29_0000_0099 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0000 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 29. -/
def ep_Q2_008_partial_29_0000 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem ep_Q2_008_partial_29_0000_valid :
    mulPoly ep_Q2_008_coefficient_29_0000
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0001 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 29. -/
def ep_Q2_008_partial_29_0001 : Poly :=
[
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem ep_Q2_008_partial_29_0001_valid :
    mulPoly ep_Q2_008_coefficient_29_0001
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0002 : Poly :=
[
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 29. -/
def ep_Q2_008_partial_29_0002 : Poly :=
[
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem ep_Q2_008_partial_29_0002_valid :
    mulPoly ep_Q2_008_coefficient_29_0002
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0003 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 29. -/
def ep_Q2_008_partial_29_0003 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem ep_Q2_008_partial_29_0003_valid :
    mulPoly ep_Q2_008_coefficient_29_0003
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0004 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 29. -/
def ep_Q2_008_partial_29_0004 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem ep_Q2_008_partial_29_0004_valid :
    mulPoly ep_Q2_008_coefficient_29_0004
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0005 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 29. -/
def ep_Q2_008_partial_29_0005 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem ep_Q2_008_partial_29_0005_valid :
    mulPoly ep_Q2_008_coefficient_29_0005
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0006 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 29. -/
def ep_Q2_008_partial_29_0006 : Poly :=
[
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem ep_Q2_008_partial_29_0006_valid :
    mulPoly ep_Q2_008_coefficient_29_0006
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0007 : Poly :=
[
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 29. -/
def ep_Q2_008_partial_29_0007 : Poly :=
[
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem ep_Q2_008_partial_29_0007_valid :
    mulPoly ep_Q2_008_coefficient_29_0007
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0008 : Poly :=
[
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 29. -/
def ep_Q2_008_partial_29_0008 : Poly :=
[
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem ep_Q2_008_partial_29_0008_valid :
    mulPoly ep_Q2_008_coefficient_29_0008
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0009 : Poly :=
[
  term ((-99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 29. -/
def ep_Q2_008_partial_29_0009 : Poly :=
[
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem ep_Q2_008_partial_29_0009_valid :
    mulPoly ep_Q2_008_coefficient_29_0009
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0010 : Poly :=
[
  term ((2036994500820221003532237290554060800000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 29. -/
def ep_Q2_008_partial_29_0010 : Poly :=
[
  term ((4073989001640442007064474581108121600000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2036994500820221003532237290554060800000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4073989001640442007064474581108121600000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2036994500820221003532237290554060800000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem ep_Q2_008_partial_29_0010_valid :
    mulPoly ep_Q2_008_coefficient_29_0010
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0011 : Poly :=
[
  term ((43542555253438352949 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 11 for generator 29. -/
def ep_Q2_008_partial_29_0011 : Poly :=
[
  term ((43542555253438352949 : Rat) / 2771825814456705436) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-43542555253438352949 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((43542555253438352949 : Rat) / 2771825814456705436) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43542555253438352949 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem ep_Q2_008_partial_29_0011_valid :
    mulPoly ep_Q2_008_coefficient_29_0011
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0012 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 29. -/
def ep_Q2_008_partial_29_0012 : Poly :=
[
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem ep_Q2_008_partial_29_0012_valid :
    mulPoly ep_Q2_008_coefficient_29_0012
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0013 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 13 for generator 29. -/
def ep_Q2_008_partial_29_0013 : Poly :=
[
  term ((258335334204108671376 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem ep_Q2_008_partial_29_0013_valid :
    mulPoly ep_Q2_008_coefficient_29_0013
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0014 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 29. -/
def ep_Q2_008_partial_29_0014 : Poly :=
[
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem ep_Q2_008_partial_29_0014_valid :
    mulPoly ep_Q2_008_coefficient_29_0014
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0015 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 15 for generator 29. -/
def ep_Q2_008_partial_29_0015 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem ep_Q2_008_partial_29_0015_valid :
    mulPoly ep_Q2_008_coefficient_29_0015
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0016 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 29. -/
def ep_Q2_008_partial_29_0016 : Poly :=
[
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem ep_Q2_008_partial_29_0016_valid :
    mulPoly ep_Q2_008_coefficient_29_0016
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0017 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 29. -/
def ep_Q2_008_partial_29_0017 : Poly :=
[
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem ep_Q2_008_partial_29_0017_valid :
    mulPoly ep_Q2_008_coefficient_29_0017
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0018 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 18 for generator 29. -/
def ep_Q2_008_partial_29_0018 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem ep_Q2_008_partial_29_0018_valid :
    mulPoly ep_Q2_008_coefficient_29_0018
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0019 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 29. -/
def ep_Q2_008_partial_29_0019 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem ep_Q2_008_partial_29_0019_valid :
    mulPoly ep_Q2_008_coefficient_29_0019
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0020 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 29. -/
def ep_Q2_008_partial_29_0020 : Poly :=
[
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem ep_Q2_008_partial_29_0020_valid :
    mulPoly ep_Q2_008_coefficient_29_0020
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0021 : Poly :=
[
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 29. -/
def ep_Q2_008_partial_29_0021 : Poly :=
[
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem ep_Q2_008_partial_29_0021_valid :
    mulPoly ep_Q2_008_coefficient_29_0021
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0022 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 29. -/
def ep_Q2_008_partial_29_0022 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem ep_Q2_008_partial_29_0022_valid :
    mulPoly ep_Q2_008_coefficient_29_0022
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0023 : Poly :=
[
  term ((10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 23 for generator 29. -/
def ep_Q2_008_partial_29_0023 : Poly :=
[
  term ((10645779268790098983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((10645779268790098983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem ep_Q2_008_partial_29_0023_valid :
    mulPoly ep_Q2_008_coefficient_29_0023
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0024 : Poly :=
[
  term ((-534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 29. -/
def ep_Q2_008_partial_29_0024 : Poly :=
[
  term ((-1068290449319049237408017779046129664000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1068290449319049237408017779046129664000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem ep_Q2_008_partial_29_0024_valid :
    mulPoly ep_Q2_008_coefficient_29_0024
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0025 : Poly :=
[
  term ((24026741055443049657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 29. -/
def ep_Q2_008_partial_29_0025 : Poly :=
[
  term ((24026741055443049657 : Rat) / 692956453614176359) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24026741055443049657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((24026741055443049657 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24026741055443049657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 29. -/
theorem ep_Q2_008_partial_29_0025_valid :
    mulPoly ep_Q2_008_coefficient_29_0025
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0026 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 29. -/
def ep_Q2_008_partial_29_0026 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 3), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 29. -/
theorem ep_Q2_008_partial_29_0026_valid :
    mulPoly ep_Q2_008_coefficient_29_0026
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0027 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 27 for generator 29. -/
def ep_Q2_008_partial_29_0027 : Poly :=
[
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(0, 1), (5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (12, 2), (13, 3), (16, 1)],
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 4), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 29. -/
theorem ep_Q2_008_partial_29_0027_valid :
    mulPoly ep_Q2_008_coefficient_29_0027
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0028 : Poly :=
[
  term ((23310661651756507729446218348688188652600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 29. -/
def ep_Q2_008_partial_29_0028 : Poly :=
[
  term ((46621323303513015458892436697376377305200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23310661651756507729446218348688188652600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((46621323303513015458892436697376377305200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23310661651756507729446218348688188652600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 29. -/
theorem ep_Q2_008_partial_29_0028_valid :
    mulPoly ep_Q2_008_coefficient_29_0028
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0029 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 29. -/
def ep_Q2_008_partial_29_0029 : Poly :=
[
  term ((-87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 29. -/
theorem ep_Q2_008_partial_29_0029_valid :
    mulPoly ep_Q2_008_coefficient_29_0029
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0030 : Poly :=
[
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 29. -/
def ep_Q2_008_partial_29_0030 : Poly :=
[
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 29. -/
theorem ep_Q2_008_partial_29_0030_valid :
    mulPoly ep_Q2_008_coefficient_29_0030
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0031 : Poly :=
[
  term ((43228464656031698817676885111473609157200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 29. -/
def ep_Q2_008_partial_29_0031 : Poly :=
[
  term ((86456929312063397635353770222947218314400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43228464656031698817676885111473609157200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((86456929312063397635353770222947218314400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-43228464656031698817676885111473609157200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 29. -/
theorem ep_Q2_008_partial_29_0031_valid :
    mulPoly ep_Q2_008_coefficient_29_0031
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0032 : Poly :=
[
  term ((-192943886127363000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 32 for generator 29. -/
def ep_Q2_008_partial_29_0032 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((192943886127363000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((192943886127363000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 29. -/
theorem ep_Q2_008_partial_29_0032_valid :
    mulPoly ep_Q2_008_coefficient_29_0032
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0033 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 29. -/
def ep_Q2_008_partial_29_0033 : Poly :=
[
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 29. -/
theorem ep_Q2_008_partial_29_0033_valid :
    mulPoly ep_Q2_008_coefficient_29_0033
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0034 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 29. -/
def ep_Q2_008_partial_29_0034 : Poly :=
[
  term ((-13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 29. -/
theorem ep_Q2_008_partial_29_0034_valid :
    mulPoly ep_Q2_008_coefficient_29_0034
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0035 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 35 for generator 29. -/
def ep_Q2_008_partial_29_0035 : Poly :=
[
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 29. -/
theorem ep_Q2_008_partial_29_0035_valid :
    mulPoly ep_Q2_008_coefficient_29_0035
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0036 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 29. -/
def ep_Q2_008_partial_29_0036 : Poly :=
[
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 29. -/
theorem ep_Q2_008_partial_29_0036_valid :
    mulPoly ep_Q2_008_coefficient_29_0036
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0037 : Poly :=
[
  term ((-4189849405068027375 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 37 for generator 29. -/
def ep_Q2_008_partial_29_0037 : Poly :=
[
  term ((-8379698810136054750 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4189849405068027375 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-8379698810136054750 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4189849405068027375 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 29. -/
theorem ep_Q2_008_partial_29_0037_valid :
    mulPoly ep_Q2_008_coefficient_29_0037
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0038 : Poly :=
[
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 29. -/
def ep_Q2_008_partial_29_0038 : Poly :=
[
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 29. -/
theorem ep_Q2_008_partial_29_0038_valid :
    mulPoly ep_Q2_008_coefficient_29_0038
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0039 : Poly :=
[
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 29. -/
def ep_Q2_008_partial_29_0039 : Poly :=
[
  term ((-2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 29. -/
theorem ep_Q2_008_partial_29_0039_valid :
    mulPoly ep_Q2_008_coefficient_29_0039
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0040 : Poly :=
[
  term ((44455120842554083782 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 29. -/
def ep_Q2_008_partial_29_0040 : Poly :=
[
  term ((88910241685108167564 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44455120842554083782 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((88910241685108167564 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44455120842554083782 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 29. -/
theorem ep_Q2_008_partial_29_0040_valid :
    mulPoly ep_Q2_008_coefficient_29_0040
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0041 : Poly :=
[
  term ((-23388009443282326924249151361573519590400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 29. -/
def ep_Q2_008_partial_29_0041 : Poly :=
[
  term ((-46776018886564653848498302723147039180800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((23388009443282326924249151361573519590400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-46776018886564653848498302723147039180800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((23388009443282326924249151361573519590400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 29. -/
theorem ep_Q2_008_partial_29_0041_valid :
    mulPoly ep_Q2_008_coefficient_29_0041
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0042 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 42 for generator 29. -/
def ep_Q2_008_partial_29_0042 : Poly :=
[
  term ((4379267823172579476 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 2), (13, 3), (16, 1)],
  term ((4379267823172579476 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 29. -/
theorem ep_Q2_008_partial_29_0042_valid :
    mulPoly ep_Q2_008_coefficient_29_0042
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0043 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 29. -/
def ep_Q2_008_partial_29_0043 : Poly :=
[
  term ((88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 5), (15, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 29. -/
theorem ep_Q2_008_partial_29_0043_valid :
    mulPoly ep_Q2_008_coefficient_29_0043
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0044 : Poly :=
[
  term ((-76375392983316077347211208412235802956550 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 29. -/
def ep_Q2_008_partial_29_0044 : Poly :=
[
  term ((-152750785966632154694422416824471605913100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((76375392983316077347211208412235802956550 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-152750785966632154694422416824471605913100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((76375392983316077347211208412235802956550 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 29. -/
theorem ep_Q2_008_partial_29_0044_valid :
    mulPoly ep_Q2_008_coefficient_29_0044
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0045 : Poly :=
[
  term ((243219932826123588433546187614348800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 29. -/
def ep_Q2_008_partial_29_0045 : Poly :=
[
  term ((486439865652247176867092375228697600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-243219932826123588433546187614348800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((486439865652247176867092375228697600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-243219932826123588433546187614348800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 29. -/
theorem ep_Q2_008_partial_29_0045_valid :
    mulPoly ep_Q2_008_coefficient_29_0045
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0046 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 46 for generator 29. -/
def ep_Q2_008_partial_29_0046 : Poly :=
[
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 2), (13, 2), (16, 1)],
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 29. -/
theorem ep_Q2_008_partial_29_0046_valid :
    mulPoly ep_Q2_008_coefficient_29_0046
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0047 : Poly :=
[
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 29. -/
def ep_Q2_008_partial_29_0047 : Poly :=
[
  term ((-86044766219057044132339621919978649600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-86044766219057044132339621919978649600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 4), (15, 2), (16, 1)],
  term ((43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 29. -/
theorem ep_Q2_008_partial_29_0047_valid :
    mulPoly ep_Q2_008_coefficient_29_0047
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0048 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (7, 2), (16, 1)]
]

/-- Partial product 48 for generator 29. -/
def ep_Q2_008_partial_29_0048 : Poly :=
[
  term ((-18498680662796933724 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 2), (16, 1)],
  term ((-18498680662796933724 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 29. -/
theorem ep_Q2_008_partial_29_0048_valid :
    mulPoly ep_Q2_008_coefficient_29_0048
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0049 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 29. -/
def ep_Q2_008_partial_29_0049 : Poly :=
[
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 29. -/
theorem ep_Q2_008_partial_29_0049_valid :
    mulPoly ep_Q2_008_coefficient_29_0049
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0050 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 29. -/
def ep_Q2_008_partial_29_0050 : Poly :=
[
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 29. -/
theorem ep_Q2_008_partial_29_0050_valid :
    mulPoly ep_Q2_008_coefficient_29_0050
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0051 : Poly :=
[
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 29. -/
def ep_Q2_008_partial_29_0051 : Poly :=
[
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 29. -/
theorem ep_Q2_008_partial_29_0051_valid :
    mulPoly ep_Q2_008_coefficient_29_0051
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0052 : Poly :=
[
  term ((60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 52 for generator 29. -/
def ep_Q2_008_partial_29_0052 : Poly :=
[
  term ((120424510545885000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 29. -/
theorem ep_Q2_008_partial_29_0052_valid :
    mulPoly ep_Q2_008_coefficient_29_0052
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0053 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 29. -/
def ep_Q2_008_partial_29_0053 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 29. -/
theorem ep_Q2_008_partial_29_0053_valid :
    mulPoly ep_Q2_008_coefficient_29_0053
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0054 : Poly :=
[
  term ((100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 54 for generator 29. -/
def ep_Q2_008_partial_29_0054 : Poly :=
[
  term ((201148632999720000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 29. -/
theorem ep_Q2_008_partial_29_0054_valid :
    mulPoly ep_Q2_008_coefficient_29_0054
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0055 : Poly :=
[
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 29. -/
def ep_Q2_008_partial_29_0055 : Poly :=
[
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 29. -/
theorem ep_Q2_008_partial_29_0055_valid :
    mulPoly ep_Q2_008_coefficient_29_0055
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0056 : Poly :=
[
  term ((7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 56 for generator 29. -/
def ep_Q2_008_partial_29_0056 : Poly :=
[
  term ((7953748152290567661 : Rat) / 1385912907228352718) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((7953748152290567661 : Rat) / 1385912907228352718) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 29. -/
theorem ep_Q2_008_partial_29_0056_valid :
    mulPoly ep_Q2_008_coefficient_29_0056
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0057 : Poly :=
[
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 29. -/
def ep_Q2_008_partial_29_0057 : Poly :=
[
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 29. -/
theorem ep_Q2_008_partial_29_0057_valid :
    mulPoly ep_Q2_008_coefficient_29_0057
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0058 : Poly :=
[
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 29. -/
def ep_Q2_008_partial_29_0058 : Poly :=
[
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 29. -/
theorem ep_Q2_008_partial_29_0058_valid :
    mulPoly ep_Q2_008_coefficient_29_0058
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0059 : Poly :=
[
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 29. -/
def ep_Q2_008_partial_29_0059 : Poly :=
[
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 29. -/
theorem ep_Q2_008_partial_29_0059_valid :
    mulPoly ep_Q2_008_coefficient_29_0059
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0060 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 60 for generator 29. -/
def ep_Q2_008_partial_29_0060 : Poly :=
[
  term ((27783919602340272000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((27783919602340272000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 29. -/
theorem ep_Q2_008_partial_29_0060_valid :
    mulPoly ep_Q2_008_coefficient_29_0060
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0061 : Poly :=
[
  term ((-10133644262402653983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 61 for generator 29. -/
def ep_Q2_008_partial_29_0061 : Poly :=
[
  term ((-10133644262402653983 : Rat) / 1385912907228352718) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((10133644262402653983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((-10133644262402653983 : Rat) / 1385912907228352718) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10133644262402653983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 29. -/
theorem ep_Q2_008_partial_29_0061_valid :
    mulPoly ep_Q2_008_coefficient_29_0061
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0062 : Poly :=
[
  term ((51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 62 for generator 29. -/
def ep_Q2_008_partial_29_0062 : Poly :=
[
  term ((103485678293277000 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((103485678293277000 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 29. -/
theorem ep_Q2_008_partial_29_0062_valid :
    mulPoly ep_Q2_008_coefficient_29_0062
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0063 : Poly :=
[
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 29. -/
def ep_Q2_008_partial_29_0063 : Poly :=
[
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 29. -/
theorem ep_Q2_008_partial_29_0063_valid :
    mulPoly ep_Q2_008_coefficient_29_0063
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0064 : Poly :=
[
  term ((185006588968996875 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 64 for generator 29. -/
def ep_Q2_008_partial_29_0064 : Poly :=
[
  term ((370013177937993750 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-185006588968996875 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((370013177937993750 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-185006588968996875 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 29. -/
theorem ep_Q2_008_partial_29_0064_valid :
    mulPoly ep_Q2_008_coefficient_29_0064
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0065 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 29. -/
def ep_Q2_008_partial_29_0065 : Poly :=
[
  term ((13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 29. -/
theorem ep_Q2_008_partial_29_0065_valid :
    mulPoly ep_Q2_008_coefficient_29_0065
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0066 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 66 for generator 29. -/
def ep_Q2_008_partial_29_0066 : Poly :=
[
  term ((57174644564870688000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((57174644564870688000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 29. -/
theorem ep_Q2_008_partial_29_0066_valid :
    mulPoly ep_Q2_008_coefficient_29_0066
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0067 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 29. -/
def ep_Q2_008_partial_29_0067 : Poly :=
[
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 29. -/
theorem ep_Q2_008_partial_29_0067_valid :
    mulPoly ep_Q2_008_coefficient_29_0067
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0068 : Poly :=
[
  term ((151484385779694133866355236509816469536850 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 29. -/
def ep_Q2_008_partial_29_0068 : Poly :=
[
  term ((302968771559388267732710473019632939073700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151484385779694133866355236509816469536850 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((302968771559388267732710473019632939073700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-151484385779694133866355236509816469536850 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 29. -/
theorem ep_Q2_008_partial_29_0068_valid :
    mulPoly ep_Q2_008_coefficient_29_0068
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0069 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 69 for generator 29. -/
def ep_Q2_008_partial_29_0069 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 29. -/
theorem ep_Q2_008_partial_29_0069_valid :
    mulPoly ep_Q2_008_coefficient_29_0069
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0070 : Poly :=
[
  term ((352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 70 for generator 29. -/
def ep_Q2_008_partial_29_0070 : Poly :=
[
  term ((705078892514808000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((705078892514808000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 29. -/
theorem ep_Q2_008_partial_29_0070_valid :
    mulPoly ep_Q2_008_coefficient_29_0070
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0071 : Poly :=
[
  term ((119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 29. -/
def ep_Q2_008_partial_29_0071 : Poly :=
[
  term ((239443078952960388770721335685663753600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((239443078952960388770721335685663753600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 29. -/
theorem ep_Q2_008_partial_29_0071_valid :
    mulPoly ep_Q2_008_coefficient_29_0071
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0072 : Poly :=
[
  term ((9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 72 for generator 29. -/
def ep_Q2_008_partial_29_0072 : Poly :=
[
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 29. -/
theorem ep_Q2_008_partial_29_0072_valid :
    mulPoly ep_Q2_008_coefficient_29_0072
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0073 : Poly :=
[
  term ((219963498591647065562019192230314534298700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 29. -/
def ep_Q2_008_partial_29_0073 : Poly :=
[
  term ((439926997183294131124038384460629068597400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-219963498591647065562019192230314534298700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((439926997183294131124038384460629068597400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-219963498591647065562019192230314534298700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 29. -/
theorem ep_Q2_008_partial_29_0073_valid :
    mulPoly ep_Q2_008_coefficient_29_0073
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0074 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 29. -/
def ep_Q2_008_partial_29_0074 : Poly :=
[
  term ((2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 3), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 29. -/
theorem ep_Q2_008_partial_29_0074_valid :
    mulPoly ep_Q2_008_coefficient_29_0074
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0075 : Poly :=
[
  term ((-131054272148763374019 : Rat) / 2771825814456705436) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 75 for generator 29. -/
def ep_Q2_008_partial_29_0075 : Poly :=
[
  term ((-131054272148763374019 : Rat) / 1385912907228352718) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((131054272148763374019 : Rat) / 2771825814456705436) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((-131054272148763374019 : Rat) / 1385912907228352718) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((131054272148763374019 : Rat) / 2771825814456705436) [(0, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 29. -/
theorem ep_Q2_008_partial_29_0075_valid :
    mulPoly ep_Q2_008_coefficient_29_0075
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0076 : Poly :=
[
  term ((23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 29. -/
def ep_Q2_008_partial_29_0076 : Poly :=
[
  term ((47660199024983385296662926637338727833600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((47660199024983385296662926637338727833600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 4), (15, 2), (16, 1)],
  term ((-23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 29. -/
theorem ep_Q2_008_partial_29_0076_valid :
    mulPoly ep_Q2_008_coefficient_29_0076
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0077 : Poly :=
[
  term ((-220723867400426569405771701823593739352700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 29. -/
def ep_Q2_008_partial_29_0077 : Poly :=
[
  term ((-441447734800853138811543403647187478705400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((220723867400426569405771701823593739352700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-441447734800853138811543403647187478705400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((220723867400426569405771701823593739352700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 29. -/
theorem ep_Q2_008_partial_29_0077_valid :
    mulPoly ep_Q2_008_coefficient_29_0077
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0078 : Poly :=
[
  term ((-7278444550844797161 : Rat) / 1385912907228352718) [(0, 1), (16, 1)]
]

/-- Partial product 78 for generator 29. -/
def ep_Q2_008_partial_29_0078 : Poly :=
[
  term ((-7278444550844797161 : Rat) / 692956453614176359) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((7278444550844797161 : Rat) / 1385912907228352718) [(0, 1), (12, 2), (16, 1)],
  term ((-7278444550844797161 : Rat) / 692956453614176359) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((7278444550844797161 : Rat) / 1385912907228352718) [(0, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 29. -/
theorem ep_Q2_008_partial_29_0078_valid :
    mulPoly ep_Q2_008_coefficient_29_0078
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0079 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 79 for generator 29. -/
def ep_Q2_008_partial_29_0079 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 29. -/
theorem ep_Q2_008_partial_29_0079_valid :
    mulPoly ep_Q2_008_coefficient_29_0079
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0080 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 80 for generator 29. -/
def ep_Q2_008_partial_29_0080 : Poly :=
[
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 29. -/
theorem ep_Q2_008_partial_29_0080_valid :
    mulPoly ep_Q2_008_coefficient_29_0080
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0081 : Poly :=
[
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 29. -/
def ep_Q2_008_partial_29_0081 : Poly :=
[
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 29. -/
theorem ep_Q2_008_partial_29_0081_valid :
    mulPoly ep_Q2_008_coefficient_29_0081
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0082 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (16, 1)]
]

/-- Partial product 82 for generator 29. -/
def ep_Q2_008_partial_29_0082 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (12, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 29. -/
theorem ep_Q2_008_partial_29_0082_valid :
    mulPoly ep_Q2_008_coefficient_29_0082
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0083 : Poly :=
[
  term ((-39303384211129500 : Rat) / 23895050124626771) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 83 for generator 29. -/
def ep_Q2_008_partial_29_0083 : Poly :=
[
  term ((-78606768422259000 : Rat) / 23895050124626771) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((39303384211129500 : Rat) / 23895050124626771) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-78606768422259000 : Rat) / 23895050124626771) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((39303384211129500 : Rat) / 23895050124626771) [(1, 1), (3, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 29. -/
theorem ep_Q2_008_partial_29_0083_valid :
    mulPoly ep_Q2_008_coefficient_29_0083
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0084 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 84 for generator 29. -/
def ep_Q2_008_partial_29_0084 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 29. -/
theorem ep_Q2_008_partial_29_0084_valid :
    mulPoly ep_Q2_008_coefficient_29_0084
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0085 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 85 for generator 29. -/
def ep_Q2_008_partial_29_0085 : Poly :=
[
  term ((3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 29. -/
theorem ep_Q2_008_partial_29_0085_valid :
    mulPoly ep_Q2_008_coefficient_29_0085
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0086 : Poly :=
[
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 29. -/
def ep_Q2_008_partial_29_0086 : Poly :=
[
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 29. -/
theorem ep_Q2_008_partial_29_0086_valid :
    mulPoly ep_Q2_008_coefficient_29_0086
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0087 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 29. -/
def ep_Q2_008_partial_29_0087 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 29. -/
theorem ep_Q2_008_partial_29_0087_valid :
    mulPoly ep_Q2_008_coefficient_29_0087
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0088 : Poly :=
[
  term ((321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 88 for generator 29. -/
def ep_Q2_008_partial_29_0088 : Poly :=
[
  term ((643146287091210000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((643146287091210000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 29. -/
theorem ep_Q2_008_partial_29_0088_valid :
    mulPoly ep_Q2_008_coefficient_29_0088
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0089 : Poly :=
[
  term ((-162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 29. -/
def ep_Q2_008_partial_29_0089 : Poly :=
[
  term ((-325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 29. -/
theorem ep_Q2_008_partial_29_0089_valid :
    mulPoly ep_Q2_008_coefficient_29_0089
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0090 : Poly :=
[
  term ((-12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 90 for generator 29. -/
def ep_Q2_008_partial_29_0090 : Poly :=
[
  term ((-12884881157181718983 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((-12884881157181718983 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 29. -/
theorem ep_Q2_008_partial_29_0090_valid :
    mulPoly ep_Q2_008_coefficient_29_0090
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0091 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 29. -/
def ep_Q2_008_partial_29_0091 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 29. -/
theorem ep_Q2_008_partial_29_0091_valid :
    mulPoly ep_Q2_008_coefficient_29_0091
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0092 : Poly :=
[
  term ((10393452672676600882909066352789319468000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 29. -/
def ep_Q2_008_partial_29_0092 : Poly :=
[
  term ((20786905345353201765818132705578638936000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10393452672676600882909066352789319468000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((20786905345353201765818132705578638936000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10393452672676600882909066352789319468000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 29. -/
theorem ep_Q2_008_partial_29_0092_valid :
    mulPoly ep_Q2_008_coefficient_29_0092
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0093 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 29. -/
def ep_Q2_008_partial_29_0093 : Poly :=
[
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 29. -/
theorem ep_Q2_008_partial_29_0093_valid :
    mulPoly ep_Q2_008_coefficient_29_0093
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0094 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 29. -/
def ep_Q2_008_partial_29_0094 : Poly :=
[
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 29. -/
theorem ep_Q2_008_partial_29_0094_valid :
    mulPoly ep_Q2_008_coefficient_29_0094
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0095 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 95 for generator 29. -/
def ep_Q2_008_partial_29_0095 : Poly :=
[
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (12, 2), (13, 2), (16, 1)],
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 29. -/
theorem ep_Q2_008_partial_29_0095_valid :
    mulPoly ep_Q2_008_coefficient_29_0095
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0096 : Poly :=
[
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 96 for generator 29. -/
def ep_Q2_008_partial_29_0096 : Poly :=
[
  term ((26542157644955337657 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 29. -/
theorem ep_Q2_008_partial_29_0096_valid :
    mulPoly ep_Q2_008_coefficient_29_0096
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0097 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 29. -/
def ep_Q2_008_partial_29_0097 : Poly :=
[
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 29. -/
theorem ep_Q2_008_partial_29_0097_valid :
    mulPoly ep_Q2_008_coefficient_29_0097
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0098 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 29. -/
def ep_Q2_008_partial_29_0098 : Poly :=
[
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 29. -/
theorem ep_Q2_008_partial_29_0098_valid :
    mulPoly ep_Q2_008_coefficient_29_0098
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0099 : Poly :=
[
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 99 for generator 29. -/
def ep_Q2_008_partial_29_0099 : Poly :=
[
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (12, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 29. -/
theorem ep_Q2_008_partial_29_0099_valid :
    mulPoly ep_Q2_008_coefficient_29_0099
        ep_Q2_008_generator_29_0000_0099 =
      ep_Q2_008_partial_29_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_29_0000_0099 : List Poly :=
[
  ep_Q2_008_partial_29_0000,
  ep_Q2_008_partial_29_0001,
  ep_Q2_008_partial_29_0002,
  ep_Q2_008_partial_29_0003,
  ep_Q2_008_partial_29_0004,
  ep_Q2_008_partial_29_0005,
  ep_Q2_008_partial_29_0006,
  ep_Q2_008_partial_29_0007,
  ep_Q2_008_partial_29_0008,
  ep_Q2_008_partial_29_0009,
  ep_Q2_008_partial_29_0010,
  ep_Q2_008_partial_29_0011,
  ep_Q2_008_partial_29_0012,
  ep_Q2_008_partial_29_0013,
  ep_Q2_008_partial_29_0014,
  ep_Q2_008_partial_29_0015,
  ep_Q2_008_partial_29_0016,
  ep_Q2_008_partial_29_0017,
  ep_Q2_008_partial_29_0018,
  ep_Q2_008_partial_29_0019,
  ep_Q2_008_partial_29_0020,
  ep_Q2_008_partial_29_0021,
  ep_Q2_008_partial_29_0022,
  ep_Q2_008_partial_29_0023,
  ep_Q2_008_partial_29_0024,
  ep_Q2_008_partial_29_0025,
  ep_Q2_008_partial_29_0026,
  ep_Q2_008_partial_29_0027,
  ep_Q2_008_partial_29_0028,
  ep_Q2_008_partial_29_0029,
  ep_Q2_008_partial_29_0030,
  ep_Q2_008_partial_29_0031,
  ep_Q2_008_partial_29_0032,
  ep_Q2_008_partial_29_0033,
  ep_Q2_008_partial_29_0034,
  ep_Q2_008_partial_29_0035,
  ep_Q2_008_partial_29_0036,
  ep_Q2_008_partial_29_0037,
  ep_Q2_008_partial_29_0038,
  ep_Q2_008_partial_29_0039,
  ep_Q2_008_partial_29_0040,
  ep_Q2_008_partial_29_0041,
  ep_Q2_008_partial_29_0042,
  ep_Q2_008_partial_29_0043,
  ep_Q2_008_partial_29_0044,
  ep_Q2_008_partial_29_0045,
  ep_Q2_008_partial_29_0046,
  ep_Q2_008_partial_29_0047,
  ep_Q2_008_partial_29_0048,
  ep_Q2_008_partial_29_0049,
  ep_Q2_008_partial_29_0050,
  ep_Q2_008_partial_29_0051,
  ep_Q2_008_partial_29_0052,
  ep_Q2_008_partial_29_0053,
  ep_Q2_008_partial_29_0054,
  ep_Q2_008_partial_29_0055,
  ep_Q2_008_partial_29_0056,
  ep_Q2_008_partial_29_0057,
  ep_Q2_008_partial_29_0058,
  ep_Q2_008_partial_29_0059,
  ep_Q2_008_partial_29_0060,
  ep_Q2_008_partial_29_0061,
  ep_Q2_008_partial_29_0062,
  ep_Q2_008_partial_29_0063,
  ep_Q2_008_partial_29_0064,
  ep_Q2_008_partial_29_0065,
  ep_Q2_008_partial_29_0066,
  ep_Q2_008_partial_29_0067,
  ep_Q2_008_partial_29_0068,
  ep_Q2_008_partial_29_0069,
  ep_Q2_008_partial_29_0070,
  ep_Q2_008_partial_29_0071,
  ep_Q2_008_partial_29_0072,
  ep_Q2_008_partial_29_0073,
  ep_Q2_008_partial_29_0074,
  ep_Q2_008_partial_29_0075,
  ep_Q2_008_partial_29_0076,
  ep_Q2_008_partial_29_0077,
  ep_Q2_008_partial_29_0078,
  ep_Q2_008_partial_29_0079,
  ep_Q2_008_partial_29_0080,
  ep_Q2_008_partial_29_0081,
  ep_Q2_008_partial_29_0082,
  ep_Q2_008_partial_29_0083,
  ep_Q2_008_partial_29_0084,
  ep_Q2_008_partial_29_0085,
  ep_Q2_008_partial_29_0086,
  ep_Q2_008_partial_29_0087,
  ep_Q2_008_partial_29_0088,
  ep_Q2_008_partial_29_0089,
  ep_Q2_008_partial_29_0090,
  ep_Q2_008_partial_29_0091,
  ep_Q2_008_partial_29_0092,
  ep_Q2_008_partial_29_0093,
  ep_Q2_008_partial_29_0094,
  ep_Q2_008_partial_29_0095,
  ep_Q2_008_partial_29_0096,
  ep_Q2_008_partial_29_0097,
  ep_Q2_008_partial_29_0098,
  ep_Q2_008_partial_29_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_29_0000_0099 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-409498006141446917199907463234336257608600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 3), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (13, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((409498006141446917199907463234336257608600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((4073989001640442007064474581108121600000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((43542555253438352949 : Rat) / 2771825814456705436) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2036994500820221003532237290554060800000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43542555253438352949 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((43542555253438352949 : Rat) / 2771825814456705436) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((4073989001640442007064474581108121600000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-43542555253438352949 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((-2036994500820221003532237290554060800000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((31447236669925377421901595712549336662005136 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 4), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-409498006141446917199907463234336257608600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 3), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10645779268790098983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((10645779268790098983 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((24026741055443049657 : Rat) / 692956453614176359) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1068290449319049237408017779046129664000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(0, 1), (5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((46621323303513015458892436697376377305200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24026741055443049657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (12, 2), (13, 3), (16, 1)],
  term ((-1068290449319049237408017779046129664000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23310661651756507729446218348688188652600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 3), (15, 1), (16, 1)],
  term ((46621323303513015458892436697376377305200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((2901471871670012085556436636415101547831777 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-24026741055443049657 : Rat) / 1385912907228352718) [(0, 1), (5, 1), (13, 3), (16, 1)],
  term ((-1084364457149983445097909790750317919103184 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (13, 4), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 5), (16, 1)],
  term ((-87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((86456929312063397635353770222947218314400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-43228464656031698817676885111473609157200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((192943886127363000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((86456929312063397635353770222947218314400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((192943886127363000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-43228464656031698817676885111473609157200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-27783919602340272000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-8379698810136054750 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((4189849405068027375 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-8379698810136054750 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((4189849405068027375 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6953216564818908937691135014650229618502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 4), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((-2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((88910241685108167564 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46776018886564653848498302723147039180800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4379267823172579476 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-152750785966632154694422416824471605913100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-44455120842554083782 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((23388009443282326924249151361573519590400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 1), (12, 2), (13, 3), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((76375392983316077347211208412235802956550 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-152750785966632154694422416824471605913100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((10899446291943658672718742173166785332513554 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-45701126553749823430119506363690957644800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-44455120842554083782 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((556477620239731590685203004372988026018836 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 5), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 5), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 6), (15, 1), (16, 1)],
  term ((486439865652247176867092375228697600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-86044766219057044132339621919978649600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-18498680662796933724 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-243219932826123588433546187614348800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 2), (13, 2), (16, 1)],
  term ((43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (7, 2), (12, 2), (16, 1)],
  term ((-18498680662796933724 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((486439865652247176867092375228697600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)],
  term ((-533096664174501221345018425850855322543636 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-86044766219057044132339621919978649600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 4), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 4), (16, 1)],
  term ((43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 5), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 4), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 3), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((7953748152290567661 : Rat) / 1385912907228352718) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((968279734721343418968927706799194529196621 : Rat) / 168707601851329515375740828258983054697998) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27783919602340272000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-10133644262402653983 : Rat) / 1385912907228352718) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((10133644262402653983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((-10133644262402653983 : Rat) / 1385912907228352718) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((10133644262402653983 : Rat) / 2771825814456705436) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((3382982457425683701478310637681845414832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 4), (16, 1)],
  term ((370013177937993750 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((398859582440607058442861680066099626945600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((57174644564870688000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((302968771559388267732710473019632939073700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((103485678293277000 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-185006588968996875 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-151484385779694133866355236509816469536850 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 3), (13, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((302968771559388267732710473019632939073700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-106442568521387317060376780094359882543100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-185006588968996875 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((6953216564818908937691135014650229618502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 5), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 5), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 6), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((705078892514808000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 3), (16, 1)],
  term ((705078892514808000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((439926997183294131124038384460629068597400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-131054272148763374019 : Rat) / 1385912907228352718) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((239443078952960388770721335685663753600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((47660199024983385296662926637338727833600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-441447734800853138811543403647187478705400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7278444550844797161 : Rat) / 692956453614176359) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((239443078952960388770721335685663753600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-219963498591647065562019192230314534298700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((131054272148763374019 : Rat) / 2771825814456705436) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((-23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((220723867400426569405771701823593739352700 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((7278444550844797161 : Rat) / 1385912907228352718) [(0, 1), (12, 2), (16, 1)],
  term ((-119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 3), (16, 1)],
  term ((-7278444550844797161 : Rat) / 692956453614176359) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-441447734800853138811543403647187478705400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((660650864583720700529810086284222807950100 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((7278444550844797161 : Rat) / 1385912907228352718) [(0, 1), (13, 2), (16, 1)],
  term ((-16393203607332058600928556544844357421217659 : Rat) / 168707601851329515375740828258983054697998) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 3), (16, 1)],
  term ((46585306692168554878284130277882646297600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 4), (15, 2), (16, 1)],
  term ((131054272148763374019 : Rat) / 2771825814456705436) [(0, 1), (13, 4), (16, 1)],
  term ((-23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 5), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((409498006141446917199907463234336257608600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 3), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (12, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term ((-78606768422259000 : Rat) / 23895050124626771) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((39303384211129500 : Rat) / 23895050124626771) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-78606768422259000 : Rat) / 23895050124626771) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((39303384211129500 : Rat) / 23895050124626771) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((409498006141446917199907463234336257608600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 3), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((643146287091210000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((643146287091210000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-12884881157181718983 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((20786905345353201765818132705578638936000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10393452672676600882909066352789319468000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 3), (15, 1), (16, 1)],
  term ((20786905345353201765818132705578638936000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1589267427339181903130432616737284346394663 : Rat) / 168707601851329515375740828258983054697998) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((12884881157181718983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (13, 3), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (12, 2), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-258335334204108671376 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 4), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((1548982209190882076320717932146380800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-174640151036226900761649570781209600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (12, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 99. -/
theorem ep_Q2_008_block_29_0000_0099_valid :
    checkProductSumEq ep_Q2_008_partials_29_0000_0099
      ep_Q2_008_block_29_0000_0099 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
