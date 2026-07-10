/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 11:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_11_0000_0099 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0000 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 11. -/
def ep_Q2_008_partial_11_0000 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem ep_Q2_008_partial_11_0000_valid :
    mulPoly ep_Q2_008_coefficient_11_0000
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0001 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def ep_Q2_008_partial_11_0001 : Poly :=
[
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem ep_Q2_008_partial_11_0001_valid :
    mulPoly ep_Q2_008_coefficient_11_0001
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0002 : Poly :=
[
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 11. -/
def ep_Q2_008_partial_11_0002 : Poly :=
[
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem ep_Q2_008_partial_11_0002_valid :
    mulPoly ep_Q2_008_coefficient_11_0002
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0003 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def ep_Q2_008_partial_11_0003 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem ep_Q2_008_partial_11_0003_valid :
    mulPoly ep_Q2_008_coefficient_11_0003
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0004 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 11. -/
def ep_Q2_008_partial_11_0004 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (14, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem ep_Q2_008_partial_11_0004_valid :
    mulPoly ep_Q2_008_coefficient_11_0004
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0005 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 11. -/
def ep_Q2_008_partial_11_0005 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem ep_Q2_008_partial_11_0005_valid :
    mulPoly ep_Q2_008_coefficient_11_0005
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0006 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 11. -/
def ep_Q2_008_partial_11_0006 : Poly :=
[
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem ep_Q2_008_partial_11_0006_valid :
    mulPoly ep_Q2_008_coefficient_11_0006
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0007 : Poly :=
[
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def ep_Q2_008_partial_11_0007 : Poly :=
[
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem ep_Q2_008_partial_11_0007_valid :
    mulPoly ep_Q2_008_coefficient_11_0007
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0008 : Poly :=
[
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 11. -/
def ep_Q2_008_partial_11_0008 : Poly :=
[
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem ep_Q2_008_partial_11_0008_valid :
    mulPoly ep_Q2_008_coefficient_11_0008
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0009 : Poly :=
[
  term ((-354822218572696875 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def ep_Q2_008_partial_11_0009 : Poly :=
[
  term ((-709644437145393750 : Rat) / 692956453614176359) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((354822218572696875 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((354822218572696875 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-709644437145393750 : Rat) / 692956453614176359) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem ep_Q2_008_partial_11_0009_valid :
    mulPoly ep_Q2_008_coefficient_11_0009
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0010 : Poly :=
[
  term ((-1144264435783111125 : Rat) / 692956453614176359) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 11. -/
def ep_Q2_008_partial_11_0010 : Poly :=
[
  term ((-2288528871566222250 : Rat) / 692956453614176359) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1144264435783111125 : Rat) / 692956453614176359) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((1144264435783111125 : Rat) / 692956453614176359) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2288528871566222250 : Rat) / 692956453614176359) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem ep_Q2_008_partial_11_0010_valid :
    mulPoly ep_Q2_008_coefficient_11_0010
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0011 : Poly :=
[
  term ((104038035411984267447823782727285934811750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 11. -/
def ep_Q2_008_partial_11_0011 : Poly :=
[
  term ((208076070823968534895647565454571869623500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-104038035411984267447823782727285934811750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-104038035411984267447823782727285934811750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((208076070823968534895647565454571869623500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem ep_Q2_008_partial_11_0011_valid :
    mulPoly ep_Q2_008_coefficient_11_0011
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0012 : Poly :=
[
  term ((1095450375996652184121780942920183808000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 11. -/
def ep_Q2_008_partial_11_0012 : Poly :=
[
  term ((2190900751993304368243561885840367616000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2190900751993304368243561885840367616000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1095450375996652184121780942920183808000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1095450375996652184121780942920183808000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem ep_Q2_008_partial_11_0012_valid :
    mulPoly ep_Q2_008_coefficient_11_0012
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0013 : Poly :=
[
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 13 for generator 11. -/
def ep_Q2_008_partial_11_0013 : Poly :=
[
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem ep_Q2_008_partial_11_0013_valid :
    mulPoly ep_Q2_008_coefficient_11_0013
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0014 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 14 for generator 11. -/
def ep_Q2_008_partial_11_0014 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem ep_Q2_008_partial_11_0014_valid :
    mulPoly ep_Q2_008_coefficient_11_0014
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0015 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 11. -/
def ep_Q2_008_partial_11_0015 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem ep_Q2_008_partial_11_0015_valid :
    mulPoly ep_Q2_008_coefficient_11_0015
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0016 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 16 for generator 11. -/
def ep_Q2_008_partial_11_0016 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem ep_Q2_008_partial_11_0016_valid :
    mulPoly ep_Q2_008_coefficient_11_0016
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0017 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 11. -/
def ep_Q2_008_partial_11_0017 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem ep_Q2_008_partial_11_0017_valid :
    mulPoly ep_Q2_008_coefficient_11_0017
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0018 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 18 for generator 11. -/
def ep_Q2_008_partial_11_0018 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem ep_Q2_008_partial_11_0018_valid :
    mulPoly ep_Q2_008_coefficient_11_0018
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0019 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 11. -/
def ep_Q2_008_partial_11_0019 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem ep_Q2_008_partial_11_0019_valid :
    mulPoly ep_Q2_008_coefficient_11_0019
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0020 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 11. -/
def ep_Q2_008_partial_11_0020 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem ep_Q2_008_partial_11_0020_valid :
    mulPoly ep_Q2_008_coefficient_11_0020
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0021 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 21 for generator 11. -/
def ep_Q2_008_partial_11_0021 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem ep_Q2_008_partial_11_0021_valid :
    mulPoly ep_Q2_008_coefficient_11_0021
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0022 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 11. -/
def ep_Q2_008_partial_11_0022 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem ep_Q2_008_partial_11_0022_valid :
    mulPoly ep_Q2_008_coefficient_11_0022
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0023 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 11. -/
def ep_Q2_008_partial_11_0023 : Poly :=
[
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem ep_Q2_008_partial_11_0023_valid :
    mulPoly ep_Q2_008_coefficient_11_0023
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0024 : Poly :=
[
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 11. -/
def ep_Q2_008_partial_11_0024 : Poly :=
[
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 11. -/
theorem ep_Q2_008_partial_11_0024_valid :
    mulPoly ep_Q2_008_coefficient_11_0024
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0025 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 11. -/
def ep_Q2_008_partial_11_0025 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 11. -/
theorem ep_Q2_008_partial_11_0025_valid :
    mulPoly ep_Q2_008_coefficient_11_0025
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0026 : Poly :=
[
  term ((10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 11. -/
def ep_Q2_008_partial_11_0026 : Poly :=
[
  term ((10645779268790098983 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((10645779268790098983 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 11. -/
theorem ep_Q2_008_partial_11_0026_valid :
    mulPoly ep_Q2_008_coefficient_11_0026
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0027 : Poly :=
[
  term ((-534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 11. -/
def ep_Q2_008_partial_11_0027 : Poly :=
[
  term ((-1068290449319049237408017779046129664000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1068290449319049237408017779046129664000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 11. -/
theorem ep_Q2_008_partial_11_0027_valid :
    mulPoly ep_Q2_008_coefficient_11_0027
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0028 : Poly :=
[
  term ((21511324465930761657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 11. -/
def ep_Q2_008_partial_11_0028 : Poly :=
[
  term ((21511324465930761657 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((21511324465930761657 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21511324465930761657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-21511324465930761657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 11. -/
theorem ep_Q2_008_partial_11_0028_valid :
    mulPoly ep_Q2_008_coefficient_11_0028
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0029 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 11. -/
def ep_Q2_008_partial_11_0029 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 11. -/
theorem ep_Q2_008_partial_11_0029_valid :
    mulPoly ep_Q2_008_coefficient_11_0029
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0030 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 30 for generator 11. -/
def ep_Q2_008_partial_11_0030 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 3), (14, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 11. -/
theorem ep_Q2_008_partial_11_0030_valid :
    mulPoly ep_Q2_008_coefficient_11_0030
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0031 : Poly :=
[
  term ((23360454850665446465088117482457287916600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 11. -/
def ep_Q2_008_partial_11_0031 : Poly :=
[
  term ((46720909701330892930176234964914575833200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((46720909701330892930176234964914575833200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-23360454850665446465088117482457287916600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23360454850665446465088117482457287916600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 11. -/
theorem ep_Q2_008_partial_11_0031_valid :
    mulPoly ep_Q2_008_coefficient_11_0031
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0032 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 11. -/
def ep_Q2_008_partial_11_0032 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 11. -/
theorem ep_Q2_008_partial_11_0032_valid :
    mulPoly ep_Q2_008_coefficient_11_0032
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0033 : Poly :=
[
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 11. -/
def ep_Q2_008_partial_11_0033 : Poly :=
[
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 11. -/
theorem ep_Q2_008_partial_11_0033_valid :
    mulPoly ep_Q2_008_coefficient_11_0033
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0034 : Poly :=
[
  term ((21415059532380094466270846020660407522600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 11. -/
def ep_Q2_008_partial_11_0034 : Poly :=
[
  term ((42830119064760188932541692041320815045200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42830119064760188932541692041320815045200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21415059532380094466270846020660407522600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21415059532380094466270846020660407522600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 11. -/
theorem ep_Q2_008_partial_11_0034_valid :
    mulPoly ep_Q2_008_coefficient_11_0034
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0035 : Poly :=
[
  term ((-707460915800331000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 35 for generator 11. -/
def ep_Q2_008_partial_11_0035 : Poly :=
[
  term ((-1414921831600662000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-1414921831600662000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((707460915800331000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((707460915800331000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 11. -/
theorem ep_Q2_008_partial_11_0035_valid :
    mulPoly ep_Q2_008_coefficient_11_0035
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0036 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 11. -/
def ep_Q2_008_partial_11_0036 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 11. -/
theorem ep_Q2_008_partial_11_0036_valid :
    mulPoly ep_Q2_008_coefficient_11_0036
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0037 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 11. -/
def ep_Q2_008_partial_11_0037 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 11. -/
theorem ep_Q2_008_partial_11_0037_valid :
    mulPoly ep_Q2_008_coefficient_11_0037
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0038 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 38 for generator 11. -/
def ep_Q2_008_partial_11_0038 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 11. -/
theorem ep_Q2_008_partial_11_0038_valid :
    mulPoly ep_Q2_008_coefficient_11_0038
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0039 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 11. -/
def ep_Q2_008_partial_11_0039 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 11. -/
theorem ep_Q2_008_partial_11_0039_valid :
    mulPoly ep_Q2_008_coefficient_11_0039
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0040 : Poly :=
[
  term ((-4644815852602920375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 11. -/
def ep_Q2_008_partial_11_0040 : Poly :=
[
  term ((-4644815852602920375 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4644815852602920375 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4644815852602920375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((4644815852602920375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 11. -/
theorem ep_Q2_008_partial_11_0040_valid :
    mulPoly ep_Q2_008_coefficient_11_0040
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0041 : Poly :=
[
  term ((-199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 11. -/
def ep_Q2_008_partial_11_0041 : Poly :=
[
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 11. -/
theorem ep_Q2_008_partial_11_0041_valid :
    mulPoly ep_Q2_008_coefficient_11_0041
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0042 : Poly :=
[
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 42 for generator 11. -/
def ep_Q2_008_partial_11_0042 : Poly :=
[
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 11. -/
theorem ep_Q2_008_partial_11_0042_valid :
    mulPoly ep_Q2_008_coefficient_11_0042
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0043 : Poly :=
[
  term ((23642482252877703891 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 11. -/
def ep_Q2_008_partial_11_0043 : Poly :=
[
  term ((47284964505755407782 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((47284964505755407782 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23642482252877703891 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-23642482252877703891 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 11. -/
theorem ep_Q2_008_partial_11_0043_valid :
    mulPoly ep_Q2_008_coefficient_11_0043
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0044 : Poly :=
[
  term ((-11694004721641163462124575680786759795200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 11. -/
def ep_Q2_008_partial_11_0044 : Poly :=
[
  term ((-23388009443282326924249151361573519590400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23388009443282326924249151361573519590400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((11694004721641163462124575680786759795200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((11694004721641163462124575680786759795200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 11. -/
theorem ep_Q2_008_partial_11_0044_valid :
    mulPoly ep_Q2_008_coefficient_11_0044
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0045 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 45 for generator 11. -/
def ep_Q2_008_partial_11_0045 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 11. -/
theorem ep_Q2_008_partial_11_0045_valid :
    mulPoly ep_Q2_008_coefficient_11_0045
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0046 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 11. -/
def ep_Q2_008_partial_11_0046 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 11. -/
theorem ep_Q2_008_partial_11_0046_valid :
    mulPoly ep_Q2_008_coefficient_11_0046
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0047 : Poly :=
[
  term ((-72123760388163557199292448721236687706075 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 11. -/
def ep_Q2_008_partial_11_0047 : Poly :=
[
  term ((-144247520776327114398584897442473375412150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144247520776327114398584897442473375412150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((72123760388163557199292448721236687706075 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((72123760388163557199292448721236687706075 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 11. -/
theorem ep_Q2_008_partial_11_0047_valid :
    mulPoly ep_Q2_008_coefficient_11_0047
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0048 : Poly :=
[
  term ((121609966413061794216773093807174400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 11. -/
def ep_Q2_008_partial_11_0048 : Poly :=
[
  term ((243219932826123588433546187614348800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((243219932826123588433546187614348800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-121609966413061794216773093807174400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-121609966413061794216773093807174400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 11. -/
theorem ep_Q2_008_partial_11_0048_valid :
    mulPoly ep_Q2_008_coefficient_11_0048
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0049 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 49 for generator 11. -/
def ep_Q2_008_partial_11_0049 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (14, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 11. -/
theorem ep_Q2_008_partial_11_0049_valid :
    mulPoly ep_Q2_008_coefficient_11_0049
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0050 : Poly :=
[
  term ((-21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 11. -/
def ep_Q2_008_partial_11_0050 : Poly :=
[
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 11. -/
theorem ep_Q2_008_partial_11_0050_valid :
    mulPoly ep_Q2_008_coefficient_11_0050
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0051 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (16, 1)]
]

/-- Partial product 51 for generator 11. -/
def ep_Q2_008_partial_11_0051 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 11. -/
theorem ep_Q2_008_partial_11_0051_valid :
    mulPoly ep_Q2_008_coefficient_11_0051
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0052 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 11. -/
def ep_Q2_008_partial_11_0052 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 11. -/
theorem ep_Q2_008_partial_11_0052_valid :
    mulPoly ep_Q2_008_coefficient_11_0052
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0053 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 11. -/
def ep_Q2_008_partial_11_0053 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 3), (15, 2), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (14, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 11. -/
theorem ep_Q2_008_partial_11_0053_valid :
    mulPoly ep_Q2_008_coefficient_11_0053
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0054 : Poly :=
[
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 11. -/
def ep_Q2_008_partial_11_0054 : Poly :=
[
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 11. -/
theorem ep_Q2_008_partial_11_0054_valid :
    mulPoly ep_Q2_008_coefficient_11_0054
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0055 : Poly :=
[
  term ((60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 55 for generator 11. -/
def ep_Q2_008_partial_11_0055 : Poly :=
[
  term ((120424510545885000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 11. -/
theorem ep_Q2_008_partial_11_0055_valid :
    mulPoly ep_Q2_008_coefficient_11_0055
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0056 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 11. -/
def ep_Q2_008_partial_11_0056 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 11. -/
theorem ep_Q2_008_partial_11_0056_valid :
    mulPoly ep_Q2_008_coefficient_11_0056
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0057 : Poly :=
[
  term ((100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 11. -/
def ep_Q2_008_partial_11_0057 : Poly :=
[
  term ((201148632999720000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 11. -/
theorem ep_Q2_008_partial_11_0057_valid :
    mulPoly ep_Q2_008_coefficient_11_0057
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0058 : Poly :=
[
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 11. -/
def ep_Q2_008_partial_11_0058 : Poly :=
[
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 11. -/
theorem ep_Q2_008_partial_11_0058_valid :
    mulPoly ep_Q2_008_coefficient_11_0058
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0059 : Poly :=
[
  term ((7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 59 for generator 11. -/
def ep_Q2_008_partial_11_0059 : Poly :=
[
  term ((7953748152290567661 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7953748152290567661 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 11. -/
theorem ep_Q2_008_partial_11_0059_valid :
    mulPoly ep_Q2_008_coefficient_11_0059
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0060 : Poly :=
[
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 11. -/
def ep_Q2_008_partial_11_0060 : Poly :=
[
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 11. -/
theorem ep_Q2_008_partial_11_0060_valid :
    mulPoly ep_Q2_008_coefficient_11_0060
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0061 : Poly :=
[
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 11. -/
def ep_Q2_008_partial_11_0061 : Poly :=
[
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 11. -/
theorem ep_Q2_008_partial_11_0061_valid :
    mulPoly ep_Q2_008_coefficient_11_0061
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0062 : Poly :=
[
  term ((-167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 11. -/
def ep_Q2_008_partial_11_0062 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 11. -/
theorem ep_Q2_008_partial_11_0062_valid :
    mulPoly ep_Q2_008_coefficient_11_0062
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0063 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 63 for generator 11. -/
def ep_Q2_008_partial_11_0063 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 11. -/
theorem ep_Q2_008_partial_11_0063_valid :
    mulPoly ep_Q2_008_coefficient_11_0063
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0064 : Poly :=
[
  term ((337651800722885250 : Rat) / 692956453614176359) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 64 for generator 11. -/
def ep_Q2_008_partial_11_0064 : Poly :=
[
  term ((675303601445770500 : Rat) / 692956453614176359) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((675303601445770500 : Rat) / 692956453614176359) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-337651800722885250 : Rat) / 692956453614176359) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((-337651800722885250 : Rat) / 692956453614176359) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 11. -/
theorem ep_Q2_008_partial_11_0064_valid :
    mulPoly ep_Q2_008_coefficient_11_0064
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0065 : Poly :=
[
  term ((51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 65 for generator 11. -/
def ep_Q2_008_partial_11_0065 : Poly :=
[
  term ((103485678293277000 : Rat) / 23895050124626771) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((103485678293277000 : Rat) / 23895050124626771) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 11. -/
theorem ep_Q2_008_partial_11_0065_valid :
    mulPoly ep_Q2_008_coefficient_11_0065
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0066 : Poly :=
[
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 11. -/
def ep_Q2_008_partial_11_0066 : Poly :=
[
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 11. -/
theorem ep_Q2_008_partial_11_0066_valid :
    mulPoly ep_Q2_008_coefficient_11_0066
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0067 : Poly :=
[
  term ((-3667585238797021875 : Rat) / 1385912907228352718) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 11. -/
def ep_Q2_008_partial_11_0067 : Poly :=
[
  term ((-3667585238797021875 : Rat) / 692956453614176359) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3667585238797021875 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3667585238797021875 : Rat) / 1385912907228352718) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3667585238797021875 : Rat) / 1385912907228352718) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 11. -/
theorem ep_Q2_008_partial_11_0067_valid :
    mulPoly ep_Q2_008_coefficient_11_0067
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0068 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 11. -/
def ep_Q2_008_partial_11_0068 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 11. -/
theorem ep_Q2_008_partial_11_0068_valid :
    mulPoly ep_Q2_008_coefficient_11_0068
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0069 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 69 for generator 11. -/
def ep_Q2_008_partial_11_0069 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 11. -/
theorem ep_Q2_008_partial_11_0069_valid :
    mulPoly ep_Q2_008_coefficient_11_0069
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0070 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 11. -/
def ep_Q2_008_partial_11_0070 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 11. -/
theorem ep_Q2_008_partial_11_0070_valid :
    mulPoly ep_Q2_008_coefficient_11_0070
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0071 : Poly :=
[
  term ((140612163529244517965193422082050668348575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 11. -/
def ep_Q2_008_partial_11_0071 : Poly :=
[
  term ((281224327058489035930386844164101336697150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((281224327058489035930386844164101336697150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-140612163529244517965193422082050668348575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-140612163529244517965193422082050668348575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 11. -/
theorem ep_Q2_008_partial_11_0071_valid :
    mulPoly ep_Q2_008_coefficient_11_0071
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0072 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 72 for generator 11. -/
def ep_Q2_008_partial_11_0072 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 11. -/
theorem ep_Q2_008_partial_11_0072_valid :
    mulPoly ep_Q2_008_coefficient_11_0072
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0073 : Poly :=
[
  term ((352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 73 for generator 11. -/
def ep_Q2_008_partial_11_0073 : Poly :=
[
  term ((705078892514808000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (11, 2), (14, 1), (16, 1)],
  term ((705078892514808000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((-352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 11. -/
theorem ep_Q2_008_partial_11_0073_valid :
    mulPoly ep_Q2_008_coefficient_11_0073
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0074 : Poly :=
[
  term ((119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 11. -/
def ep_Q2_008_partial_11_0074 : Poly :=
[
  term ((239443078952960388770721335685663753600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((239443078952960388770721335685663753600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 11. -/
theorem ep_Q2_008_partial_11_0074_valid :
    mulPoly ep_Q2_008_coefficient_11_0074
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0075 : Poly :=
[
  term ((9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 75 for generator 11. -/
def ep_Q2_008_partial_11_0075 : Poly :=
[
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 11. -/
theorem ep_Q2_008_partial_11_0075_valid :
    mulPoly ep_Q2_008_coefficient_11_0075
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0076 : Poly :=
[
  term ((27547656954382098124091582391168011473950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 11. -/
def ep_Q2_008_partial_11_0076 : Poly :=
[
  term ((55095313908764196248183164782336022947900 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((55095313908764196248183164782336022947900 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27547656954382098124091582391168011473950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27547656954382098124091582391168011473950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 11. -/
theorem ep_Q2_008_partial_11_0076_valid :
    mulPoly ep_Q2_008_coefficient_11_0076
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0077 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 11. -/
def ep_Q2_008_partial_11_0077 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 11. -/
theorem ep_Q2_008_partial_11_0077_valid :
    mulPoly ep_Q2_008_coefficient_11_0077
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0078 : Poly :=
[
  term ((-57609204472338599679 : Rat) / 2771825814456705436) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 78 for generator 11. -/
def ep_Q2_008_partial_11_0078 : Poly :=
[
  term ((-57609204472338599679 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-57609204472338599679 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((57609204472338599679 : Rat) / 2771825814456705436) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((57609204472338599679 : Rat) / 2771825814456705436) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 11. -/
theorem ep_Q2_008_partial_11_0078_valid :
    mulPoly ep_Q2_008_coefficient_11_0078
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0079 : Poly :=
[
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 11. -/
def ep_Q2_008_partial_11_0079 : Poly :=
[
  term ((24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 3), (15, 2), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 11. -/
theorem ep_Q2_008_partial_11_0079_valid :
    mulPoly ep_Q2_008_coefficient_11_0079
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0080 : Poly :=
[
  term ((-172238262715752109592291775565435792761750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 80 for generator 11. -/
def ep_Q2_008_partial_11_0080 : Poly :=
[
  term ((-344476525431504219184583551130871585523500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-344476525431504219184583551130871585523500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((172238262715752109592291775565435792761750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((172238262715752109592291775565435792761750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 11. -/
theorem ep_Q2_008_partial_11_0080_valid :
    mulPoly ep_Q2_008_coefficient_11_0080
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0081 : Poly :=
[
  term ((-5952848592451247661 : Rat) / 5543651628913410872) [(0, 1), (16, 1)]
]

/-- Partial product 81 for generator 11. -/
def ep_Q2_008_partial_11_0081 : Poly :=
[
  term ((-5952848592451247661 : Rat) / 2771825814456705436) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-5952848592451247661 : Rat) / 2771825814456705436) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((5952848592451247661 : Rat) / 5543651628913410872) [(0, 1), (14, 2), (16, 1)],
  term ((5952848592451247661 : Rat) / 5543651628913410872) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 11. -/
theorem ep_Q2_008_partial_11_0081_valid :
    mulPoly ep_Q2_008_coefficient_11_0081
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0082 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 82 for generator 11. -/
def ep_Q2_008_partial_11_0082 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 2), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 11. -/
theorem ep_Q2_008_partial_11_0082_valid :
    mulPoly ep_Q2_008_coefficient_11_0082
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0083 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 83 for generator 11. -/
def ep_Q2_008_partial_11_0083 : Poly :=
[
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 11. -/
theorem ep_Q2_008_partial_11_0083_valid :
    mulPoly ep_Q2_008_coefficient_11_0083
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0084 : Poly :=
[
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 11. -/
def ep_Q2_008_partial_11_0084 : Poly :=
[
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 11. -/
theorem ep_Q2_008_partial_11_0084_valid :
    mulPoly ep_Q2_008_coefficient_11_0084
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0085 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (16, 1)]
]

/-- Partial product 85 for generator 11. -/
def ep_Q2_008_partial_11_0085 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 11. -/
theorem ep_Q2_008_partial_11_0085_valid :
    mulPoly ep_Q2_008_coefficient_11_0085
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0086 : Poly :=
[
  term ((-295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 86 for generator 11. -/
def ep_Q2_008_partial_11_0086 : Poly :=
[
  term ((-591535782571545000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-591535782571545000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 11. -/
theorem ep_Q2_008_partial_11_0086_valid :
    mulPoly ep_Q2_008_coefficient_11_0086
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0087 : Poly :=
[
  term ((147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 11. -/
def ep_Q2_008_partial_11_0087 : Poly :=
[
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 11. -/
theorem ep_Q2_008_partial_11_0087_valid :
    mulPoly ep_Q2_008_coefficient_11_0087
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0088 : Poly :=
[
  term ((7521660498034123844922561142086958104750 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 11. -/
def ep_Q2_008_partial_11_0088 : Poly :=
[
  term ((15043320996068247689845122284173916209500 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7521660498034123844922561142086958104750 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7521660498034123844922561142086958104750 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((15043320996068247689845122284173916209500 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 11. -/
theorem ep_Q2_008_partial_11_0088_valid :
    mulPoly ep_Q2_008_coefficient_11_0088
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0089 : Poly :=
[
  term ((-1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (16, 1)]
]

/-- Partial product 89 for generator 11. -/
def ep_Q2_008_partial_11_0089 : Poly :=
[
  term ((-3051371828754963000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (14, 2), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3051371828754963000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 11. -/
theorem ep_Q2_008_partial_11_0089_valid :
    mulPoly ep_Q2_008_coefficient_11_0089
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0090 : Poly :=
[
  term ((-62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 90 for generator 11. -/
def ep_Q2_008_partial_11_0090 : Poly :=
[
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 11. -/
theorem ep_Q2_008_partial_11_0090_valid :
    mulPoly ep_Q2_008_coefficient_11_0090
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0091 : Poly :=
[
  term ((372488891273659125 : Rat) / 692956453614176359) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 91 for generator 11. -/
def ep_Q2_008_partial_11_0091 : Poly :=
[
  term ((744977782547318250 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-372488891273659125 : Rat) / 692956453614176359) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-372488891273659125 : Rat) / 692956453614176359) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((744977782547318250 : Rat) / 692956453614176359) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 11. -/
theorem ep_Q2_008_partial_11_0091_valid :
    mulPoly ep_Q2_008_coefficient_11_0091
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0092 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 92 for generator 11. -/
def ep_Q2_008_partial_11_0092 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 11. -/
theorem ep_Q2_008_partial_11_0092_valid :
    mulPoly ep_Q2_008_coefficient_11_0092
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0093 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 93 for generator 11. -/
def ep_Q2_008_partial_11_0093 : Poly :=
[
  term ((3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 11. -/
theorem ep_Q2_008_partial_11_0093_valid :
    mulPoly ep_Q2_008_coefficient_11_0093
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0094 : Poly :=
[
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 11. -/
def ep_Q2_008_partial_11_0094 : Poly :=
[
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 11. -/
theorem ep_Q2_008_partial_11_0094_valid :
    mulPoly ep_Q2_008_coefficient_11_0094
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0095 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 11. -/
def ep_Q2_008_partial_11_0095 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 11. -/
theorem ep_Q2_008_partial_11_0095_valid :
    mulPoly ep_Q2_008_coefficient_11_0095
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0096 : Poly :=
[
  term ((321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 96 for generator 11. -/
def ep_Q2_008_partial_11_0096 : Poly :=
[
  term ((643146287091210000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((643146287091210000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 11. -/
theorem ep_Q2_008_partial_11_0096_valid :
    mulPoly ep_Q2_008_coefficient_11_0096
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0097 : Poly :=
[
  term ((-162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 11. -/
def ep_Q2_008_partial_11_0097 : Poly :=
[
  term ((-325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 11. -/
theorem ep_Q2_008_partial_11_0097_valid :
    mulPoly ep_Q2_008_coefficient_11_0097
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0098 : Poly :=
[
  term ((-10826813038489846983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 98 for generator 11. -/
def ep_Q2_008_partial_11_0098 : Poly :=
[
  term ((-10826813038489846983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10826813038489846983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((10826813038489846983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((10826813038489846983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 11. -/
theorem ep_Q2_008_partial_11_0098_valid :
    mulPoly ep_Q2_008_coefficient_11_0098
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0099 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 11. -/
def ep_Q2_008_partial_11_0099 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 11. -/
theorem ep_Q2_008_partial_11_0099_valid :
    mulPoly ep_Q2_008_coefficient_11_0099
        ep_Q2_008_generator_11_0000_0099 =
      ep_Q2_008_partial_11_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_11_0000_0099 : List Poly :=
[
  ep_Q2_008_partial_11_0000,
  ep_Q2_008_partial_11_0001,
  ep_Q2_008_partial_11_0002,
  ep_Q2_008_partial_11_0003,
  ep_Q2_008_partial_11_0004,
  ep_Q2_008_partial_11_0005,
  ep_Q2_008_partial_11_0006,
  ep_Q2_008_partial_11_0007,
  ep_Q2_008_partial_11_0008,
  ep_Q2_008_partial_11_0009,
  ep_Q2_008_partial_11_0010,
  ep_Q2_008_partial_11_0011,
  ep_Q2_008_partial_11_0012,
  ep_Q2_008_partial_11_0013,
  ep_Q2_008_partial_11_0014,
  ep_Q2_008_partial_11_0015,
  ep_Q2_008_partial_11_0016,
  ep_Q2_008_partial_11_0017,
  ep_Q2_008_partial_11_0018,
  ep_Q2_008_partial_11_0019,
  ep_Q2_008_partial_11_0020,
  ep_Q2_008_partial_11_0021,
  ep_Q2_008_partial_11_0022,
  ep_Q2_008_partial_11_0023,
  ep_Q2_008_partial_11_0024,
  ep_Q2_008_partial_11_0025,
  ep_Q2_008_partial_11_0026,
  ep_Q2_008_partial_11_0027,
  ep_Q2_008_partial_11_0028,
  ep_Q2_008_partial_11_0029,
  ep_Q2_008_partial_11_0030,
  ep_Q2_008_partial_11_0031,
  ep_Q2_008_partial_11_0032,
  ep_Q2_008_partial_11_0033,
  ep_Q2_008_partial_11_0034,
  ep_Q2_008_partial_11_0035,
  ep_Q2_008_partial_11_0036,
  ep_Q2_008_partial_11_0037,
  ep_Q2_008_partial_11_0038,
  ep_Q2_008_partial_11_0039,
  ep_Q2_008_partial_11_0040,
  ep_Q2_008_partial_11_0041,
  ep_Q2_008_partial_11_0042,
  ep_Q2_008_partial_11_0043,
  ep_Q2_008_partial_11_0044,
  ep_Q2_008_partial_11_0045,
  ep_Q2_008_partial_11_0046,
  ep_Q2_008_partial_11_0047,
  ep_Q2_008_partial_11_0048,
  ep_Q2_008_partial_11_0049,
  ep_Q2_008_partial_11_0050,
  ep_Q2_008_partial_11_0051,
  ep_Q2_008_partial_11_0052,
  ep_Q2_008_partial_11_0053,
  ep_Q2_008_partial_11_0054,
  ep_Q2_008_partial_11_0055,
  ep_Q2_008_partial_11_0056,
  ep_Q2_008_partial_11_0057,
  ep_Q2_008_partial_11_0058,
  ep_Q2_008_partial_11_0059,
  ep_Q2_008_partial_11_0060,
  ep_Q2_008_partial_11_0061,
  ep_Q2_008_partial_11_0062,
  ep_Q2_008_partial_11_0063,
  ep_Q2_008_partial_11_0064,
  ep_Q2_008_partial_11_0065,
  ep_Q2_008_partial_11_0066,
  ep_Q2_008_partial_11_0067,
  ep_Q2_008_partial_11_0068,
  ep_Q2_008_partial_11_0069,
  ep_Q2_008_partial_11_0070,
  ep_Q2_008_partial_11_0071,
  ep_Q2_008_partial_11_0072,
  ep_Q2_008_partial_11_0073,
  ep_Q2_008_partial_11_0074,
  ep_Q2_008_partial_11_0075,
  ep_Q2_008_partial_11_0076,
  ep_Q2_008_partial_11_0077,
  ep_Q2_008_partial_11_0078,
  ep_Q2_008_partial_11_0079,
  ep_Q2_008_partial_11_0080,
  ep_Q2_008_partial_11_0081,
  ep_Q2_008_partial_11_0082,
  ep_Q2_008_partial_11_0083,
  ep_Q2_008_partial_11_0084,
  ep_Q2_008_partial_11_0085,
  ep_Q2_008_partial_11_0086,
  ep_Q2_008_partial_11_0087,
  ep_Q2_008_partial_11_0088,
  ep_Q2_008_partial_11_0089,
  ep_Q2_008_partial_11_0090,
  ep_Q2_008_partial_11_0091,
  ep_Q2_008_partial_11_0092,
  ep_Q2_008_partial_11_0093,
  ep_Q2_008_partial_11_0094,
  ep_Q2_008_partial_11_0095,
  ep_Q2_008_partial_11_0096,
  ep_Q2_008_partial_11_0097,
  ep_Q2_008_partial_11_0098,
  ep_Q2_008_partial_11_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_11_0000_0099 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (4, 1), (15, 3), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (14, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-709644437145393750 : Rat) / 692956453614176359) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2288528871566222250 : Rat) / 692956453614176359) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((208076070823968534895647565454571869623500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2190900751993304368243561885840367616000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (2, 1), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10645779268790098983 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1068290449319049237408017779046129664000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21511324465930761657 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((46720909701330892930176234964914575833200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((42830119064760188932541692041320815045200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1414921831600662000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4644815852602920375 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((47284964505755407782 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23388009443282326924249151361573519590400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-144247520776327114398584897442473375412150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((243219932826123588433546187614348800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7953748152290567661 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((675303601445770500 : Rat) / 692956453614176359) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((103485678293277000 : Rat) / 23895050124626771) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3667585238797021875 : Rat) / 692956453614176359) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (2, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((281224327058489035930386844164101336697150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((705078892514808000 : Rat) / 692956453614176359) [(0, 1), (2, 1), (11, 2), (14, 1), (16, 1)],
  term ((239443078952960388770721335685663753600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((55095313908764196248183164782336022947900 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-57609204472338599679 : Rat) / 1385912907228352718) [(0, 1), (2, 1), (13, 2), (14, 1), (16, 1)],
  term ((24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-344476525431504219184583551130871585523500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5952848592451247661 : Rat) / 2771825814456705436) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((2190900751993304368243561885840367616000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((10645779268790098983 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1068290449319049237408017779046129664000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((21511324465930761657 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((46720909701330892930176234964914575833200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((42830119064760188932541692041320815045200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1414921831600662000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4644815852602920375 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-398345591271509885135193070152794112000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((47284964505755407782 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23388009443282326924249151361573519590400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-144247520776327114398584897442473375412150 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((243219932826123588433546187614348800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43022383109528522066169810959989324800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (7, 3), (15, 2), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((7953748152290567661 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((675303601445770500 : Rat) / 692956453614176359) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((103485678293277000 : Rat) / 23895050124626771) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3667585238797021875 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((354822218572696875 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((324416944189591928346169349252031185894025 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((705078892514808000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((239443078952960388770721335685663753600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((1144264435783111125 : Rat) / 692956453614176359) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((194386973462466363146520647623942521239025 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57609204472338599679 : Rat) / 1385912907228352718) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (13, 3), (15, 2), (16, 1)],
  term ((-104038035411984267447823782727285934811750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5952848592451247661 : Rat) / 2771825814456705436) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-448514560843488486632407333858157520335250 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-709644437145393750 : Rat) / 692956453614176359) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2288528871566222250 : Rat) / 692956453614176359) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((208076070823968534895647565454571869623500 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-1095450375996652184121780942920183808000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1095450375996652184121780942920183808000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 5543651628913410872) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (15, 4), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (10, 1), (15, 3), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10645779268790098983 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((534145224659524618704008889523064832000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-21511324465930761657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-21511324465930761657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 3), (14, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-23360454850665446465088117482457287916600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23360454850665446465088117482457287916600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-21415059532380094466270846020660407522600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21415059532380094466270846020660407522600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((707460915800331000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((707460915800331000 : Rat) / 692956453614176359) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((4644815852602920375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((4644815852602920375 : Rat) / 1385912907228352718) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((199172795635754942567596535076397056000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-23642482252877703891 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-23642482252877703891 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((11694004721641163462124575680786759795200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((11694004721641163462124575680786759795200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 4), (15, 3), (16, 1)],
  term ((72123760388163557199292448721236687706075 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((72123760388163557199292448721236687706075 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-121609966413061794216773093807174400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-121609966413061794216773093807174400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (14, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (14, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (15, 3), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7953748152290567661 : Rat) / 2771825814456705436) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-337651800722885250 : Rat) / 692956453614176359) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((-337651800722885250 : Rat) / 692956453614176359) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-51742839146638500 : Rat) / 23895050124626771) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((3667585238797021875 : Rat) / 1385912907228352718) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3667585238797021875 : Rat) / 1385912907228352718) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((-140612163529244517965193422082050668348575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-140612163529244517965193422082050668348575 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((-352539446257404000 : Rat) / 692956453614176359) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9497299241309471661 : Rat) / 5543651628913410872) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27547656954382098124091582391168011473950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27547656954382098124091582391168011473950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((57609204472338599679 : Rat) / 2771825814456705436) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((57609204472338599679 : Rat) / 2771825814456705436) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 4), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 3), (16, 1)],
  term ((172238262715752109592291775565435792761750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((5952848592451247661 : Rat) / 5543651628913410872) [(0, 1), (14, 2), (16, 1)],
  term ((5952848592451247661 : Rat) / 5543651628913410872) [(0, 1), (15, 2), (16, 1)],
  term ((172238262715752109592291775565435792761750 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (15, 4), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 2), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(0, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(0, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(0, 2), (5, 1), (15, 3), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1), (16, 1)],
  term ((-591535782571545000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((15043320996068247689845122284173916209500 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3051371828754963000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((744977782547318250 : Rat) / 692956453614176359) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((643146287091210000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10826813038489846983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3087102178037808000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67408228648866217224710569402955016241200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((643146287091210000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-325919120131235360565157966488649728000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10826813038489846983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-7521660498034123844922561142086958104750 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7521660498034123844922561142086958104750 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (14, 2), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((-372488891273659125 : Rat) / 692956453614176359) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-372488891273659125 : Rat) / 692956453614176359) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((-591535782571545000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((15043320996068247689845122284173916209500 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3051371828754963000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((744977782547318250 : Rat) / 692956453614176359) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((162959560065617680282578983244324864000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((10826813038489846983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((10826813038489846983 : Rat) / 2771825814456705436) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 99. -/
theorem ep_Q2_008_block_11_0000_0099_valid :
    checkProductSumEq ep_Q2_008_partials_11_0000_0099
      ep_Q2_008_block_11_0000_0099 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
