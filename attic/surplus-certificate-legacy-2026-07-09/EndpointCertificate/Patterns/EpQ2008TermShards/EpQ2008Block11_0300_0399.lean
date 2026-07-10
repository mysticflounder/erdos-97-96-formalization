/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 11:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_11_0300_0399 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0300 : Poly :=
[
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 300 for generator 11. -/
def ep_Q2_008_partial_11_0300 : Poly :=
[
  term ((-16207286434698492000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16207286434698492000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 11. -/
theorem ep_Q2_008_partial_11_0300_valid :
    mulPoly ep_Q2_008_coefficient_11_0300
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0301 : Poly :=
[
  term ((21714996622521826633915077968809728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 11. -/
def ep_Q2_008_partial_11_0301 : Poly :=
[
  term ((43429993245043653267830155937619456000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21714996622521826633915077968809728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-21714996622521826633915077968809728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((43429993245043653267830155937619456000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 11. -/
theorem ep_Q2_008_partial_11_0301_valid :
    mulPoly ep_Q2_008_coefficient_11_0301
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0302 : Poly :=
[
  term ((188936101419620625 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 302 for generator 11. -/
def ep_Q2_008_partial_11_0302 : Poly :=
[
  term ((377872202839241250 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-188936101419620625 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-188936101419620625 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((377872202839241250 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 11. -/
theorem ep_Q2_008_partial_11_0302_valid :
    mulPoly ep_Q2_008_coefficient_11_0302
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0303 : Poly :=
[
  term ((304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 11. -/
def ep_Q2_008_partial_11_0303 : Poly :=
[
  term ((608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 11. -/
theorem ep_Q2_008_partial_11_0303_valid :
    mulPoly ep_Q2_008_coefficient_11_0303
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0304 : Poly :=
[
  term ((-40179288766839141656756581514451394694100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 11. -/
def ep_Q2_008_partial_11_0304 : Poly :=
[
  term ((-80358577533678283313513163028902789388200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((40179288766839141656756581514451394694100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((40179288766839141656756581514451394694100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-80358577533678283313513163028902789388200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 11. -/
theorem ep_Q2_008_partial_11_0304_valid :
    mulPoly ep_Q2_008_coefficient_11_0304
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0305 : Poly :=
[
  term ((-2016778576786035544238656254291287683200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 11. -/
def ep_Q2_008_partial_11_0305 : Poly :=
[
  term ((-4033557153572071088477312508582575366400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2016778576786035544238656254291287683200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2016778576786035544238656254291287683200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4033557153572071088477312508582575366400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 11. -/
theorem ep_Q2_008_partial_11_0305_valid :
    mulPoly ep_Q2_008_coefficient_11_0305
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0306 : Poly :=
[
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 306 for generator 11. -/
def ep_Q2_008_partial_11_0306 : Poly :=
[
  term ((-52410090851131464000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-52410090851131464000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 11. -/
theorem ep_Q2_008_partial_11_0306_valid :
    mulPoly ep_Q2_008_coefficient_11_0306
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0307 : Poly :=
[
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 11. -/
def ep_Q2_008_partial_11_0307 : Poly :=
[
  term ((-4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 11. -/
theorem ep_Q2_008_partial_11_0307_valid :
    mulPoly ep_Q2_008_coefficient_11_0307
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0308 : Poly :=
[
  term ((17452351075580607375 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 308 for generator 11. -/
def ep_Q2_008_partial_11_0308 : Poly :=
[
  term ((17452351075580607375 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17452351075580607375 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-17452351075580607375 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((17452351075580607375 : Rat) / 2771825814456705436) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 11. -/
theorem ep_Q2_008_partial_11_0308_valid :
    mulPoly ep_Q2_008_coefficient_11_0308
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0309 : Poly :=
[
  term ((82884424079405599325167140334746706077000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 11. -/
def ep_Q2_008_partial_11_0309 : Poly :=
[
  term ((165768848158811198650334280669493412154000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82884424079405599325167140334746706077000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-82884424079405599325167140334746706077000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((165768848158811198650334280669493412154000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 11. -/
theorem ep_Q2_008_partial_11_0309_valid :
    mulPoly ep_Q2_008_coefficient_11_0309
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0310 : Poly :=
[
  term ((-65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 310 for generator 11. -/
def ep_Q2_008_partial_11_0310 : Poly :=
[
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 11. -/
theorem ep_Q2_008_partial_11_0310_valid :
    mulPoly ep_Q2_008_coefficient_11_0310
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0311 : Poly :=
[
  term ((131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 311 for generator 11. -/
def ep_Q2_008_partial_11_0311 : Poly :=
[
  term ((262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 11. -/
theorem ep_Q2_008_partial_11_0311_valid :
    mulPoly ep_Q2_008_coefficient_11_0311
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0312 : Poly :=
[
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 312 for generator 11. -/
def ep_Q2_008_partial_11_0312 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 11. -/
theorem ep_Q2_008_partial_11_0312_valid :
    mulPoly ep_Q2_008_coefficient_11_0312
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0313 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 11. -/
def ep_Q2_008_partial_11_0313 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 11. -/
theorem ep_Q2_008_partial_11_0313_valid :
    mulPoly ep_Q2_008_coefficient_11_0313
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0314 : Poly :=
[
  term ((-343800635724886500 : Rat) / 692956453614176359) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 314 for generator 11. -/
def ep_Q2_008_partial_11_0314 : Poly :=
[
  term ((-687601271449773000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((343800635724886500 : Rat) / 692956453614176359) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((343800635724886500 : Rat) / 692956453614176359) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-687601271449773000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 11. -/
theorem ep_Q2_008_partial_11_0314_valid :
    mulPoly ep_Q2_008_coefficient_11_0314
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0315 : Poly :=
[
  term ((-1316365328920911750 : Rat) / 692956453614176359) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 315 for generator 11. -/
def ep_Q2_008_partial_11_0315 : Poly :=
[
  term ((-2632730657841823500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1316365328920911750 : Rat) / 692956453614176359) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((1316365328920911750 : Rat) / 692956453614176359) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2632730657841823500 : Rat) / 692956453614176359) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 11. -/
theorem ep_Q2_008_partial_11_0315_valid :
    mulPoly ep_Q2_008_coefficient_11_0315
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0316 : Poly :=
[
  term ((1984168990561160964515315499620456198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 316 for generator 11. -/
def ep_Q2_008_partial_11_0316 : Poly :=
[
  term ((3968337981122321929030630999240912396800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1984168990561160964515315499620456198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1984168990561160964515315499620456198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((3968337981122321929030630999240912396800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 11. -/
theorem ep_Q2_008_partial_11_0316_valid :
    mulPoly ep_Q2_008_coefficient_11_0316
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0317 : Poly :=
[
  term ((-914764636864091199 : Rat) / 191160400997014168) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 317 for generator 11. -/
def ep_Q2_008_partial_11_0317 : Poly :=
[
  term ((-914764636864091199 : Rat) / 95580200498507084) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((914764636864091199 : Rat) / 191160400997014168) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((914764636864091199 : Rat) / 191160400997014168) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-914764636864091199 : Rat) / 95580200498507084) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 11. -/
theorem ep_Q2_008_partial_11_0317_valid :
    mulPoly ep_Q2_008_coefficient_11_0317
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0318 : Poly :=
[
  term ((-42713946060167249599174941576669824217600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 11. -/
def ep_Q2_008_partial_11_0318 : Poly :=
[
  term ((-85427892120334499198349883153339648435200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((42713946060167249599174941576669824217600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((42713946060167249599174941576669824217600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-85427892120334499198349883153339648435200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 11. -/
theorem ep_Q2_008_partial_11_0318_valid :
    mulPoly ep_Q2_008_coefficient_11_0318
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0319 : Poly :=
[
  term ((2500667028453659906686461642780078117178071 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 11. -/
def ep_Q2_008_partial_11_0319 : Poly :=
[
  term ((2500667028453659906686461642780078117178071 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2500667028453659906686461642780078117178071 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2500667028453659906686461642780078117178071 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((2500667028453659906686461642780078117178071 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 11. -/
theorem ep_Q2_008_partial_11_0319_valid :
    mulPoly ep_Q2_008_coefficient_11_0319
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0320 : Poly :=
[
  term ((47778747170882394728723266921589753940000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 320 for generator 11. -/
def ep_Q2_008_partial_11_0320 : Poly :=
[
  term ((95557494341764789457446533843179507880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-47778747170882394728723266921589753940000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-47778747170882394728723266921589753940000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((95557494341764789457446533843179507880000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 11. -/
theorem ep_Q2_008_partial_11_0320_valid :
    mulPoly ep_Q2_008_coefficient_11_0320
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0321 : Poly :=
[
  term ((41796897510254280705 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 321 for generator 11. -/
def ep_Q2_008_partial_11_0321 : Poly :=
[
  term ((41796897510254280705 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41796897510254280705 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-41796897510254280705 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((41796897510254280705 : Rat) / 2771825814456705436) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 11. -/
theorem ep_Q2_008_partial_11_0321_valid :
    mulPoly ep_Q2_008_coefficient_11_0321
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0322 : Poly :=
[
  term ((391585217557235092419500737112544768000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 11. -/
def ep_Q2_008_partial_11_0322 : Poly :=
[
  term ((783170435114470184839001474225089536000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-391585217557235092419500737112544768000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-391585217557235092419500737112544768000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((783170435114470184839001474225089536000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 11. -/
theorem ep_Q2_008_partial_11_0322_valid :
    mulPoly ep_Q2_008_coefficient_11_0322
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0323 : Poly :=
[
  term ((-2703612383767052911267729099897555622911 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 11. -/
def ep_Q2_008_partial_11_0323 : Poly :=
[
  term ((-2703612383767052911267729099897555622911 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2703612383767052911267729099897555622911 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((2703612383767052911267729099897555622911 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (15, 3), (16, 1)],
  term ((-2703612383767052911267729099897555622911 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 11. -/
theorem ep_Q2_008_partial_11_0323_valid :
    mulPoly ep_Q2_008_coefficient_11_0323
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0324 : Poly :=
[
  term ((-22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 324 for generator 11. -/
def ep_Q2_008_partial_11_0324 : Poly :=
[
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (15, 5), (16, 1)],
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 11. -/
theorem ep_Q2_008_partial_11_0324_valid :
    mulPoly ep_Q2_008_coefficient_11_0324
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0325 : Poly :=
[
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 11. -/
def ep_Q2_008_partial_11_0325 : Poly :=
[
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 11. -/
theorem ep_Q2_008_partial_11_0325_valid :
    mulPoly ep_Q2_008_coefficient_11_0325
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0326 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)]
]

/-- Partial product 326 for generator 11. -/
def ep_Q2_008_partial_11_0326 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (14, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (14, 2), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 11. -/
theorem ep_Q2_008_partial_11_0326_valid :
    mulPoly ep_Q2_008_coefficient_11_0326
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0327 : Poly :=
[
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 2), (16, 1)]
]

/-- Partial product 327 for generator 11. -/
def ep_Q2_008_partial_11_0327 : Poly :=
[
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 2), (14, 2), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 2), (15, 2), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 11. -/
theorem ep_Q2_008_partial_11_0327_valid :
    mulPoly ep_Q2_008_coefficient_11_0327
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0328 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 11. -/
def ep_Q2_008_partial_11_0328 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 11. -/
theorem ep_Q2_008_partial_11_0328_valid :
    mulPoly ep_Q2_008_coefficient_11_0328
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0329 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 329 for generator 11. -/
def ep_Q2_008_partial_11_0329 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 11. -/
theorem ep_Q2_008_partial_11_0329_valid :
    mulPoly ep_Q2_008_coefficient_11_0329
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0330 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 11. -/
def ep_Q2_008_partial_11_0330 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 11. -/
theorem ep_Q2_008_partial_11_0330_valid :
    mulPoly ep_Q2_008_coefficient_11_0330
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0331 : Poly :=
[
  term ((-161352313457383549616741451265248000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 331 for generator 11. -/
def ep_Q2_008_partial_11_0331 : Poly :=
[
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((161352313457383549616741451265248000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((161352313457383549616741451265248000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 11. -/
theorem ep_Q2_008_partial_11_0331_valid :
    mulPoly ep_Q2_008_coefficient_11_0331
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0332 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 332 for generator 11. -/
def ep_Q2_008_partial_11_0332 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 11. -/
theorem ep_Q2_008_partial_11_0332_valid :
    mulPoly ep_Q2_008_coefficient_11_0332
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0333 : Poly :=
[
  term ((262909357809972019081396364708668800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 11. -/
def ep_Q2_008_partial_11_0333 : Poly :=
[
  term ((525818715619944038162792729417337600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((525818715619944038162792729417337600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-262909357809972019081396364708668800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-262909357809972019081396364708668800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 11. -/
theorem ep_Q2_008_partial_11_0333_valid :
    mulPoly ep_Q2_008_coefficient_11_0333
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0334 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 334 for generator 11. -/
def ep_Q2_008_partial_11_0334 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 11. -/
theorem ep_Q2_008_partial_11_0334_valid :
    mulPoly ep_Q2_008_coefficient_11_0334
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0335 : Poly :=
[
  term ((2872071179541427183177997832521414400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 335 for generator 11. -/
def ep_Q2_008_partial_11_0335 : Poly :=
[
  term ((5744142359082854366355995665042828800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((5744142359082854366355995665042828800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2872071179541427183177997832521414400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2872071179541427183177997832521414400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 11. -/
theorem ep_Q2_008_partial_11_0335_valid :
    mulPoly ep_Q2_008_coefficient_11_0335
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0336 : Poly :=
[
  term ((-96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 11. -/
def ep_Q2_008_partial_11_0336 : Poly :=
[
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 11. -/
theorem ep_Q2_008_partial_11_0336_valid :
    mulPoly ep_Q2_008_coefficient_11_0336
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0337 : Poly :=
[
  term ((-4745656278158339694610042684272000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 11. -/
def ep_Q2_008_partial_11_0337 : Poly :=
[
  term ((-9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((4745656278158339694610042684272000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((4745656278158339694610042684272000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 11. -/
theorem ep_Q2_008_partial_11_0337_valid :
    mulPoly ep_Q2_008_coefficient_11_0337
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0338 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 338 for generator 11. -/
def ep_Q2_008_partial_11_0338 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 11. -/
theorem ep_Q2_008_partial_11_0338_valid :
    mulPoly ep_Q2_008_coefficient_11_0338
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0339 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 11. -/
def ep_Q2_008_partial_11_0339 : Poly :=
[
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 11. -/
theorem ep_Q2_008_partial_11_0339_valid :
    mulPoly ep_Q2_008_coefficient_11_0339
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0340 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 340 for generator 11. -/
def ep_Q2_008_partial_11_0340 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 11. -/
theorem ep_Q2_008_partial_11_0340_valid :
    mulPoly ep_Q2_008_coefficient_11_0340
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0341 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 11. -/
def ep_Q2_008_partial_11_0341 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 11. -/
theorem ep_Q2_008_partial_11_0341_valid :
    mulPoly ep_Q2_008_coefficient_11_0341
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0342 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 342 for generator 11. -/
def ep_Q2_008_partial_11_0342 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 11. -/
theorem ep_Q2_008_partial_11_0342_valid :
    mulPoly ep_Q2_008_coefficient_11_0342
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0343 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 343 for generator 11. -/
def ep_Q2_008_partial_11_0343 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 11. -/
theorem ep_Q2_008_partial_11_0343_valid :
    mulPoly ep_Q2_008_coefficient_11_0343
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0344 : Poly :=
[
  term ((-26909930646261319935 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 344 for generator 11. -/
def ep_Q2_008_partial_11_0344 : Poly :=
[
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((26909930646261319935 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((26909930646261319935 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 11. -/
theorem ep_Q2_008_partial_11_0344_valid :
    mulPoly ep_Q2_008_coefficient_11_0344
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0345 : Poly :=
[
  term ((1310302138106414146776018708213247709020614 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 11. -/
def ep_Q2_008_partial_11_0345 : Poly :=
[
  term ((2620604276212828293552037416426495418041228 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2620604276212828293552037416426495418041228 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1310302138106414146776018708213247709020614 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1310302138106414146776018708213247709020614 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 11. -/
theorem ep_Q2_008_partial_11_0345_valid :
    mulPoly ep_Q2_008_coefficient_11_0345
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0346 : Poly :=
[
  term ((-5241207543063458914151342146132171500503256 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 346 for generator 11. -/
def ep_Q2_008_partial_11_0346 : Poly :=
[
  term ((-10482415086126917828302684292264343001006512 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10482415086126917828302684292264343001006512 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((5241207543063458914151342146132171500503256 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((5241207543063458914151342146132171500503256 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 11. -/
theorem ep_Q2_008_partial_11_0346_valid :
    mulPoly ep_Q2_008_coefficient_11_0346
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0347 : Poly :=
[
  term ((492263041431685042221 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 347 for generator 11. -/
def ep_Q2_008_partial_11_0347 : Poly :=
[
  term ((492263041431685042221 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((492263041431685042221 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-492263041431685042221 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-492263041431685042221 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 11. -/
theorem ep_Q2_008_partial_11_0347_valid :
    mulPoly ep_Q2_008_coefficient_11_0347
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0348 : Poly :=
[
  term ((478996765503451494843 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 11. -/
def ep_Q2_008_partial_11_0348 : Poly :=
[
  term ((957993531006902989686 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((957993531006902989686 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-478996765503451494843 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-478996765503451494843 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 11. -/
theorem ep_Q2_008_partial_11_0348_valid :
    mulPoly ep_Q2_008_coefficient_11_0348
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0349 : Poly :=
[
  term ((-16145958387756791961 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 349 for generator 11. -/
def ep_Q2_008_partial_11_0349 : Poly :=
[
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((16145958387756791961 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (14, 2), (16, 1)],
  term ((16145958387756791961 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 11. -/
theorem ep_Q2_008_partial_11_0349_valid :
    mulPoly ep_Q2_008_coefficient_11_0349
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0350 : Poly :=
[
  term ((2547418708884960737945741649097393187039175 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 11. -/
def ep_Q2_008_partial_11_0350 : Poly :=
[
  term ((2547418708884960737945741649097393187039175 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2547418708884960737945741649097393187039175 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-2547418708884960737945741649097393187039175 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2547418708884960737945741649097393187039175 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 11. -/
theorem ep_Q2_008_partial_11_0350_valid :
    mulPoly ep_Q2_008_coefficient_11_0350
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0351 : Poly :=
[
  term ((-107746591796229027406773969114609600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 351 for generator 11. -/
def ep_Q2_008_partial_11_0351 : Poly :=
[
  term ((-215493183592458054813547938229219200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-215493183592458054813547938229219200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((107746591796229027406773969114609600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((107746591796229027406773969114609600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 11. -/
theorem ep_Q2_008_partial_11_0351_valid :
    mulPoly ep_Q2_008_coefficient_11_0351
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0352 : Poly :=
[
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 11. -/
def ep_Q2_008_partial_11_0352 : Poly :=
[
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 11. -/
theorem ep_Q2_008_partial_11_0352_valid :
    mulPoly ep_Q2_008_coefficient_11_0352
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0353 : Poly :=
[
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 11. -/
def ep_Q2_008_partial_11_0353 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 11. -/
theorem ep_Q2_008_partial_11_0353_valid :
    mulPoly ep_Q2_008_coefficient_11_0353
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0354 : Poly :=
[
  term ((386266129619036776632568474227288000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 354 for generator 11. -/
def ep_Q2_008_partial_11_0354 : Poly :=
[
  term ((772532259238073553265136948454576000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((772532259238073553265136948454576000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((-386266129619036776632568474227288000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-386266129619036776632568474227288000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 11. -/
theorem ep_Q2_008_partial_11_0354_valid :
    mulPoly ep_Q2_008_coefficient_11_0354
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0355 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 11. -/
def ep_Q2_008_partial_11_0355 : Poly :=
[
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 11. -/
theorem ep_Q2_008_partial_11_0355_valid :
    mulPoly ep_Q2_008_coefficient_11_0355
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0356 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 356 for generator 11. -/
def ep_Q2_008_partial_11_0356 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 11. -/
theorem ep_Q2_008_partial_11_0356_valid :
    mulPoly ep_Q2_008_coefficient_11_0356
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0357 : Poly :=
[
  term ((133988809810668750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 11. -/
def ep_Q2_008_partial_11_0357 : Poly :=
[
  term ((267977619621337500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((267977619621337500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-133988809810668750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-133988809810668750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 11. -/
theorem ep_Q2_008_partial_11_0357_valid :
    mulPoly ep_Q2_008_coefficient_11_0357
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0358 : Poly :=
[
  term ((10730014162376640723213557933791459705201611 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 11. -/
def ep_Q2_008_partial_11_0358 : Poly :=
[
  term ((10730014162376640723213557933791459705201611 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10730014162376640723213557933791459705201611 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10730014162376640723213557933791459705201611 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10730014162376640723213557933791459705201611 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 11. -/
theorem ep_Q2_008_partial_11_0358_valid :
    mulPoly ep_Q2_008_coefficient_11_0358
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0359 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 359 for generator 11. -/
def ep_Q2_008_partial_11_0359 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 2), (14, 2), (16, 1)],
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 11. -/
theorem ep_Q2_008_partial_11_0359_valid :
    mulPoly ep_Q2_008_coefficient_11_0359
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0360 : Poly :=
[
  term ((-5667220383967471498036434816981983544013005 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 360 for generator 11. -/
def ep_Q2_008_partial_11_0360 : Poly :=
[
  term ((-5667220383967471498036434816981983544013005 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5667220383967471498036434816981983544013005 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((5667220383967471498036434816981983544013005 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((5667220383967471498036434816981983544013005 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 11. -/
theorem ep_Q2_008_partial_11_0360_valid :
    mulPoly ep_Q2_008_coefficient_11_0360
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0361 : Poly :=
[
  term ((36496048422325152993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 361 for generator 11. -/
def ep_Q2_008_partial_11_0361 : Poly :=
[
  term ((36496048422325152993 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((36496048422325152993 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-36496048422325152993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-36496048422325152993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 11. -/
theorem ep_Q2_008_partial_11_0361_valid :
    mulPoly ep_Q2_008_coefficient_11_0361
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0362 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 11. -/
def ep_Q2_008_partial_11_0362 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 11. -/
theorem ep_Q2_008_partial_11_0362_valid :
    mulPoly ep_Q2_008_coefficient_11_0362
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0363 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 363 for generator 11. -/
def ep_Q2_008_partial_11_0363 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 11. -/
theorem ep_Q2_008_partial_11_0363_valid :
    mulPoly ep_Q2_008_coefficient_11_0363
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0364 : Poly :=
[
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 11. -/
def ep_Q2_008_partial_11_0364 : Poly :=
[
  term ((-44317218905204031992912270369313309551703 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 11. -/
theorem ep_Q2_008_partial_11_0364_valid :
    mulPoly ep_Q2_008_coefficient_11_0364
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0365 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 365 for generator 11. -/
def ep_Q2_008_partial_11_0365 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 11. -/
theorem ep_Q2_008_partial_11_0365_valid :
    mulPoly ep_Q2_008_coefficient_11_0365
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0366 : Poly :=
[
  term ((2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 366 for generator 11. -/
def ep_Q2_008_partial_11_0366 : Poly :=
[
  term ((2326334950970681373 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((2326334950970681373 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 11. -/
theorem ep_Q2_008_partial_11_0366_valid :
    mulPoly ep_Q2_008_coefficient_11_0366
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0367 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 367 for generator 11. -/
def ep_Q2_008_partial_11_0367 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 11. -/
theorem ep_Q2_008_partial_11_0367_valid :
    mulPoly ep_Q2_008_coefficient_11_0367
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0368 : Poly :=
[
  term ((1824694926321908115 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 368 for generator 11. -/
def ep_Q2_008_partial_11_0368 : Poly :=
[
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824694926321908115 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 11. -/
theorem ep_Q2_008_partial_11_0368_valid :
    mulPoly ep_Q2_008_coefficient_11_0368
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0369 : Poly :=
[
  term ((9216838606328159813265866233152240000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 11. -/
def ep_Q2_008_partial_11_0369 : Poly :=
[
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9216838606328159813265866233152240000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-9216838606328159813265866233152240000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 11. -/
theorem ep_Q2_008_partial_11_0369_valid :
    mulPoly ep_Q2_008_coefficient_11_0369
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0370 : Poly :=
[
  term ((-44422225607867746014761695928969479487703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 11. -/
def ep_Q2_008_partial_11_0370 : Poly :=
[
  term ((-44422225607867746014761695928969479487703 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44422225607867746014761695928969479487703 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((44422225607867746014761695928969479487703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((44422225607867746014761695928969479487703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 11. -/
theorem ep_Q2_008_partial_11_0370_valid :
    mulPoly ep_Q2_008_coefficient_11_0370
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0371 : Poly :=
[
  term ((88861839057820295676654333365239357686606 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 11. -/
def ep_Q2_008_partial_11_0371 : Poly :=
[
  term ((177723678115640591353308666730478715373212 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((177723678115640591353308666730478715373212 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-88861839057820295676654333365239357686606 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-88861839057820295676654333365239357686606 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 11. -/
theorem ep_Q2_008_partial_11_0371_valid :
    mulPoly ep_Q2_008_coefficient_11_0371
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0372 : Poly :=
[
  term ((-83733342599077440969 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 372 for generator 11. -/
def ep_Q2_008_partial_11_0372 : Poly :=
[
  term ((-83733342599077440969 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-83733342599077440969 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((83733342599077440969 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((83733342599077440969 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 11. -/
theorem ep_Q2_008_partial_11_0372_valid :
    mulPoly ep_Q2_008_coefficient_11_0372
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0373 : Poly :=
[
  term ((-3955813502500690270152959640560400048530367 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 11. -/
def ep_Q2_008_partial_11_0373 : Poly :=
[
  term ((-3955813502500690270152959640560400048530367 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3955813502500690270152959640560400048530367 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((3955813502500690270152959640560400048530367 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((3955813502500690270152959640560400048530367 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 11. -/
theorem ep_Q2_008_partial_11_0373_valid :
    mulPoly ep_Q2_008_coefficient_11_0373
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0374 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 374 for generator 11. -/
def ep_Q2_008_partial_11_0374 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 11. -/
theorem ep_Q2_008_partial_11_0374_valid :
    mulPoly ep_Q2_008_coefficient_11_0374
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0375 : Poly :=
[
  term ((-164059727192641244676132418950109872000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 375 for generator 11. -/
def ep_Q2_008_partial_11_0375 : Poly :=
[
  term ((-328119454385282489352264837900219744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-328119454385282489352264837900219744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((164059727192641244676132418950109872000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((164059727192641244676132418950109872000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 11. -/
theorem ep_Q2_008_partial_11_0375_valid :
    mulPoly ep_Q2_008_coefficient_11_0375
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0376 : Poly :=
[
  term ((1094816955793144869 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 376 for generator 11. -/
def ep_Q2_008_partial_11_0376 : Poly :=
[
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 11. -/
theorem ep_Q2_008_partial_11_0376_valid :
    mulPoly ep_Q2_008_coefficient_11_0376
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0377 : Poly :=
[
  term ((5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 11. -/
def ep_Q2_008_partial_11_0377 : Poly :=
[
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 11. -/
theorem ep_Q2_008_partial_11_0377_valid :
    mulPoly ep_Q2_008_coefficient_11_0377
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0378 : Poly :=
[
  term ((16675757782980175292389977161440100149329 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 11. -/
def ep_Q2_008_partial_11_0378 : Poly :=
[
  term ((16675757782980175292389977161440100149329 : Rat) / 23270014048459243500102183208135593751448) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((16675757782980175292389977161440100149329 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16675757782980175292389977161440100149329 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16675757782980175292389977161440100149329 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 11. -/
theorem ep_Q2_008_partial_11_0378_valid :
    mulPoly ep_Q2_008_coefficient_11_0378
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0379 : Poly :=
[
  term ((288689602636402394457860707697294400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 379 for generator 11. -/
def ep_Q2_008_partial_11_0379 : Poly :=
[
  term ((577379205272804788915721415394588800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((577379205272804788915721415394588800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 4), (16, 1)],
  term ((-288689602636402394457860707697294400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-288689602636402394457860707697294400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 11. -/
theorem ep_Q2_008_partial_11_0379_valid :
    mulPoly ep_Q2_008_coefficient_11_0379
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0380 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 11. -/
def ep_Q2_008_partial_11_0380 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 11. -/
theorem ep_Q2_008_partial_11_0380_valid :
    mulPoly ep_Q2_008_coefficient_11_0380
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0381 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 381 for generator 11. -/
def ep_Q2_008_partial_11_0381 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 11. -/
theorem ep_Q2_008_partial_11_0381_valid :
    mulPoly ep_Q2_008_coefficient_11_0381
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0382 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 11. -/
def ep_Q2_008_partial_11_0382 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 11. -/
theorem ep_Q2_008_partial_11_0382_valid :
    mulPoly ep_Q2_008_coefficient_11_0382
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0383 : Poly :=
[
  term ((253842125176384382813822283154464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 11. -/
def ep_Q2_008_partial_11_0383 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-253842125176384382813822283154464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-253842125176384382813822283154464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 11. -/
theorem ep_Q2_008_partial_11_0383_valid :
    mulPoly ep_Q2_008_coefficient_11_0383
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0384 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 384 for generator 11. -/
def ep_Q2_008_partial_11_0384 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 11. -/
theorem ep_Q2_008_partial_11_0384_valid :
    mulPoly ep_Q2_008_coefficient_11_0384
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0385 : Poly :=
[
  term ((-543973375169154027037066892707382400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 11. -/
def ep_Q2_008_partial_11_0385 : Poly :=
[
  term ((-1087946750338308054074133785414764800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1087946750338308054074133785414764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((543973375169154027037066892707382400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((543973375169154027037066892707382400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 11. -/
theorem ep_Q2_008_partial_11_0385_valid :
    mulPoly ep_Q2_008_coefficient_11_0385
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0386 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 386 for generator 11. -/
def ep_Q2_008_partial_11_0386 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 11. -/
theorem ep_Q2_008_partial_11_0386_valid :
    mulPoly ep_Q2_008_coefficient_11_0386
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0387 : Poly :=
[
  term ((-4518389828139642014086036640149459200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 387 for generator 11. -/
def ep_Q2_008_partial_11_0387 : Poly :=
[
  term ((-9036779656279284028172073280298918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9036779656279284028172073280298918400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((4518389828139642014086036640149459200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((4518389828139642014086036640149459200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 11. -/
theorem ep_Q2_008_partial_11_0387_valid :
    mulPoly ep_Q2_008_coefficient_11_0387
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0388 : Poly :=
[
  term ((152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 11. -/
def ep_Q2_008_partial_11_0388 : Poly :=
[
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 11. -/
theorem ep_Q2_008_partial_11_0388_valid :
    mulPoly ep_Q2_008_coefficient_11_0388
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0389 : Poly :=
[
  term ((80743471002140829272124059571408000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 389 for generator 11. -/
def ep_Q2_008_partial_11_0389 : Poly :=
[
  term ((161486942004281658544248119142816000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((161486942004281658544248119142816000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 3), (16, 1)],
  term ((-80743471002140829272124059571408000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-80743471002140829272124059571408000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 11. -/
theorem ep_Q2_008_partial_11_0389_valid :
    mulPoly ep_Q2_008_coefficient_11_0389
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0390 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 390 for generator 11. -/
def ep_Q2_008_partial_11_0390 : Poly :=
[
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 11. -/
theorem ep_Q2_008_partial_11_0390_valid :
    mulPoly ep_Q2_008_coefficient_11_0390
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0391 : Poly :=
[
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 391 for generator 11. -/
def ep_Q2_008_partial_11_0391 : Poly :=
[
  term ((2669859283589517375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2669859283589517375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 11. -/
theorem ep_Q2_008_partial_11_0391_valid :
    mulPoly ep_Q2_008_coefficient_11_0391
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0392 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 11. -/
def ep_Q2_008_partial_11_0392 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 11. -/
theorem ep_Q2_008_partial_11_0392_valid :
    mulPoly ep_Q2_008_coefficient_11_0392
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0393 : Poly :=
[
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 11. -/
def ep_Q2_008_partial_11_0393 : Poly :=
[
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 11. -/
theorem ep_Q2_008_partial_11_0393_valid :
    mulPoly ep_Q2_008_coefficient_11_0393
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0394 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 394 for generator 11. -/
def ep_Q2_008_partial_11_0394 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 11. -/
theorem ep_Q2_008_partial_11_0394_valid :
    mulPoly ep_Q2_008_coefficient_11_0394
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0395 : Poly :=
[
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 11. -/
def ep_Q2_008_partial_11_0395 : Poly :=
[
  term ((28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 11. -/
theorem ep_Q2_008_partial_11_0395_valid :
    mulPoly ep_Q2_008_coefficient_11_0395
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0396 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 396 for generator 11. -/
def ep_Q2_008_partial_11_0396 : Poly :=
[
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 11. -/
theorem ep_Q2_008_partial_11_0396_valid :
    mulPoly ep_Q2_008_coefficient_11_0396
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0397 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 397 for generator 11. -/
def ep_Q2_008_partial_11_0397 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 2), (14, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 11. -/
theorem ep_Q2_008_partial_11_0397_valid :
    mulPoly ep_Q2_008_coefficient_11_0397
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0398 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 11. -/
def ep_Q2_008_partial_11_0398 : Poly :=
[
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 11. -/
theorem ep_Q2_008_partial_11_0398_valid :
    mulPoly ep_Q2_008_coefficient_11_0398
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0399 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 399 for generator 11. -/
def ep_Q2_008_partial_11_0399 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 11. -/
theorem ep_Q2_008_partial_11_0399_valid :
    mulPoly ep_Q2_008_coefficient_11_0399
        ep_Q2_008_generator_11_0300_0399 =
      ep_Q2_008_partial_11_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_11_0300_0399 : List Poly :=
[
  ep_Q2_008_partial_11_0300,
  ep_Q2_008_partial_11_0301,
  ep_Q2_008_partial_11_0302,
  ep_Q2_008_partial_11_0303,
  ep_Q2_008_partial_11_0304,
  ep_Q2_008_partial_11_0305,
  ep_Q2_008_partial_11_0306,
  ep_Q2_008_partial_11_0307,
  ep_Q2_008_partial_11_0308,
  ep_Q2_008_partial_11_0309,
  ep_Q2_008_partial_11_0310,
  ep_Q2_008_partial_11_0311,
  ep_Q2_008_partial_11_0312,
  ep_Q2_008_partial_11_0313,
  ep_Q2_008_partial_11_0314,
  ep_Q2_008_partial_11_0315,
  ep_Q2_008_partial_11_0316,
  ep_Q2_008_partial_11_0317,
  ep_Q2_008_partial_11_0318,
  ep_Q2_008_partial_11_0319,
  ep_Q2_008_partial_11_0320,
  ep_Q2_008_partial_11_0321,
  ep_Q2_008_partial_11_0322,
  ep_Q2_008_partial_11_0323,
  ep_Q2_008_partial_11_0324,
  ep_Q2_008_partial_11_0325,
  ep_Q2_008_partial_11_0326,
  ep_Q2_008_partial_11_0327,
  ep_Q2_008_partial_11_0328,
  ep_Q2_008_partial_11_0329,
  ep_Q2_008_partial_11_0330,
  ep_Q2_008_partial_11_0331,
  ep_Q2_008_partial_11_0332,
  ep_Q2_008_partial_11_0333,
  ep_Q2_008_partial_11_0334,
  ep_Q2_008_partial_11_0335,
  ep_Q2_008_partial_11_0336,
  ep_Q2_008_partial_11_0337,
  ep_Q2_008_partial_11_0338,
  ep_Q2_008_partial_11_0339,
  ep_Q2_008_partial_11_0340,
  ep_Q2_008_partial_11_0341,
  ep_Q2_008_partial_11_0342,
  ep_Q2_008_partial_11_0343,
  ep_Q2_008_partial_11_0344,
  ep_Q2_008_partial_11_0345,
  ep_Q2_008_partial_11_0346,
  ep_Q2_008_partial_11_0347,
  ep_Q2_008_partial_11_0348,
  ep_Q2_008_partial_11_0349,
  ep_Q2_008_partial_11_0350,
  ep_Q2_008_partial_11_0351,
  ep_Q2_008_partial_11_0352,
  ep_Q2_008_partial_11_0353,
  ep_Q2_008_partial_11_0354,
  ep_Q2_008_partial_11_0355,
  ep_Q2_008_partial_11_0356,
  ep_Q2_008_partial_11_0357,
  ep_Q2_008_partial_11_0358,
  ep_Q2_008_partial_11_0359,
  ep_Q2_008_partial_11_0360,
  ep_Q2_008_partial_11_0361,
  ep_Q2_008_partial_11_0362,
  ep_Q2_008_partial_11_0363,
  ep_Q2_008_partial_11_0364,
  ep_Q2_008_partial_11_0365,
  ep_Q2_008_partial_11_0366,
  ep_Q2_008_partial_11_0367,
  ep_Q2_008_partial_11_0368,
  ep_Q2_008_partial_11_0369,
  ep_Q2_008_partial_11_0370,
  ep_Q2_008_partial_11_0371,
  ep_Q2_008_partial_11_0372,
  ep_Q2_008_partial_11_0373,
  ep_Q2_008_partial_11_0374,
  ep_Q2_008_partial_11_0375,
  ep_Q2_008_partial_11_0376,
  ep_Q2_008_partial_11_0377,
  ep_Q2_008_partial_11_0378,
  ep_Q2_008_partial_11_0379,
  ep_Q2_008_partial_11_0380,
  ep_Q2_008_partial_11_0381,
  ep_Q2_008_partial_11_0382,
  ep_Q2_008_partial_11_0383,
  ep_Q2_008_partial_11_0384,
  ep_Q2_008_partial_11_0385,
  ep_Q2_008_partial_11_0386,
  ep_Q2_008_partial_11_0387,
  ep_Q2_008_partial_11_0388,
  ep_Q2_008_partial_11_0389,
  ep_Q2_008_partial_11_0390,
  ep_Q2_008_partial_11_0391,
  ep_Q2_008_partial_11_0392,
  ep_Q2_008_partial_11_0393,
  ep_Q2_008_partial_11_0394,
  ep_Q2_008_partial_11_0395,
  ep_Q2_008_partial_11_0396,
  ep_Q2_008_partial_11_0397,
  ep_Q2_008_partial_11_0398,
  ep_Q2_008_partial_11_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_11_0300_0399 : Poly :=
[
  term ((-16207286434698492000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((43429993245043653267830155937619456000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((377872202839241250 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-80358577533678283313513163028902789388200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4033557153572071088477312508582575366400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52410090851131464000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((17452351075580607375 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((165768848158811198650334280669493412154000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-687601271449773000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2632730657841823500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((3968337981122321929030630999240912396800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-914764636864091199 : Rat) / 95580200498507084) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85427892120334499198349883153339648435200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2500667028453659906686461642780078117178071 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((95557494341764789457446533843179507880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((41796897510254280705 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((783170435114470184839001474225089536000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2703612383767052911267729099897555622911 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((525818715619944038162792729417337600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((5744142359082854366355995665042828800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2620604276212828293552037416426495418041228 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10482415086126917828302684292264343001006512 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((492263041431685042221 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((957993531006902989686 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((2547418708884960737945741649097393187039175 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-215493183592458054813547938229219200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((772532259238073553265136948454576000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((267977619621337500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10730014162376640723213557933791459705201611 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5667220383967471498036434816981983544013005 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((36496048422325152993 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2326334950970681373 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-44422225607867746014761695928969479487703 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((177723678115640591353308666730478715373212 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-83733342599077440969 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3955813502500690270152959640560400048530367 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-328119454385282489352264837900219744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((16675757782980175292389977161440100149329 : Rat) / 23270014048459243500102183208135593751448) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((577379205272804788915721415394588800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1087946750338308054074133785414764800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-9036779656279284028172073280298918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((161486942004281658544248119142816000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2669859283589517375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(2, 1), (4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((525818715619944038162792729417337600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((5744142359082854366355995665042828800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2620604276212828293552037416426495418041228 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((492263041431685042221 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10482415086126917828302684292264343001006512 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((957993531006902989686 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((2547418708884960737945741649097393187039175 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-215493183592458054813547938229219200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((772532259238073553265136948454576000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((267977619621337500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((10730014162376640723213557933791459705201611 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((36496048422325152993 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5667220383967471498036434816981983544013005 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((2326334950970681373 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-44422225607867746014761695928969479487703 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-83733342599077440969 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((177723678115640591353308666730478715373212 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3955813502500690270152959640560400048530367 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-328119454385282489352264837900219744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((16675757782980175292389977161440100149329 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((577379205272804788915721415394588800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 4), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((-1087946750338308054074133785414764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((-9036779656279284028172073280298918400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((161486942004281658544248119142816000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 3), (16, 1)],
  term ((2669859283589517375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21714996622521826633915077968809728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-188936101419620625 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-188936101419620625 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21714996622521826633915077968809728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((40179288766839141656756581514451394694100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((40179288766839141656756581514451394694100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((2016778576786035544238656254291287683200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2016778576786035544238656254291287683200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-17452351075580607375 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-17452351075580607375 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-82884424079405599325167140334746706077000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-82884424079405599325167140334746706077000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((343800635724886500 : Rat) / 692956453614176359) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((1316365328920911750 : Rat) / 692956453614176359) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((1316365328920911750 : Rat) / 692956453614176359) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((343800635724886500 : Rat) / 692956453614176359) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-1984168990561160964515315499620456198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((914764636864091199 : Rat) / 191160400997014168) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((914764636864091199 : Rat) / 191160400997014168) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1984168990561160964515315499620456198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((42713946060167249599174941576669824217600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((42713946060167249599174941576669824217600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2500667028453659906686461642780078117178071 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2500667028453659906686461642780078117178071 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-47778747170882394728723266921589753940000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-41796897510254280705 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-41796897510254280705 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47778747170882394728723266921589753940000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-391585217557235092419500737112544768000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-391585217557235092419500737112544768000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((2703612383767052911267729099897555622911 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((2703612383767052911267729099897555622911 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (15, 3), (16, 1)],
  term ((22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (15, 5), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-16207286434698492000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((377872202839241250 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((43429993245043653267830155937619456000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (14, 2), (16, 1)],
  term ((-33384341056551557240069140712295445702200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4033557153572071088477312508582575366400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-52410090851131464000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((17452351075580607375 : Rat) / 2771825814456705436) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((165768848158811198650334280669493412154000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2632730657841823500 : Rat) / 692956453614176359) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-687601271449773000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-914764636864091199 : Rat) / 95580200498507084) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3968337981122321929030630999240912396800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-85427892120334499198349883153339648435200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2500667028453659906686461642780078117178071 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((41796897510254280705 : Rat) / 2771825814456705436) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((95557494341764789457446533843179507880000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((783170435114470184839001474225089536000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 2), (14, 2), (16, 1)],
  term ((108461417982024493655660915750678390775157 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 2), (16, 1)],
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 4), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (15, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 3), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((161352313457383549616741451265248000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((161352313457383549616741451265248000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-262909357809972019081396364708668800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-262909357809972019081396364708668800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 5), (16, 1)],
  term ((-2872071179541427183177997832521414400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2872071179541427183177997832521414400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((96811388074430129770044870759148800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((4745656278158339694610042684272000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((4745656278158339694610042684272000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (15, 3), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (15, 4), (16, 1)],
  term ((26909930646261319935 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((26909930646261319935 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1310302138106414146776018708213247709020614 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1310302138106414146776018708213247709020614 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((5241207543063458914151342146132171500503256 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-492263041431685042221 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-492263041431685042221 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((5241207543063458914151342146132171500503256 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-478996765503451494843 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-478996765503451494843 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((16145958387756791961 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (14, 2), (16, 1)],
  term ((16145958387756791961 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2547418708884960737945741649097393187039175 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2547418708884960737945741649097393187039175 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((107746591796229027406773969114609600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((107746591796229027406773969114609600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-386266129619036776632568474227288000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-386266129619036776632568474227288000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 5), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-133988809810668750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-133988809810668750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-10730014162376640723213557933791459705201611 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10730014162376640723213557933791459705201611 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 2), (14, 2), (16, 1)],
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((5667220383967471498036434816981983544013005 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-36496048422325152993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-36496048422325152993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((5667220383967471498036434816981983544013005 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (15, 4), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-9216838606328159813265866233152240000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-9216838606328159813265866233152240000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((44422225607867746014761695928969479487703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((44422225607867746014761695928969479487703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-88861839057820295676654333365239357686606 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((83733342599077440969 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((83733342599077440969 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88861839057820295676654333365239357686606 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((3955813502500690270152959640560400048530367 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((3955813502500690270152959640560400048530367 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 5), (16, 1)],
  term ((164059727192641244676132418950109872000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((164059727192641244676132418950109872000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 3), (16, 1)],
  term ((-16675757782980175292389977161440100149329 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-288689602636402394457860707697294400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-16675757782980175292389977161440100149329 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-288689602636402394457860707697294400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 5), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-253842125176384382813822283154464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-253842125176384382813822283154464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 4), (16, 1)],
  term ((543973375169154027037066892707382400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((543973375169154027037066892707382400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 5), (16, 1)],
  term ((4518389828139642014086036640149459200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((4518389828139642014086036640149459200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-152305275105830629688293369892678400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-80743471002140829272124059571408000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-80743471002140829272124059571408000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (15, 4), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 2), (14, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 4), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 3), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 300 through 399. -/
theorem ep_Q2_008_block_11_0300_0399_valid :
    checkProductSumEq ep_Q2_008_partials_11_0300_0399
      ep_Q2_008_block_11_0300_0399 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
